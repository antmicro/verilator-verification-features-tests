/* *** Issue description

   Range membership constraints declared inside class
   are silently ignored.

   *** End of description
*/
class Cls;
    // Example
    rand logic [7:0] val;
    constraint IsInRange {val inside {[2:8]};}
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

