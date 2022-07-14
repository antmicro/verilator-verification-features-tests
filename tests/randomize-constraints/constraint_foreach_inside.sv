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

module top (
    input clk
);
    Cls obj;
    initial begin
        int success;
        for (int i = 0; i < 50; i++) begin
             obj= new;
             success = obj.randomize();
             for (int i = 0; i < 5; i++) begin
                 $display("A[%d] = %0d", i, obj.A[i]);
             end
             assert (success == 1) else
                 $error("Randomize failed with %d", success);
        end
        $finish;
    end
endmodule
