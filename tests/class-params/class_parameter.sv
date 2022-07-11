/* *** Issue description

   Parameterized classes are not supported.

   *** End of description
*/
// Example
class Hold #(int size = 3);
  logic [size-1:0] data;
endclass
// Example end


module top (
    output logic [7:0] o
);
    Hold #(8) obj;
    initial begin
        obj = new;
    end

endmodule
