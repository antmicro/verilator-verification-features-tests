/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if Verilator throws error on assignment with only one strength specifier.
   It is illegal according to 10.3.4.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
	assign (strong1) o = 1;
    // Example end
endmodule
