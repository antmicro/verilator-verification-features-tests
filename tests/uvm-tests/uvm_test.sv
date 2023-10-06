import uvm_pkg::*;
`include "uvm_macros.svh"

class C#(parameter type E) extends E;
    `uvm_component_utils(C#(E))

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
        `uvm_info("RESULT", "Created new uvm class", UVM_LOW);
    endfunction
endclass

module top;
    initial begin
       if ($test$plusargs("empty")) begin
          
       end else if ($test$plusargs("uvm_agent")) begin 
          C#(uvm_agent) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_component")) begin 
          C#(uvm_component) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_driver")) begin 
          C#(uvm_driver) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_env")) begin 
          C#(uvm_env) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_monitor")) begin 
          C#(uvm_monitor) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_scoreboard")) begin 
          C#(uvm_scoreboard) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_sequencer")) begin 
          C#(uvm_sequencer) obj;
          obj = new("C");
       end else if ($test$plusargs("uvm_test")) begin 
          C#(uvm_test) obj;
          obj = new("C");
       end else begin
          $display("Unknown parameter");
          $stop;
       end
    end
endmodule
