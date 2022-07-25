/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal isn't replaced by weaker.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
   pullup (strong1) (o);
   assign (weak0, weak1) o = 0;
   always begin
      if (o)
        $finish;
   end
endmodule
