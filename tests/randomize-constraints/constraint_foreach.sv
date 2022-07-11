/* *** Issue description

   Iterative constraints are silently ignored, declaration of random array fails.

   *** End of description
*/
class Cls;
  // Example
  rand byte A[5] ;
  constraint C2 { foreach ( A [ j ] ) A[j] > 5 * j; }
  // Example end
endclass

module top ();
    Cls obj;
    initial begin
       int success;
       obj= new;
       success = obj.randomize();
       for (int i = 0; i < 5; i++) begin
         $display("A[%d] = %0d", i, obj.A[i]);
       end
    end
endmodule
