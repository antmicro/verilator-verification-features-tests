/* *** Issue description

   Verilator does not support signal strength specifiers.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
   pullup (weak1) (o);
   assign (strong0, weak1) o = 0;
   always begin
      if (!o)
        $finish;
   end
endmodule
