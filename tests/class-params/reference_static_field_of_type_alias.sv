/* *** Issue description

   References of static members of type aliases of param classes don't work

   *** End of description
*/
// Example
class ClsStatic;
   static int   x = 1;
endclass

class ClsParam #(type T);
   typedef T param_t;
endclass
// Example end

module top (
    input clk,
    output logic [7:0] o
);
   initial begin
      if (ClsParam#(ClsStatic)::param_t::x != 1) $stop;
      else $finish;
   end

endmodule
