/* *** Issue description

   Retrieval of parameterized class members is not supported.

   *** End of description
*/
class Hold #(int size = 3);
  parameter logic a = 1;
  logic [size-1:0] data;
endclass


module top (
    input clk,
    output logic o
);
    // Example
    Hold #(7) obj;
    initial begin
      obj = new;
      o = Hold#()::a;
      $finish;
    end
    // Example end

endmodule
