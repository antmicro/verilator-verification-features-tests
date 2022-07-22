/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if Verilator throws error on illegal strength specifier.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
	assign (strong1, strong1) o = clk;
    // Example end
   always begin
      if (o)
        $finish;
   end
endmodule
