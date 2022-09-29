/* *** Issue description

   Verilator's parser rejects named properties.
   It is the same case as assert_named,
   but here the property arguments are explicitly typed.

   *** End of description
*/
module top(input logic clk);
    int cyc = 0;
    logic val = 0;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        val = ~val;
        $display("t=%0t   cyc=%0d   val=%b", $time, cyc, val);
        if (cyc > 10) $finish;
    end

    // Example:
    property check(int cyc_mod_2, logic expected);
        @(posedge clk)
        cyc % 2 == cyc_mod_2 |=> val == expected;
    endproperty

    assert property(check(0, 1))
        else begin
            $display("even assert failed");
            $stop;
        end
    assert property(check(1, 0))
        else begin
            $display("odd assert failed");
            $stop;
        end
    // Example end
endmodule
