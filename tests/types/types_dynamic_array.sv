/* *** Issue description

   Random dynamic array variables are not supported.

   *** End of description
*/
// Example
class Cls;
  rand byte A[];
endclass
// Example end

module top (input logic clk);
    Cls obj;
    initial begin
       int success;
       obj= new;
       success = obj.randomize();
       for (int i = 0; i < 4; i++) begin
         $display("A[%d] = %0b", i, obj.A[i]);
       end
       $finish;
    end
endmodule
