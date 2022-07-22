/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if Verilator throws error when interonnect net is declared with strength.
   It is illegal according to 6.7.1.
   interonnect nets are not supported by Verilator yet.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example:
	interconnect (weak1, weak0) a;
    // Example end
endmodule
