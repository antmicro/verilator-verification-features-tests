/* *** Issue description

   Covergroup options are rejected by Verilator's parser.

   *** End of description
*/

module top (input logic clk);
    logic[3:0] foo = 0;

    // Example:
    covergroup cg @(posedge clk);
        option.per_instance = 1;
        option.name = "cg";
        coverpoint foo;
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
        if (cyc == 16) $finish;
    end
endmodule

