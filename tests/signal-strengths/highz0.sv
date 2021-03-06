/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 0 is replaced by z when strength is highz0.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example:
   assign (highz0, weak1) o = 0;
   // Example end

   always begin
      if (o === 1'z)
        $finish;
   end
endmodule
