/* *** Issue description

   Type aliases of parametrized classes in said classes are not supported.

   *** End of description
*/
// Example
class SelfRefClassIntParam #(int P=1);
   typedef SelfRefClassIntParam #(10) self_int_t;
endclass
// Example end


module top (
    input clk,
    output logic [7:0] o
);
    SelfRefClassIntParam src1;
    SelfRefClassIntParam#(1)::self_int_t src10;
    initial begin
        src1 = new;
        src10 = new;
        if (src1.P != 1) $stop;
        if (src10.P != 10) $stop;
        $finish;
    end

endmodule
