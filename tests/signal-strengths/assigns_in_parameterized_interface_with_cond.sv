/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if stronger signal overwrites the weaker in parametrized interface.

   *** End of description
*/
interface inter (output wire a);
   parameter W;
   // Example:
   wire (weak0, weak1) [W-1:0] b = '1;
   assign (strong0, strong1) b = 1 ? 'b0 : 'bz;

   assign a = b[10];

endinterface // inter

module top (
    input wire clk,
    output wire o
);
   inter #(.W(32)) i(.a(o));
   
   always begin
      if (!o)
        $finish;
   end
endmodule
