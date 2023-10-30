//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------

`include "uvm_pkg.sv"

import uvm_pkg::*;
//---------------------------------------------------------------
//including interfcae and testcase files
`include "mem_interface.sv"
`include "mem_base_test.sv"
`include "mem_wr_rd_test.sv"
//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;

  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;

  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 1;
    #5 reset =0;
  end

  //---------------------------------------
  //trace dump
  //---------------------------------------
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tbench_top);
  end

  //---------------------------------------
  //interface instance
  //---------------------------------------
  mem_if intf(clk,reset);

  //---------------------------------------
  //DUT instance
  //---------------------------------------

  el2_lsu_dccm_mem DUT (
    .clk                (intf.clk),
    .active_clk         (intf.clk),
    .rst_l              (~intf.reset),
    .clk_override       (1'b0),
    .scan_mode          (1'b0),

    .dccm_wren          (intf.wr_en),
    .dccm_rden          (intf.rd_en),
    .dccm_wr_addr_hi    (intf.addr),
    .dccm_wr_addr_lo    (intf.addr),
    .dccm_rd_addr_hi    (intf.addr),
    .dccm_rd_addr_lo    (intf.addr),
    .dccm_wr_data_hi    (intf.wdata),
    .dccm_wr_data_lo    (intf.wdata),
    .dccm_rd_data_hi    (), // For aligned read/write this should match the lo part
    .dccm_rd_data_lo    (intf.rdata)
  );

  //---------------------------------------
  //passing the interface handle to lower heirarchy using set method
  //and enabling the wave dump
  //---------------------------------------
  initial begin
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(),"*","vif",intf);
  end

  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin
    run_test();
  end

endmodule
