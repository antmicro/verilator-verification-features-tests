/* *** Issue description

   Coverpoints with the :code:`iff` keyword are rejected by Verilator's parser.

   *** End of description
*/

module top (input logic clk);
    logic[15:0] bar = 0;
    logic enable = 0;

    // Example:
    covergroup cg @(posedge clk);
        coverpoint bar iff enable {
            bins b[4] = {[1:4]};
        }
    endgroup
    // Example end

    cg cg_i;

    initial cg_i = new;
    final $display("Coverage: %0.0f%%", cg_i.get_inst_coverage());

    int cyc = 1;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        if (cyc % 2 == 0) enable = ~enable;
        bar <<= 1;
        if (bar == '0) bar = 1;
        $display("[%0t] bar=%b, enable=%b, %0.0f%%", $time, bar, enable, cg_i.get_inst_coverage());
        if (cyc == 16) begin
            if (cg_i.get_inst_coverage() != 50) $stop;
            $finish;
        end
    end
endmodule

