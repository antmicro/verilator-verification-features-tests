/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests parsing of signal strength of pullup.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
   pullup (strong1) (o);
   always begin
      if (o)
        $finish;
   end
endmodule
