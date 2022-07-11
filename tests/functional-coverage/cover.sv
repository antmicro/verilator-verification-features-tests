/* *** Issue description

   Covergroups and coverpoints are rejected by Verilator's parser.

   *** End of description
*/

module top (input logic clk);
    logic[3:0] foo = 0;
    logic[11:0] bar = 0;

    // Example:
    covergroup cg;
        coverpoint foo;
    endgroup

    cg cg_i;

    initial cg_i = new;
    final $display("Coverage: %0.0f%%", cg_i.get_inst_coverage());
    // Example end

    int cyc = 1;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        foo += 2;
        bar += (1 << 12) / 16;
        cg_i.sample();
        $display("[%0t] foo=%b bar=%b", $time, foo, bar);
        if (cyc == 32) begin
            if (cg_i.get_inst_coverage() != 50) $stop;
            $finish;
        end
    end
endmodule

