// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0

module t(input logic clk);
    int cyc = 0;
    logic val = 0;

    // No assert in this test, but every variable X in an assert is $sampled(X)
    always @(posedge clk) begin
        cyc <= cyc + 1;

        if (val != $sampled(val))
            $stop;

        val = ~val;

        if (val == $sampled(val))
            $stop;

        $display("t=%0t   cyc=%0d   val=%b", $time, cyc, val);
        if (cyc > 10) $finish;
    end
endmodule
