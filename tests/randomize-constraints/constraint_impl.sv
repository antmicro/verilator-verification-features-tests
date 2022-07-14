/* *** Issue description

   Implication in constraints is silently ignored.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    rand bit mode;

    constraint def {
      mode == 0 -> val > 5;
      mode != 0 -> val != 1;
    }
    // Example end
    function new;
      val = 0;
    endfunction
endclass

module top (
    input clk,
    output logic [7:0] o
);
    Cls obj;
    initial begin
       int success;
       for (int i = 0; i < 50; i++) begin
         obj= new;
         success = obj.randomize();
         $display("val = %0b", obj.val);
         assert (success == 1) else
           $error("Randomize failed with %d", success);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

