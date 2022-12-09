/* *** Issue description

   Soft constraints may be discarded in order of declaration.
   This test makes sure that the constraint defined last is kept.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint def {
      soft val == 5;
      soft val == 10;
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
         assert (obj.val == 10) else
           $error("Unexpected randomized value: %d", obj.val);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

