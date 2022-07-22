/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
   assign (weak0, weak1) o = 1;
   assign (strong0, strong1) o = 0;

   always begin
      if (!o)
        $finish;
   end
endmodule
