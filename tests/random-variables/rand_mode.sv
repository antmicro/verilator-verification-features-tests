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
            input              clk
);
    Cls obj;
    initial begin
       int success;
       logic [7:0] val;
       obj= new;
       success = obj.randomize();
       if (success != 1) $stop;
       val = obj.val;
       obj.val.rand_mode(0);
       for (int i = 0; i < 5; i++) begin
          success = obj.randomize();
          if (obj.val != val) $stop;
          if (success != 1) $stop;
       end
       $write("*-* All Finished *-*\n");
       $finish;
    end
endmodule

