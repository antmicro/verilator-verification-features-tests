/* *** Issue description

   Soft constraints may be discarded if the solver fails to find a solution.
   Test that correct constraint is relaxed in mixed declaration.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint def {
      val < 32;
      soft val > 64;
      val > 16;
      soft val < 64;
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
         assert (obj.val > 16 && obj.val < 32) else
           $error("Unexpected randomized value: %d", obj.val);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

