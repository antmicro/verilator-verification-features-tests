/* *** Issue description

   Inline constraints in '.randomize() with' are silently ignored.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;

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
         success = obj.randomize() with { val < i[7:0] + 5; };
         $display("val = %0b", obj.val);
         assert (success == 1) else
           $error("Randomize failed with %d", success);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

