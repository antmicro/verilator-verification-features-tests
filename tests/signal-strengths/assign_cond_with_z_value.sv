/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests assignment with condition, in which one of values is 'z

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example:

   assign (weak0, weak1) o = clk === 1'b1 ? 1'b0 : 1'bz;
   // Example end

   always begin
      if (o === 1'bz)
        $finish;
   end
endmodule
