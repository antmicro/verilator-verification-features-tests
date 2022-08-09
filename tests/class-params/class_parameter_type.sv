/* *** Issue description

   Type parameters in classes are reported as errors on usage.

   *** End of description
*/
// Example
class Hold #(type T = int);
  local T [4:0] data;
endclass
// Example end


module top (
    input clk,
    output logic [7:0] o
);
    Hold #(logic) obj;
    initial begin
        obj = new;
        $finish;
    end

endmodule
