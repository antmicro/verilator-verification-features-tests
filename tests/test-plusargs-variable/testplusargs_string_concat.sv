/* *** Issue description

   String concatenation passed as argument to :code:`$test$plusargs` is rejected
   by Verilator's parser.

   *** End of description
*/
module top(input logic clk);
    initial begin
        string bar = "bar";
    // Example:
        $test$plusargs({"foo",bar,"baz"});
    // Example end
    end
endmodule

