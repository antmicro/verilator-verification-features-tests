/* *** Issue description

   Verilator does not support signal strength specifiers.

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
      if (o == 1)
        $finish;
   end
endmodule
