/* *** Issue description

   Iterative constraints using inside operator are silently ignored.

   *** End of description
*/
class Cls;
  // Example
  rand byte A[5] ;
  constraint C1 { foreach ( A [ i ] ) A[i] inside {3, 5, 7, 11, 13}; }
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
