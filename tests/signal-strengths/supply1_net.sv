/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests parsing of supply1 net.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
        supply1 supply1_net;
    // Example end
   assign o = supply1_net;
   always begin
      if (o)
        $finish;
   end
endmodule
