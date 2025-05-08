/* *** Issue description

   Verilator does not support randcase statements.

   *** End of description
*/

module top (
            input clk
);
   int                 cnt0, cnt1, cnt10;
   initial begin
      repeat(1000) begin
         randcase
           0: cnt0++;
           1: cnt1++;
           10: cnt10++;
         endcase
      end
      if (cnt0 != 0) $stop;
      if (cnt1 == 0 || cnt1 > cnt10) $stop;

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
