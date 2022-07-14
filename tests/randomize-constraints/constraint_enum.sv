/* *** Issue description

   Enum membership constraints declared inside class
   are silently ignored.

   *** End of description
*/
class Cls;
    // Example
    rand int val;
    typedef enum {ON, OFF} vals_e;
    constraint IsInEnum {val inside {vals_e};}
    // Example end
    function new;
      val = 0;
    endfunction
endclass

module top (
    input clk,
    output int o
);
    Cls obj;
    initial begin
       int success;
       for (int i = 0; i < 50; i++) begin
         obj= new;
         success = obj.randomize();
         $display("val = %0b", obj.val);
         assert (success == 1) else
           $error("Randomize failed with %d", success);
       end
       $finish;
    end

    assign o = obj.val;
endmodule

