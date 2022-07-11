/* *** Issue description

   Conditional constraints are silently ignored.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    rand bit mode;

    constraint def {
      if (mode == 0)
        val > 5;
      else
        val != 1;
    }
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

