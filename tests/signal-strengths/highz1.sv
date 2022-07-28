/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 1 is replaced by z when strength is highz1.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example:
   assign (weak0, highz1) o = 1;
   // Example end

   always begin
      if (o === 1'z)
        $finish;
   end
endmodule
