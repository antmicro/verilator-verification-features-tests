/* *** Issue description

   Verilator is unable to parse the :code:`not` keyword in concurrent assertions.

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
    assert property(@(posedge clk) cyc % 2 == 1 |=> (not $rose(val)))
        else begin
            $display("not assert failed");
            $stop;
        end
    // Example end
endmodule
