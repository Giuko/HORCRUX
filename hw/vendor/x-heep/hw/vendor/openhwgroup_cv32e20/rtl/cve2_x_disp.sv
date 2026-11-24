// Copyright 2021 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

///////////////////////////////////////////////////////////////////////////////////////////////
// Engineer:       Moritz Imfeld - moimfeld@ee.ethz.ch                                       //
// Engineer:       Giuseppe maganuco - s345962@studenti.polito.it (cv32e20 porting)          //
//                                                                                           //
// Design Name:    x-interface dispatcher                                                    //
// Project Name:   cv32e20                                                                  //
// Language:       SystemVerilog                                                             //
//                                                                                           //
// Description:    Dispatcher for sending instructions to the x-interface.                   //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////

module cve2_x_disp
  import cve2_core_v_xif_pkg::*;
(
  // clock and reset
  input logic clk_i,
  input logic rst_ni,

  // compressed interface
  output logic [3:0] x_compressed_id_o,                       // Compressed-instruction identifier used by the XIF compressed interface
  // issue interface
  output logic       x_issue_valid_o,                         // Dispatcher presents a valid instruction to the X unit
  input  logic       x_issue_ready_i,                         // External X unit is ready to accept an issue request
  input  logic       x_issue_resp_accept_i,                   // X unit acceots the issued instruction
  input  logic       x_issue_resp_writeback_i,                // X unit indicates that the issued instruction will later write back a register

  input  logic [              2:0] x_issue_resp_dualread_i,   // indication that an additional register read is required
  input  logic                     x_issue_resp_loadstore_i,  // unused
  output logic [RF_READ_PORTS-1:0] x_issue_req_rs_valid_o,    // Indicates which requested source-register operands are valid and hazard-free
  output logic [              3:0] x_issue_req_id_o,          // Identifier assigned to the issue request
  output logic [              1:0] x_issue_req_mode_o,        // Privilege mode encoded for the XIF issue request
  output logic                     x_issue_req_ecs_valid,     // Indicates that extension-context status information is valid

  // commit interface
  output logic       x_commit_valid_o,                        // Valid commit notification for the X unit
  output logic [3:0] x_commit_id_o,                           // Identifier of the instruction being committed
  output logic       x_commit_commit_kill,                    // hardwired to 0

  // memory (request/response) interface
  input  logic       x_mem_valid_i,                           // External X unit presents a memory request
  output logic       x_mem_ready_o,                           // Dispatcher is ready to accept an X memory request
  input  logic [1:0] x_mem_req_mode_i,                        // unused
  input  logic       x_mem_req_spec_i,                        // unused
  input  logic       x_mem_req_last_i,                        // unused
  output logic       x_mem_resp_exc_o,                        // hardwired to 0
  output logic [5:0] x_mem_resp_exccode_o,                    // hardwired to 0
  output logic       x_mem_resp_dbg_o,                        // hardwired to 0

  // memory result interface
  output logic x_mem_result_valid_o,                          // Indicates that the result of an X memory operation is valid
  output logic x_mem_result_err_o,                            // hardwired to 0

  // result interface
  input  logic       x_result_valid_i,                        // External X unit presents a computational result
  output logic       x_result_ready_o,                        // hardwired to 1
  input  logic [4:0] x_result_rd_i,                           // Destination register of the external X result
  input  logic       x_result_we_i,                           // Indicates that the external X result writes a register

  // scoreboard, dependency check, stall, forwarding
  input  logic [              4:0]      waddr_id_i,           // Destination register of the instruction currently in ID
  input  logic [              4:0]      mem_instr_waddr_ex_i, // Destination register of an EX-stage memory instruction
  input  logic                          mem_instr_we_ex_i,    // Indicates that the EX-stage memory instruction writes a register, normally a load
  input  logic [              2:0]      regs_used_i,          // Indicates which source registers of the current X instruction are used
  input  logic                          branch_or_jump_i,     // Indicates that the current instruction is a branch or jump
  input  logic                          instr_valid_i,        // Current ID instruction is valid
  input  logic [              2:0][4:0] x_rs_addr_i,          // Source-register addresses requested by the current X instruction

  // memory request core-internal status signals
  output logic x_mem_data_req_o,                              // Indicates that an X memory request has been accepted and must enter the core LSU path
  input  logic x_mem_instr_wb_i,                              // Indicates that the instruction currently completing in WB is an X memory instruction
  input  logic wb_ready_i,                                    // WB/LSU stage is ready to complete the current result

  // additional status signals
  output logic                    x_stall_o,                  // Requests that the ID stage stall because of X
  output logic                    x_illegal_insn_o,           // Indicates that the current instruction remains illegal after X issue handling
  input  logic                    x_illegal_insn_dec_i,       // Decoder identifies the current instruction as illegal, possible X instruction
  input  logic                    x_control_illegal_reset_i,  // Clears the dispatcher’s stored illegal-instruction state after controller handling
  input  logic                    id_ready_i,                 // ID stage has completed or released the current instruction
  input  logic                    ex_valid_i,                 // EX stage currently contains a valid instruction/result
  input  logic                    ex_ready_i,                 // EX stage can accept a new instruction or X memory request
  input  cve2_pkg::priv_lvl_e     current_priv_lvl_i,         // Current processor privilege level used to encode the XIF issue mode
  input  logic                    data_req_dec_i              // Decoder identifies the current instruction as a data-memory operation
);

  // scoreboard, id and satus signals
  logic [31:0] scoreboard_q, scoreboard_d;
  logic [3:0] id_q, id_d;
  logic instr_offloaded_q, instr_offloaded_d;
  logic [3:0] mem_counter_q, mem_counter_d;
  logic dep;
  logic outstanding_mem;
  logic x_if_not_ready;
  logic x_if_memory_instr;
  logic x_issue_illegal;
  logic x_illegal_insn_q, x_illegal_insn_n;

  // issue interface
  assign x_issue_valid_o = x_illegal_insn_dec_i & ~branch_or_jump_i & ~instr_offloaded_q & instr_valid_i;
  assign x_issue_req_id_o = id_q;
  generate
    if (X_DUALREAD != 0) begin
      assign x_issue_req_rs_valid_o[0] = (~scoreboard_q[x_rs_addr_i[0]])
                                         & ~(x_rs_addr_i[0] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[1] = (~scoreboard_q[x_rs_addr_i[1]])
                                         & ~(x_rs_addr_i[1] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[2] = (~scoreboard_q[x_rs_addr_i[2]])
                                         & ~(x_rs_addr_i[2] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[3] = (~scoreboard_q[x_rs_addr_i[0] | 5'b00001])
                                         & ~((x_rs_addr_i[0] | 5'b00001) == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[4] = (~scoreboard_q[x_rs_addr_i[1] | 5'b00001])
                                         & ~((x_rs_addr_i[1] | 5'b00001) == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[5] = (~scoreboard_q[x_rs_addr_i[2] | 5'b00001])
                                         & ~((x_rs_addr_i[2] | 5'b00001) == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_ecs_valid = 1'b0;  // extension context status is not implemented in cve2
    end else begin
      assign x_issue_req_rs_valid_o[0] = (~scoreboard_q[x_rs_addr_i[0]])
                                         & ~(x_rs_addr_i[0] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[1] = (~scoreboard_q[x_rs_addr_i[1]])
                                         & ~(x_rs_addr_i[1] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_rs_valid_o[2] = (~scoreboard_q[x_rs_addr_i[2]])
                                         & ~(x_rs_addr_i[2] == mem_instr_waddr_ex_i & mem_instr_we_ex_i);
      assign x_issue_req_ecs_valid = 1'b0;  // extension context status is not implemented in cve2
    end
  endgenerate
  // commit interface
  assign x_commit_valid_o = x_issue_valid_o;
  assign x_commit_id_o = id_q;
  assign x_commit_commit_kill = 1'b0;

  // memory (req/resp) interface
  assign x_mem_ready_o = ex_ready_i;
  assign x_mem_resp_exc_o = 1'b0;
  assign x_mem_resp_exccode_o = '0;
  assign x_mem_resp_dbg_o = 1'b0;

  // memory result channel
  assign x_mem_result_valid_o = x_mem_instr_wb_i & wb_ready_i;
  assign x_mem_result_err_o = 1'b0;

  // result channel
  assign x_result_ready_o = 1'b1;

  // core internal memory request signal
  assign x_mem_data_req_o = x_mem_valid_i & x_mem_ready_o;

  // core stall signal
  assign x_stall_o = dep | outstanding_mem | x_if_not_ready | x_if_memory_instr;

  assign outstanding_mem = data_req_dec_i & (mem_counter_q != '0);
  assign x_if_memory_instr = x_mem_data_req_o & ~(x_issue_valid_o & x_issue_ready_i);
  assign x_if_not_ready = x_issue_valid_o & ~x_issue_ready_i;

  // forwarding
  // not available in cv32e20
  // dependency
  generate
    if(X_DUALREAD != 0) begin
      assign dep = ~x_illegal_insn_n & ((regs_used_i[0] & scoreboard_q[x_rs_addr_i[0]] & (x_result_rd_i != x_rs_addr_i[0])) |
                                        (regs_used_i[1] & scoreboard_q[x_rs_addr_i[1]] & (x_result_rd_i != x_rs_addr_i[1])) |
                                        (regs_used_i[2] & scoreboard_q[x_rs_addr_i[2]] & (x_result_rd_i != x_rs_addr_i[2])) |
                                        (((regs_used_i[0] & x_issue_resp_dualread_i[0])       & 
                                              scoreboard_q[x_rs_addr_i[0] | 5'b00001]         &
                                              (x_result_rd_i != (x_rs_addr_i[0] | 5'b00001))) & x_issue_resp_dualread_i[0]) |
                                        (((regs_used_i[1] & x_issue_resp_dualread_i[1])       & 
                                              scoreboard_q[x_rs_addr_i[1] | 5'b00001]         &
                                              (x_result_rd_i != (x_rs_addr_i[1] | 5'b00001))) & x_issue_resp_dualread_i[1]) |
                                        (((regs_used_i[2] & x_issue_resp_dualread_i[2])       & 
                                              scoreboard_q[x_rs_addr_i[2] | 5'b00001]         &
                                              (x_result_rd_i != (x_rs_addr_i[2] | 5'b00001))) & x_issue_resp_dualread_i[2]));


    end else begin
      assign dep = ~x_illegal_insn_n & ( (regs_used_i[0] & scoreboard_q[x_rs_addr_i[0]] & (x_result_rd_i != x_rs_addr_i[0])) |
                    (regs_used_i[1] & scoreboard_q[x_rs_addr_i[1]] & (x_result_rd_i != x_rs_addr_i[1])) |
                    (regs_used_i[2] & scoreboard_q[x_rs_addr_i[2]] & (x_result_rd_i != x_rs_addr_i[2])));
    end
  endgenerate

  // id generation
  assign x_compressed_id_o = id_d;
  always_comb begin
    id_d = id_q;
    if (x_issue_valid_o & x_issue_ready_i) begin
      id_d = id_q + 4'b0001;
    end
  end

  // assign operation mode according to PrivLvl_t
  always_comb begin
    x_issue_req_mode_o = 2'b11;
    case (current_priv_lvl_i)
      cve2_pkg::PRIV_LVL_M: x_issue_req_mode_o = 2'b11;
      cve2_pkg::PRIV_LVL_H: x_issue_req_mode_o = 2'b10;
      cve2_pkg::PRIV_LVL_S: x_issue_req_mode_o = 2'b01;
      cve2_pkg::PRIV_LVL_U: x_issue_req_mode_o = 2'b00;
      default:                   x_issue_req_mode_o = 2'b11;
    endcase
  end

  // scoreboard update
  always_comb begin
    scoreboard_d = scoreboard_q;
    if (x_issue_resp_writeback_i & x_issue_valid_o & x_issue_ready_i
        & ~((waddr_id_i == x_result_rd_i) & x_result_valid_i & (x_result_rd_i != '0))) begin
      scoreboard_d[waddr_id_i] = 1'b1;
    end
    if (x_result_valid_i & x_result_we_i) begin
      scoreboard_d[x_result_rd_i] = 1'b0;
    end
  end

  // status signal that indicates if an instruction has already been offloaded
  always_comb begin
    instr_offloaded_d = instr_offloaded_q;
    if (id_ready_i) begin
      instr_offloaded_d = 1'b0;
    end else if (x_issue_valid_o & x_issue_ready_i) begin
      instr_offloaded_d = 1'b1;
    end
  end

  // illegal instruction assignment
  assign x_issue_illegal = x_illegal_insn_dec_i & ~instr_offloaded_q & instr_valid_i;
  always_comb begin
    x_illegal_insn_n = 1'b0;
    if (x_issue_illegal & x_issue_ready_i & ~x_issue_resp_accept_i) begin
      x_illegal_insn_n = 1'b1;
    end
  end
  assign x_illegal_insn_o = x_illegal_insn_q;

  // scoreboard and status signal register
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni) begin
      scoreboard_q      <= '0;
      instr_offloaded_q <= 1'b0;
      id_q              <= '0;
      mem_counter_q     <= '0;
      x_illegal_insn_q  <= 1'b0;
    end else begin
      scoreboard_q      <= scoreboard_d;
      instr_offloaded_q <= instr_offloaded_d;
      id_q              <= id_d;
      mem_counter_q     <= mem_counter_d;
      if (x_control_illegal_reset_i) begin
        x_illegal_insn_q <= 1'b0;
      end else begin
        x_illegal_insn_q <= x_illegal_insn_n;
      end
    end
  end


  always_comb begin
    mem_counter_d = mem_counter_q;
    if ((x_issue_valid_o & x_issue_ready_i & x_issue_resp_loadstore_i) & ~(x_mem_valid_i & x_mem_ready_o) ) begin
      mem_counter_d = mem_counter_q + 4'b0001;
    end else if (~(x_issue_valid_o & x_issue_ready_i & x_issue_resp_loadstore_i) & (x_mem_valid_i & x_mem_ready_o)) begin
      mem_counter_d = mem_counter_q - 4'b0001;
    end
  end

endmodule : cve2_x_disp
