/* *** Issue description

   Verilator's parser rejects named properties.

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

   logic out = 1;
    // Example:   
    property prop_a;
        @(posedge clk) disable iff (cyc <= 10) out;
    endproperty

   assert property (prop_a) else $error($sformatf("property check failed :assert: (False)"));
    // Example end
endmodule
