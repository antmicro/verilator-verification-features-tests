/* *** Issue description

   Soft constraints may be discarded if the solver fails to find a solution.
   Hard constraints cannot be ignored, so randomization should fail here
   even if soft constraint was relaxed.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint def {
      val < 3;
      soft val > 5;
      val > 100;
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
         assert (success == 0) else
           $error("Randomize expected to fail, but did not - with %d", success);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

