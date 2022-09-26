/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
   assign (weak0, weak1) o = 1'b0;
   assign (weak0, weak1) o = 1'bz;
   assign (strong0, strong1) o = 1;

   always begin
      if (o)
        $finish;
   end
endmodule
