/* *** Issue description

   Soft constraints may be discarded if the solver fails to find a solution.
   Ensure the solver can relax multiple soft constraints to complete
   randomization.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint def {
      val < 8;
      soft val > 16;
      soft val > 32 && val < 64;
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
         assert (obj.val < 8) else
           $error("Unexpected randomized value: %d", obj.val);
       end
       $finish;
    end

    assign o = obj.val;
endmodule
