/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker.
   Here the strongest is x. Such value isn't fully supported by Verilator,
   but we can check if it overwrites 1 (and some other test tests if stronger 1 overwwrites 0).

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
   assign (weak0, weak1) o = 0;
   assign (pull0, pull1) o = 1;
   assign (strong0, strong1) o = 1'bx;

   always begin
      if (o !== 1)
        $finish;
   end
endmodule
