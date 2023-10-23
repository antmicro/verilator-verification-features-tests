/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker in parametrized interface.

   *** End of description
*/
interface inter (input logic cond, output wire a);
   parameter W = 15;
   // Example:
   wire (weak0, weak1) [W-1:0] b = 0;
   assign (strong0, strong1) b = cond ? '1 : 'z;

   assign a = b[W - 5];

endinterface // inter

module sub (inter i, output wire b);
   assign b = i.a;
endmodule // sub

module top (
    input wire clk,
    output wire o
);
   wire         c;
   inter i(.cond(1'b1), .a(c));
   sub u_sub (.i(i), .b(o));
   
   always begin
      if (o)
        $finish;
   end
endmodule
