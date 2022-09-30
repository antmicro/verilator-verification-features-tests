/* *** Issue description

   Generic interfaces are not supported by Verilator.

   *** End of description
*/

interface intf;
endinterface

module top (
    input clk,
    interface intf
);
    initial $finish;
endmodule
