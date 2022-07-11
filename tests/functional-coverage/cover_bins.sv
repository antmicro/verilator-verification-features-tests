/* *** Issue description

   Coverpoints with bins are rejected by Verilator's parser.

   *** End of description
*/

module top (input logic clk);
    logic[3:0] foo = 0;

    // Example:
    covergroup cg @(posedge clk);
        coverpoint foo {
            bins b0 = {0};
            bins b1 = {1};
            bins b2 = {2};
            bins b4 = {4};
        }
    endgroup
    // Example end

    cg cg_i;

    initial cg_i = new;
    final $display("Coverage: %0.0f%%", cg_i.get_inst_coverage());

    int cyc = 1;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        foo += 2;
        $display("[%0t] foo=%b", $time, foo);
        if (cyc == 16) begin
            if (cg_i.get_inst_coverage() != 75) $stop;
            $finish;
        end
    end
endmodule

