/* *** Issue description

   Verilator does not support post_randomize() method.
   It should be called automatically after randomize() call.

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
    function post_randomize();
      this.did_something = 1;
    endfunction
    // Function definition end
endclass

module top (
            input              clk
);
    Cls obj;
    initial begin
       int success;
       obj= new;
    // Example
       success = obj.randomize();
       if (success == 1 && obj.did_something) begin
          $write("*-* All Finished *-*\n");
          $finish;
       end else begin
          $stop;
       end
    // Example end
    end
endmodule
