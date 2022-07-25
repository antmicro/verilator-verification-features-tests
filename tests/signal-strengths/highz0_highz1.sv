/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if Verilator throws error
   on forbidden strength specifier (28.11).

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
	assign (highz0, highz1) o = clk;
    // Example end
   always begin
      if (o)
        $finish;
   end
endmodule
