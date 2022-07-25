/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests parsing of strength specifiers in net declaration assignment.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
        wire (strong1, pull0) mynet = clk;
    // Example end
   assign o = mynet;
   always begin
      if (o)
        $finish;
   end
endmodule
