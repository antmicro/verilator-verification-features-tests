/* *** Issue description

   Random packed array variables are not supported.

   *** End of description
*/
// Example
class Cls;
    rand logic [4:0] [5:0] a;
endclass
// Example end

module top ();
    Cls obj;
    initial begin
       int success;
       obj= new;
       success = obj.randomize();
       for (int i = 0; i < 4; i++) begin
         $display("a[%d] = %0b", i, obj.a[i]);
       end
    end
endmodule
