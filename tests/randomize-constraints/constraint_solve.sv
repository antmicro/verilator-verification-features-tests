/* *** Issue description

   Variable ordering in constraints is unsupported in Verilator.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    rand bit mode;

    constraint def {
      mode == 1 -> val == 0;
    }
    constraint order {solve mode before val; };
    // Example end
    function new;
      val = 0;
    endfunction
endclass

module top (
    output logic [7:0] o
);
    Cls obj;
    initial begin
       int success;
       for (int i = 0; i < 5; i++) begin
         obj= new;
         success = obj.randomize();
         $display("val = %0b", obj.val);
       end
    end

    assign o = obj.val;
endmodule

