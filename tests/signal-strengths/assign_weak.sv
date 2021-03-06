/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests parsing only.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example begin
   assign (weak0, weak1) o = clk;
   // Example end

   always begin
      if (o)
        $finish;
   end
endmodule
