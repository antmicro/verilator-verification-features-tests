/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests combination of 2 signals with default strengths.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);
   assign o = 0;
   assign o = 1;
   always begin
      if (o === 1'x)
        $finish;
   end
endmodule
