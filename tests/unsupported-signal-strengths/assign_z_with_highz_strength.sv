/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests assignment of value 1'bz with highz strength

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

   // Example:

   assign (weak0, highz1) o = 1'bz;
   // Example end

   always begin
      if (o === 1'z)
        $finish;
   end
endmodule
