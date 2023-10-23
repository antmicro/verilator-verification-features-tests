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
    input clk
);
    Hold h;
    intf i();
    initial begin
        h = new;
        h.signals = i;
        $finish;
    end
endmodule
