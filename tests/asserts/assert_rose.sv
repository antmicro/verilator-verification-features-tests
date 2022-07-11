/* *** Issue description

   The function :code:`$rose` returns incorrect results in concurrent assertions.

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
    assert property(@(posedge clk) cyc % 2 == 0 |=> $rose(val))
        else begin
            $display("$rose assert failed");
            $stop;
        end
    // Example end
endmodule
