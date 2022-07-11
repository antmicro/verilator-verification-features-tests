/* *** Issue description

   Verilator does not support pre_randomize() method.
   It should be called automatically before randomize() call.

   *** End of description
*/
class Cls;
    rand logic [7:0] val;
    logic did_something;
    function new;
      val = 0;
      did_something = 0;
    endfunction
    // Function definition
    function pre_randomize();
      this.did_something = 1;
    endfunction
    // Function definition end
endclass

module top (
    output logic [7:0] o
);
    Cls obj;
    initial begin
       int success;
       obj= new;
    // Example
       success = obj.randomize();
       $display("did_something = %0b", obj.did_something);
    // Example end
    end

    assign o = obj.val;
endmodule

