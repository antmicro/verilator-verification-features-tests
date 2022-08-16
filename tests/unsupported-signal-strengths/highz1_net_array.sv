/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 1 is replaced by z when strength is highz1.
   It is like highz1 test, but here we have array of nets.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   wire[4:0]         a;

   // Example:
   assign (weak0, highz1) a = 5'b10101;
   // Example end

   assign o = a[0];
   always begin
      if (a === 5'bz0z0z)
        $finish;
   end
endmodule
