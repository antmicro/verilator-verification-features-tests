/* *** Issue description

   Covergroups with cross coverage are rejected by Verilator's parser.

   *** End of description
*/

module top (input logic clk);
    logic[1:0] foo = 0;
    logic[1:0] bar = 0;

    // Example:
    covergroup cg @(posedge clk);
        cp_foo: coverpoint foo;
        cp_bar: coverpoint bar;
        cross cp_foo, cp_bar;
    endgroup
    // Example end

    cg cg_i;

    initial cg_i = new;
    final $display("Coverage: %0.0f%%", cg_i.get_inst_coverage());

    int cyc = 1;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        foo -= 1;
        bar += 1;
        $display("[%0t] foo=%b, bar=%b, %0.0f%%", $time, foo, bar, cg_i.get_inst_coverage());
        if (cyc == 8) begin
            if (cg_i.get_inst_coverage() != 75) $stop;
            $finish;
        end

    end
endmodule

