/* *** Issue description

   Virtual interfaces are not supported by Verilator.

   *** End of description
*/

interface intf;
endinterface

module top (
    input clk
);
    virtual interface intf signals;
    virtual intf signals2;
    initial $finish;
endmodule
