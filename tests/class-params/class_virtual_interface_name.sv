/* *** Issue description

   Virtual interface declaration reported as error: virtual data members are not supported.

   *** End of description
*/

  // Example
interface intf;
endinterface

class Hold ;
  virtual intf signals;
endclass
  // Example end


module top (
    interface intf
);
endmodule
