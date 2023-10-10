import uvm_pkg::*;
`include "uvm_macros.svh"

class Simple#(parameter type E) extends E;
    `uvm_component_utils(Simple#(E))

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("RESULT", "Created new uvm class", UVM_LOW);
    endfunction
endclass

class Complex#(parameter type E) extends E;
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("RESULT", "new uvm_class created", UVM_LOW);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("RESULT", "build phase completed", UVM_LOW);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("RESULT", "connect phase completed", UVM_LOW);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info("RESULT", "end of elaboration phase completed", UVM_LOW);
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info("RESULT", "start of simulation phase completed", UVM_LOW);
    endfunction

    task run_phase(uvm_phase phase);
        `uvm_info("RESULT", "run phase phase completed", UVM_LOW);
    endtask

    virtual function void extract_phase(uvm_phase phase);
        super.extract_phase(phase);
        `uvm_info("RESULT", "extract phase completed", UVM_LOW);
    endfunction

    virtual function void check_phase(uvm_phase phase);
        super.check_phase(phase);
        `uvm_info("RESULT", "check phase completed", UVM_LOW);
    endfunction

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("RESULT", "report phase completed", UVM_LOW);
    endfunction
endclass

class Cls;
endclass

class ReadByName extends uvm_env;
    Cls obj;

    `uvm_component_utils(ReadByName)

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        if(uvm_resource_db#(Cls)::read_by_name(
            get_full_name(), "obj", obj)) begin
            `uvm_info("RESULT", "read_by_name successful", UVM_LOW);
        end
        else begin
            `uvm_error("RESULT", "read_by_name failed");
        end
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        phase.drop_objection(this);
    endtask

endclass

class MyUvmSequence extends uvm_sequence;
    function new(string name);
        super.new(name);
    endfunction

    virtual task pre_body();
        `uvm_info (get_type_name(), "pre_body()", UVM_LOW)
    endtask

    virtual task pre_do(bit is_item);
        `uvm_info (get_type_name(), "pre_do()", UVM_LOW)
    endtask

    virtual function void mid_do(uvm_sequence_item this_item);
        `uvm_info (get_type_name(), "mid_do()", UVM_LOW)
    endfunction

    virtual task body();
        `uvm_info (get_type_name(), "body()", UVM_LOW)
    endtask

    virtual function void post_do(uvm_sequence_item this_item);
        `uvm_info (get_type_name(), "post_do()", UVM_LOW)
    endfunction

    virtual task post_body();
        `uvm_info (get_type_name(), "post_body()", UVM_LOW)
    endtask
endclass

class MyUvmTest extends uvm_test;
    `uvm_component_utils(MyUvmTest)

    function new(string name, uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("RESULT", "SUCCESS, MyUvmTest called", UVM_LOW);
        phase.drop_objection(this);
    endtask
endclass

module top;
    initial begin
       if ($test$plusargs("empty")) begin
          
       end else if ($test$plusargs("simple_uvm_agent")) begin
          Simple#(uvm_agent) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_component")) begin
          Simple#(uvm_component) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_driver")) begin
          Simple#(uvm_driver) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_env")) begin
          Simple#(uvm_env) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_monitor")) begin
          Simple#(uvm_monitor) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_scoreboard")) begin
          Simple#(uvm_scoreboard) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_sequencer")) begin
          Simple#(uvm_sequencer) obj;
          obj = new("C");
       end else if ($test$plusargs("simple_uvm_test")) begin
          Simple#(uvm_test) obj;
          obj = new("C");
       end else if ($test$plusargs("complex_uvm_agent")) begin
          Complex#(uvm_agent) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_component")) begin
          Complex#(uvm_component) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_driver")) begin
          Complex#(uvm_driver) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_env")) begin
          Complex#(uvm_env) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_monitor")) begin
          Complex#(uvm_monitor) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_scoreboard")) begin
          Complex#(uvm_scoreboard) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_sequencer")) begin
          Complex#(uvm_sequencer) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("complex_uvm_test")) begin
          Complex#(uvm_test) obj;
          obj = new("C");
          run_test();
       end else if ($test$plusargs("uvm_sequence")) begin
          MyUvmSequence seq;
          seq = new("MyUvmSequence");
       end else if ($test$plusargs("uvm_resource_db")) begin
          ReadByName environment;
          Cls obj;
          environment = new("ReadByName");
          uvm_resource_db#(Cls)::set("ReadByName", "obj", obj);
          run_test();
       end else if ($test$plusargs("uvm_test_run_test")) begin
          run_test("MyUvmTest");
       end else begin
          $display("Unknown parameter");
          $stop;
       end
    end
endmodule
