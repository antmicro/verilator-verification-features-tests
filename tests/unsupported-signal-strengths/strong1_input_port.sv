/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 1 is assigned to o when clk == 1.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example:
   assign (weak0, weak1) o = 0;
   assign (weak0, strong1) o = clk;
   // Example end

   always begin
      if (o === 1)
        $finish;
   end
endmodule
