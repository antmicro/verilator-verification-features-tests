/* *** Issue description

   Inheritance of parameterized classes is not supported.

   *** End of description
*/
// Example
class Hold #(int len = 3);
  local logic [len-1:0] data;
endclass

class Holder extends Hold #(7);
endclass;
// Example end

module top (
    output logic [7:0] o
);
    Holder obj;
    initial begin
        obj = new;
    end

endmodule
