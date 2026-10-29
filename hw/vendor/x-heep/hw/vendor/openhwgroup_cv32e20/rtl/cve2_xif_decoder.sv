`ifdef CV_X_IF

// XIF dedicated decoder to be implemented onto the cv32e20
module cve2_xif_decoder #()(
  input  logic [31:0] instr_i,
  input  logic        instr_is_compressed_i,
  output logic        xif_insn_cadidate_o,
  output logic [4:0]  rs1_addr_o,
  output logic [4:0]  rs2_addr_o,
  output logic [4:0]  rs3_addr_o,
  output logic [4:0]  rd_addr_o,
  output logic [2:0]  rs_valid_o
);
  import horcrux_pkg::*;

  // HORCRUX R4-type instructions (e.g. KSTART, KABSORB, BFNTTK/D/F,
  // MODP_MONTYMUL, and LOAD) use a genuine third source register:
  // rs3 = instr_i[31:27]. The three source operands are carried through
  // CV-X-IF as issue_req.rs[0], issue_req.rs[1], and issue_req.rs[2].
  //
  //  31       27 26   25 24        20 19        15 14    12 11         7 6      0
  // +-----------+-------+------------+------------+--------+------------+--------+
  // |    rs3    |funct2|    rs2     |    rs1     | funct3 |     rd     | opcode |
  // +-----------+-------+------------+------------+--------+------------+--------+

  logic [NbInstr-1:0] instruction_match;

  // Match every valid instruction entry in the HORCRUX package table.
  // Unused entries in the fixed-size table have a zero mask and must not
  // match every instruction.
  for (genvar i = 0; i < NbInstr; i++) begin : gen_instruction_match
    assign instruction_match[i] = (CoproInstr[i].mask != '0) && 
		                          ((CoproInstr[i].mask & instr_i) == CoproInstr[i].instr);
  end

  always_comb begin
    xif_insn_cadidate_o = 1'b0;
    rs1_addr_o          = instr_i[19:15];
    rs2_addr_o          = instr_i[24:20];
    rs3_addr_o          = '0;
    rd_addr_o           = instr_i[11:7];
    rs_valid_o          = '0;

    if (!instr_is_compressed_i) begin
      for (int unsigned i = 0; i < NbInstr; i++) begin
        if (instruction_match[i]) begin
          xif_insn_cadidate_o = 1'b1;
		  rs_valid_o = CoproInstr[i].resp.register_read;

          // register_read[2] identifies the R4-type instructions that use rs3.
          if (CoproInstr[i].resp.register_read[2]) begin
            rs3_addr_o = instr_i[31:27];
          end
        end
      end
    end
  end
endmodule
`endif
