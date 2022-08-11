/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 2nd assignment (stronger one) overwrites the 1st.

   *** End of description
*/
module top (
    input wire clk,
    output wire o
);

    // Example:
   assign (weak0, weak1) o = 1;
   if (1)
     assign (strong0, strong1) o = 0;

   always begin
      if (!o)
        $finish;
   end
endmodule
