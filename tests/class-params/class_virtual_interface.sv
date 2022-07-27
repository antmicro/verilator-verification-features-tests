/* *** Issue description

   Virtual interfaces are not supported by Verilator.

   *** End of description
*/

interface intf;
endinterface

  // Example
class Hold ;
  virtual interface intf signals;
endclass
  // Example end


module top (
    input clk,
    interface intf
);
    initial $finish;
endmodule
