/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests overwrites of assignments.
   First assignment is stronger than 2 next ones.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
   assign (strong0, strong1) o = 1;
   assign (weak0, weak1) o = 0;
   assign (pull0, pull1) o = 0;

   always begin
      if (o)
        $finish;
   end
endmodule
