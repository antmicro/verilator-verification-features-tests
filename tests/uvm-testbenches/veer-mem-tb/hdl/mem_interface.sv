//-------------------------------------------------------------------------
//						mem_interface - www.verificationguide.com
//-------------------------------------------------------------------------

interface mem_if (input logic clk,reset);

 `include "el2_param.vh" ;

  //---------------------------------------
  //declaring the signals
  //---------------------------------------
  logic [pt.DCCM_BITS-1:0] addr;
  logic wr_en;
  logic rd_en;
  logic [pt.DCCM_FDATA_WIDTH-1:0] wdata;
  logic [pt.DCCM_FDATA_WIDTH-1:0] rdata;

endinterface
