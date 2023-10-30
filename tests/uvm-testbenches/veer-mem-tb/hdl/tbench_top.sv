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
  //interface instance
  //---------------------------------------
  mem_if intf(clk,reset);

  //---------------------------------------
  //DUT instance
  //---------------------------------------
//  memory DUT (
//    .clk(intf.clk),
//    .reset(intf.reset),
//    .addr(intf.addr),
//    .wr_en(intf.wr_en),
//    .rd_en(intf.rd_en),
//    .wdata(intf.wdata),
//    .rdata(intf.rdata)
//   );

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
    .dccm_rd_data_hi    (intf.rdata),
    .dccm_rd_data_lo    () // For aligned access same as data_hi
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
