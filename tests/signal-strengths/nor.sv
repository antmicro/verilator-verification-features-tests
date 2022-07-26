/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests replacing 1 with z by highz1 strength in nor gate.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example from 28.3.2:
   nor (highz1, strong0) n1(o, 0, 0);
    // Example end
   always begin
      if (o === 1'z)
        $finish;
   end
endmodule
