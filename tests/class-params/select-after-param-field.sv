/* *** Issue description

   Select operation in a method throws error if a method is declared after a field with a reference to a parameter

   *** End of description
*/

class Sum #(type T);
   static int sum;
endclass

// Example
class ClsWithParamField;
   int m_field = Sum#(int)::sum;
   int m_queue[$];

   function int get(int index);
      return m_queue[index];
   endfunction
endclass
// Example end


module top (
    input clk,
    output logic [7:0] o
);
    ClsWithParamField cls_param_field;
    initial begin
       cls_param_field = new;
       cls_param_field.m_queue = '{1, 5, 7};
       if (cls_param_field.get(2) != 7) $stop;
       $finish;
    end

endmodule
