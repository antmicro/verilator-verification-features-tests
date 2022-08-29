/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker in parametrized submodule.

   *** End of description
*/
module sub (output wire a);
   parameter W;
   // Example:
   wire (weak0, weak1) [W-1:0] b = 0;
   assign (strong0, strong1) b = '1;

   assign a = b[50];

endmodule // sub

module top (
    input wire clk,
    output wire o
);
   sub #(.W(100)) u_sub (.a(o));
   
   always begin
      if (o)
        $finish;
   end
endmodule
