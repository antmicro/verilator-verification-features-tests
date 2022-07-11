/* *** Issue description

   Array reduction constraints are silently ignored.

   *** End of description
*/
class Cls;
  // Example
  rand int A[] ;
  constraint c2 { A.sum() with (int'(item) > 0) > A.size()/2; }
  // Example end
endclass

module top ();
    Cls obj;
    initial begin
       int success;
       obj= new;
       success = obj.randomize();
       for (int i = 0; i < 5; i++) begin
         $display("A[%d] = %0b", i, obj.A[i]);
       end
    end
endmodule
