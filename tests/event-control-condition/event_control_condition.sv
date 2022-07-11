/* *** Issue description

   Verilator does not support conditional expressions in event control
   statements. Such expressions get rejected by Verilator's parser. Also, event
   event control statements in any location other than at the top of an
   :code:`always` process are unsupported, subject to change in Verilator 5.

   *** End of description
*/
module top(input logic clk);
    int cyc = 0;

    int a = 8;
    int b = 4;

    initial begin
        @(a + b == 12);  // This gets triggered after first assignment to a and b
        $display("First event control triggered; a=%0d, b=%0d", a, b); 
        if (a + b == 12) $stop;
    end

    // Example:
    initial begin
        @(a + b == 24);
        $display("Condition met! a=%0d, b=%0d", a, b); 
        if (a + b != 24) $stop;
        $finish;
    end
    // Example end

    always @(posedge clk) begin
        cyc <= cyc + 1;
        a++;
        b += 2;
        if (a + b > 24) $stop;
    end
endmodule
