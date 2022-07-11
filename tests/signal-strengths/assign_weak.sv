/* *** Issue description

   Verilator does not support signal strength specifiers.

   *** End of description
*/
module top (
    output logic o
    input logic i
);

    // Example:
	assign (weak0, weak1) o = i;
    // Example end

endmodule
