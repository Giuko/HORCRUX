// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

/**
 * Writeback passthrough
 *
 * The writeback stage is not present therefore this module acts as
 * a simple passthrough to write data direct to the register file.
 */

`include "prim_assert.sv"
`include "dv_fcov_macros.svh"

module cve2_wb
  import cve2_pkg::*;
  import cve2_core_v_xif_pkg::*;
#(
  parameter COREV_X_IF = 0
) (
  input  logic                     clk_i,
  input  logic                     rst_ni,
  input  logic                     en_wb_i,

  input  logic                     instr_is_compressed_id_i,
  input  logic                     instr_perf_count_id_i,

  output logic                     perf_instr_ret_wb_o,
  output logic                     perf_instr_ret_compressed_wb_o,

  input  logic [4:0]               rf_waddr_id_i,
  input  logic [31:0]              rf_wdata_id_i,
  input  logic                     rf_we_id_i,

  input  logic [31:0]              rf_wdata_lsu_i,
  input  logic                     rf_we_lsu_i,

  output logic [4:0]               rf_waddr_wb_o,
  output logic [31:0]              rf_wdata_wb_o,
  output logic                     rf_we_wb_o,

  input logic                      lsu_resp_valid_i,
  input logic                      lsu_resp_err_i,

  // eXtension
  input logic                      x_result_valid_i,
  input logic                      x_result_we_i,
  input logic [4:0]                x_result_rd_i,
  input logic [31:0]               x_result_data_i
);

  import cve2_pkg::*;

  // 0 == RF write from ID
  // 1 == RF write from LSU
  // 2 == RF write from X
  logic [31:0] rf_wdata_wb_mux    [3];
  logic [2:0]  rf_wdata_wb_mux_we;

  // without writeback stage just pass through register write signals
  assign rf_waddr_wb_o = rf_wdata_wb_mux_we[2] ? x_result_rd_i : rf_waddr_id_i;
  
  assign rf_wdata_wb_mux[0]    = rf_wdata_id_i;
  assign rf_wdata_wb_mux_we[0] = rf_we_id_i;

  // Increment instruction retire counters for valid instructions which are not lsu errors.
  assign perf_instr_ret_wb_o                 = instr_perf_count_id_i & en_wb_i &
                                               ~(lsu_resp_valid_i & lsu_resp_err_i);
  assign perf_instr_ret_compressed_wb_o      = perf_instr_ret_wb_o & instr_is_compressed_id_i;

  assign rf_wdata_wb_mux[1]    = rf_wdata_lsu_i;
  assign rf_wdata_wb_mux_we[1] = rf_we_lsu_i;

  // eXtension
  generate
    if(COREV_X_IF != 0) begin : gen_x_wb
      assign rf_wdata_wb_mux[2]    = x_result_data_i;
      assign rf_wdata_wb_mux_we[2] = x_result_we_i;
    end else begin
      assign rf_wdata_wb_mux[2]    = 32'd0;
      assign rf_wdata_wb_mux_we[2] = 1'b0;
    end
  endgenerate


  // RF write data can come from ID results (all RF writes that aren't because of loads will come
  // from here) or the LSU (RF writes for load data)
  // or from eXtension
  assign rf_wdata_wb_o = ({32{rf_wdata_wb_mux_we[0]}} & rf_wdata_wb_mux[0]) |
                         ({32{rf_wdata_wb_mux_we[1]}} & rf_wdata_wb_mux[1]) |
                         ({32{rf_wdata_wb_mux_we[2]}} & rf_wdata_wb_mux[2]);
  assign rf_we_wb_o    = |rf_wdata_wb_mux_we;

  `ifndef SYNTHETIZED
  always @(*) begin
    if(x_result_we_i) begin
      $display("[HORCRUX] WriteBack addr: 0x%x, data: 0x%x", rf_waddr_id_i, rf_wdata_id_i);
    end
  end
`endif 

  `ASSERT(RFWriteFromOneSourceOnly, $onehot0(rf_wdata_wb_mux_we))
endmodule
