// Copyright 2022 OpenHW Group
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

// crheepto top-level

`ifdef VERILATOR
`define TOP u_crheepto_top
`else
`define TOP u_tb_system.u_crheepto_top
`endif

// task for loading 'mem' with SystemVerilog system task $readmemh()
export "DPI-C" task tb_readHEX;
export "DPI-C" task tb_loadHEX;
export "DPI-C" task tb_getMemSize;
export "DPI-C" task tb_set_exit_loop;

import core_v_mini_mcu_pkg::*;

function bit tb_check_if_any_not_X(logic [31:0] input_word);
  for(int unsigned i = 0; i < 32; i=i+1) begin
    if ( input_word[i] !== 1'bx ) return 1;
  end
  return 0;
endfunction


task tb_getMemSize;
  output int mem_size;
  output int num_banks;
  mem_size  = core_v_mini_mcu_pkg::MEM_SIZE;
  num_banks = core_v_mini_mcu_pkg::NUM_BANKS;
endtask

task tb_readHEX;
  input string file;
  output logic [7:0] stimuli[core_v_mini_mcu_pkg::MEM_SIZE];
  $readmemh(file, stimuli);
endtask

task tb_loadHEX;
  input string file;
  //whether to use debug to write to memories
  logic [7:0] stimuli[core_v_mini_mcu_pkg::MEM_SIZE];
  int i, stimuli_base, w_addr, NumBytes, NumBanks;
  logic [31:0] addr;
  logic [31:0] word;
  int write_res;

  tb_readHEX(file, stimuli);
  tb_getMemSize(NumBytes, NumBanks);

`ifdef LOADHEX_DBG

