/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests $display task calling with strength format.
   Strength format is described in 21.2.1.5.

    The output should be:
   Strength of signal o is St1

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);
   assign (strong1, weak0) o = 1;

   initial begin;
      $display("Strength of signal o is %v\n", o);
   end

   always begin
      if (o === 1'1)
        $finish;
   end
endmodule
