/* *** Issue description

   Make sure soft constraints behave correctly when unused.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint def {
      val < 32;
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
       end
       $finish;
    end

    assign o = obj.val;
endmodule
