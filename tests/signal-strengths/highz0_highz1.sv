/* *** Issue description

   Verilator does not support signal strength specifiers.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
	assign (highz0, highz1) o = clk;
    // Example end
   always begin
      if (o)
        $finish;
   end
endmodule
