/* *** Issue description

   Randomization of variables can be disabled by calling rand_mode().
   Verilator fails here with unsupported call on type logic.

   *** End of description
*/
class Cls;
    // Value declaration
    rand logic [7:0] val;
    // Value declaration end
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
       obj= new;
    // Example
       for (int i = 0; i < 5; i++) begin
         success = obj.randomize();
         obj.val.rand_mode(0);
         $display("val = %0b", obj.val);
       end
    // Example end
    end

    assign o = obj.val;
endmodule

