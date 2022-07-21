/* *** Issue description

   Verilator does not support signal strength specifiers.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);
   assign o = 0;
   assign o = 1;
   always begin
      if (o === 1'x)
        $finish;
   end
endmodule
