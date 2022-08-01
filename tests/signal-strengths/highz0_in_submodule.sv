/* *** Issue description

   Verilator does not support signal strength specifiers.
   This test tests if 0 is replaced by z when strength is highz0
   and the assignemt is in submodule.
   Top module ports in V3Tristate.cpp are handled different than submodule ports.
 
   *** End of description
*/
module top (
    input wire  clk,
    output logic o
);
   sub s (.o(o));
   always begin
      if (o)
        $finish;
   end
endmodule // top

module sub (
    output logic o
);
   wire          a;

   // Example:
   assign (highz0, weak1) a = 0;
   // Example end

   always begin
      if (a === 1'z)
        o = 1;
      else
        o = 0;
   end
endmodule
