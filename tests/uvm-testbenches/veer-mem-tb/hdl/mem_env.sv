//-------------------------------------------------------------------------
//						mem_env - www.verificationguide.com
//-------------------------------------------------------------------------

`include "mem_agent.sv"
`include "mem_scoreboard.sv"

class mem_model_env extends uvm_env;

  //---------------------------------------
  // agent and scoreboard instance
  //---------------------------------------
  mem_agent      mem_agnt;
  mem_scoreboard mem_scb;

  `uvm_component_utils(mem_model_env)

  //---------------------------------------
  // constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  //---------------------------------------
  // build_phase - crate the components
  //---------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    mem_agnt = mem_agent::type_id::create("mem_agnt", this);
    mem_scb  = mem_scoreboard::type_id::create("mem_scb", this);
  endfunction : build_phase

  //---------------------------------------
  // connect_phase - connecting monitor and scoreboard port
  //---------------------------------------
  function void connect_phase(uvm_phase phase);
    mem_agnt.monitor.item_collected_port.connect(mem_scb.item_collected_export);
  endfunction : connect_phase

endclass : mem_model_env
