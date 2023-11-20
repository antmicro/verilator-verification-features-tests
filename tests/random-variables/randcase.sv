/* *** Issue description

   Verilator does not support randcase statements.

   *** End of description
*/

module top (
            input clk,
            output int o
);
   int val;
   initial begin
   // Example
     randcase
        3: val = 3;
        1: val = 1;
        10: val = 10;
     endcase
   // Example end
   end

   assign o = val;
endmodule
