/* *** Issue description

   Type aliases of parametrized classes in said classes are not supported.

   *** End of description
*/
// Example
class SelfRefClassTypeParam #(type T=logic);
   typedef SelfRefClassTypeParam #(int) self_int_t;
   T field;
endclass
// Example end


module top (
    input clk,
    output logic [7:0] o
);
    SelfRefClassTypeParam src_logic;
    SelfRefClassTypeParam::self_int_t src_int;
    initial begin
        src_int = new;
        src_logic = new;
        if ($bits(src_logic.field) != 1) $stop;
        if ($bits(src_int.field) != 32) $stop;
        $finish;
    end

endmodule
