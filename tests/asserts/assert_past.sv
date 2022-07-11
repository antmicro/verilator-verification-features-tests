/* *** Issue description

   The function :code:`$past` returns incorrect values in concurrent assertions.
   This function is the most important one, as all other sampled value functions
   make use of it.

   *** End of description
*/
module top(input logic clk);
    int cyc = 0;
    logic val = 0;
    // Example:
    always @(posedge clk) begin
        cyc <= cyc + 1;
        val = ~val;
        $display("t=%0t   cyc=%0d   val=%b", $time, cyc, val);
        if (cyc > 10) $finish;
    end
    assert property(@(posedge clk) cyc % 2 == 0 |=> $past(val) == 0)
        else begin
            $display("t=%0t  $past assert 1 failed, %0d %0d", $time, cyc, val);
            $stop;
        end
    assert property(@(posedge clk) cyc % 2 == 1 |=> $past(val) == 1)
        else begin
            $display("$t=%0t  past assert 2 failed, %0d %0d", $time, cyc, val);
            $stop;
        end
    // Example end
endmodule
