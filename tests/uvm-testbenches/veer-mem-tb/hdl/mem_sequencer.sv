//-------------------------------------------------------------------------
//						mem_sequencer - www.verificationguide.com
//-------------------------------------------------------------------------

// In Verilator, user should always use:
//     uvm_sequencer#(mem_seq_item,mem_seq_item);
// instead standard (other simulators):
//     uvm_sequencer#(mem_seq_item);

`ifdef VERILATOR
class mem_sequencer extends uvm_sequencer#(mem_seq_item,mem_seq_item);
`else
class mem_sequencer extends uvm_sequencer#(mem_seq_item);
`endif

  `uvm_component_utils(mem_sequencer)

  //---------------------------------------
  //constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

endclass
