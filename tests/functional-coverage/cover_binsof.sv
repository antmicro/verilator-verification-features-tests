/* *** Issue description

   Cross coverage with the :code:`binsof` keyword are rejected by Verilator's
   parser.

   *** End of description
*/

module top (input logic clk);
    logic[3:0] foo = 0;
    logic[7:0] bar = 0;

    // Example:
    covergroup cg @(posedge clk);
        cp_foo: coverpoint foo {
            bins f0 = {0};
            bins f1 = {1};
            bins f2 = {2};
            bins f4 = {4};
        }
        cp_bar: coverpoint bar {
            bins b1 = {[0:31]};
            bins b2 = {[32:63]};
            bins b3 = {[64:95]};
            bins b4 = {[96:127]};
        }
        cross cp_foo, cp_bar {
            bins fxb = binsof(cp_foo) && binsof(cp_bar);
        }
    endgroup
    // Example end

    cg cg_i;

    initial cg_i = new;
    final $display("Coverage: %0.0f%%", cg_i.get_inst_coverage());

    int cyc = 1;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        foo += 1;
        bar += 8;
        $display("[%0t] foo=%b, bar=%b, %0.0f%%", $time, foo, bar, cg_i.get_inst_coverage());
        if (cyc == 16) begin
            if (cg_i.get_inst_coverage() != 100) $stop;
            $finish;
        end

    end
endmodule

