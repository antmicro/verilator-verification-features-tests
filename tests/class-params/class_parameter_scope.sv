/* *** Issue description

   Retrieval of parameterized class members is not supported.

   *** End of description
*/
class Hold #(int size = 3);
  parameter logic a = 1;
  logic [size-1:0] data;
endclass


module top (
    output logic o
);
    // Example
    Hold #(7) obj;
    initial begin
      obj = new;
      o = Hold#()::a;
    end
    // Example end

endmodule
