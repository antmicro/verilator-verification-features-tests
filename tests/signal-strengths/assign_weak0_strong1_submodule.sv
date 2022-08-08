/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker in submodule.

   *** End of description
*/
module sub (output wire a);
   // Example:
   assign (weak0, weak1) a = 0;
   assign (strong0, strong1) a = 1;

endmodule // sub

module top (
    input wire clk,
    output wire o
);
   sub u_sub (.a(o));
   
   always begin
      if (o)
        $finish;
   end
endmodule
