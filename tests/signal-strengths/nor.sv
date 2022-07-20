/* *** Issue description

   Verilator does not support signal strength specifiers.

   *** End of description
*/
module top (
    input logic clk,
    output logic o
);

    // Example from 28.3.2:
   nor (highz1, strong0) n1(o, clk, 0);
    // Example end
   always begin
      if (o == 1'z)
        $finish;
   end
endmodule
