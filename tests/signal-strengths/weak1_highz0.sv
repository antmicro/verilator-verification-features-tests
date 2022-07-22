/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests parsing of strength specifiers
   when first strength refers to value 1. It should be supported (10.3.4)

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
	assign (weak1, highz0) o = clk;
    // Example end
   always begin
      if (o)
        $finish;
   end
endmodule
