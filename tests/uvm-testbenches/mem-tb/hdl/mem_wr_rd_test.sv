//-------------------------------------------------------------------------
//						mem_write_read_test - www.verificationguide.com
//-------------------------------------------------------------------------
class mem_wr_rd_test extends mem_model_base_test;

  `uvm_component_utils(mem_wr_rd_test)

  //---------------------------------------
  // sequence instance
  //---------------------------------------
  wr_rd_sequence seq;

  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name = "mem_wr_rd_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new

  //---------------------------------------
  // build_phase
  //---------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create the sequence
    seq = wr_rd_sequence::type_id::create("seq");
  endfunction : build_phase

  //---------------------------------------
  // run_phase - starting the test
  //---------------------------------------
  task run_phase(uvm_phase phase);

    phase.raise_objection(this);
      seq.start(env.mem_agnt.sequencer);
    phase.drop_objection(this);

  endtask : run_phase

endclass : mem_wr_rd_test