`ifdef VERILATOR
  $fatal("ERR! LOADHEX_DBG not supported in Verilator");
`endif

  for (i = 0; i < NumBytes; i = i + 4) begin

    if( tb_check_if_any_not_X({stimuli[i+3], stimuli[i+2], stimuli[i+1], stimuli[i]}) ) begin
      @(posedge `TOP.u_core_v_mini_mcu.clk_i);
      addr = i;
      #1;
      // write to memory
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_req_o = 1'b1;
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_addr_o = addr;
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_we_o = 1'b1;
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_be_o = 4'b1111;
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_wdata_o = {
        stimuli[i+3], stimuli[i+2], stimuli[i+1], stimuli[i]
      };

      while(!`TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_gnt_i) begin
        @(posedge `TOP.u_core_v_mini_mcu.clk_i);
      end

      #1;
      force `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_req_o = 1'b0;

      wait (`TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_rvalid_i);

      #1;
    end

  end

  release `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_req_o;
  release `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_addr_o;
  release `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_we_o;
  release `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_be_o;
  release `TOP.u_core_v_mini_mcu.debug_subsystem_i.dm_obi_top_i.master_wdata_o;

`else // LOADHEX_DBG

  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 0) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram0(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 1) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram1(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 2) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram2(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 3) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram3(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 4) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram4(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 5) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram5(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 6) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram6(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 7) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram7(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 8) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram8(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 9) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram9(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 10) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram10(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 11) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram11(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 12) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram12(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 13) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram13(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 14) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram14(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=0; i < 524288; i = i + 4) begin
    if (((i/4) & 15) == 15) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram15(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 0) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram16(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 1) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram17(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 2) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram18(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 3) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram19(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 4) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram20(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 5) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram21(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 6) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram22(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 7) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram23(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 8) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram24(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 9) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram25(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 10) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram26(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 11) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram27(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 12) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram28(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 13) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram29(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 14) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram30(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end
  for (i=524288; i < 1048576; i = i + 4) begin
    if (((i/4) & 15) == 15) begin
      w_addr = ((i/4) >> 4) % 8192;
      tb_writetoSram31(w_addr, stimuli[i+3], stimuli[i+2],
                                          stimuli[i+1], stimuli[i]);
    end
  end

`ifndef VERILATOR
  // Release memory signals
  tb_releaseSram0();
  tb_releaseSram1();
  tb_releaseSram2();
  tb_releaseSram3();
  tb_releaseSram4();
  tb_releaseSram5();
  tb_releaseSram6();
  tb_releaseSram7();
  tb_releaseSram8();
  tb_releaseSram9();
  tb_releaseSram10();
  tb_releaseSram11();
  tb_releaseSram12();
  tb_releaseSram13();
  tb_releaseSram14();
  tb_releaseSram15();
  tb_releaseSram16();
  tb_releaseSram17();
  tb_releaseSram18();
  tb_releaseSram19();
  tb_releaseSram20();
  tb_releaseSram21();
  tb_releaseSram22();
  tb_releaseSram23();
  tb_releaseSram24();
  tb_releaseSram25();
  tb_releaseSram26();
  tb_releaseSram27();
  tb_releaseSram28();
  tb_releaseSram29();
  tb_releaseSram30();
  tb_releaseSram31();

`endif // VERILATOR

`endif // LOADHEX_DBG
endtask

task tb_writetoSram0;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram1;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram2;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram3;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram4;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram5;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram6;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram7;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram8;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram9;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram10;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram11;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram12;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram13;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram14;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram15;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram16;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram17;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram18;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram19;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram20;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram21;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram22;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram23;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram24;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram25;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram26;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram27;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram28;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram29;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram30;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask
task tb_writetoSram31;
  input int addr;
  input [7:0] val3;
  input [7:0] val2;
  input [7:0] val1;
  input [7:0] val0;

`ifdef VCS
  force `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.tc_ram_i.sram[addr];
`else
`ifndef SYNTHESIS
  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.tc_ram_i.sram[addr] = {
    val3, val2, val1, val0
  };
`else
  parameter numWordAddr = 13;
  parameter numRowAddr = 9;
  parameter numCMAddr = 4;

  logic [numWordAddr-numCMAddr-1:0] iRowAddr;
  logic [numCMAddr-1:0] iColAddr;

  assign iRowAddr = addr[numWordAddr-1:numCMAddr];
  assign iColAddr = addr[numCMAddr-1:0];

  `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.genblk2_sram_i.MEMORY[iRowAddr][iColAddr] = {
    val3, val2, val1, val0
  };
`endif
`endif
endtask

`ifndef VERILATOR

function void tb_releaseSram0;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram0_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram1;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram1_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram2;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram2_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram3;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram3_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram4;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram4_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram5;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram5_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram6;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram6_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram7;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram7_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram8;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram8_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram9;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram9_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram10;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram10_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram11;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram11_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram12;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram12_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram13;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram13_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram14;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram14_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram15;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram15_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram16;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram16_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram17;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram17_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram18;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram18_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram19;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram19_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram20;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram20_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram21;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram21_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram22;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram22_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram23;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram23_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram24;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram24_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram25;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram25_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram26;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram26_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram27;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram27_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram28;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram28_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram29;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram29_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram30;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram30_i.genblk2_sram_i.MEMORY;
`endif
endfunction
function void tb_releaseSram31;
`ifndef SYNTHESIS
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.tc_ram_i.sram;
`else
  release `TOP.u_core_v_mini_mcu.memory_subsystem_i.ram31_i.genblk2_sram_i.MEMORY;
`endif
endfunction

`endif // VERILATOR


task tb_set_exit_loop;
`ifdef VCS
  force `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.testbench_set_exit_loop[0] = 1'b1;
  release `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.testbench_set_exit_loop[0];
`elsif VERILATOR
  `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.testbench_set_exit_loop[0] = 1'b1;
`else
  `ifndef SYNTHESIS
    `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.testbench_set_exit_loop[0] = 1'b1;
  `else
    // careful this code may change after synthesis
    while ( 1 ) begin
      // NOTE: do not remove the following line. It prevents the wait()
      // statement from detecting the request on a clock edge, that results in
      // the rdata signal being set for the *next* cycle instead of the current
      // one.
      #1;
      wait ( `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.reg_req_i[69] );  //this should be the valid signals
      if ( `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.reg_req_i[35:34] == 2'b11 ) begin //this should be the address 2000_000C
        force `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.reg_rsp_o[0] = 1'b1;
        @(posedge `TOP.u_core_v_mini_mcu.clk_i);
        release `TOP.u_core_v_mini_mcu.ao_peripheral_subsystem_i.soc_ctrl_i.reg_rsp_o;
        break;
      end else @(posedge `TOP.u_core_v_mini_mcu.clk_i);
    end
  `endif
`endif
endtask

