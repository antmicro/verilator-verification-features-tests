//-------------------------------------------------------------------------
//						mem_seq_item - www.verificationguide.com
//-------------------------------------------------------------------------

class mem_seq_item extends uvm_sequence_item;

 `include "el2_param.vh" ;

  //---------------------------------------
  //data and control fields
  //---------------------------------------
  rand bit [pt.DCCM_BITS-1:0] addr;
  rand bit       wr_en;
  rand bit       rd_en;
  rand bit [pt.DCCM_FDATA_WIDTH-1:0] wdata;
       bit [pt.DCCM_FDATA_WIDTH-1:0] rdata;

  //---------------------------------------
  //Utility and Field macros
  //---------------------------------------
  `uvm_object_utils_begin(mem_seq_item)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wr_en,UVM_ALL_ON)
    `uvm_field_int(rd_en,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_object_utils_end

  //---------------------------------------
  //Constructor
  //---------------------------------------
  function new(string name = "mem_seq_item");
    super.new(name);
  endfunction

endclass
