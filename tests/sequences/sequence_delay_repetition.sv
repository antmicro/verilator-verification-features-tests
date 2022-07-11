/* *** Issue description

   Sequence declarations with repetitions are rejected by Verilator parser.

   *** End of description
*/

module top (
  input logic clk,
  input logic do_wr,
  input logic wr_valid
);

  default clocking @(posedge clk);
  endclocking

  // Example
  sequence write_on_clk;
    @posedge (clk)
    ##1
    wr_valid [*7] ##[1:5] do_wr
  endsequence
  // Example end

endmodule
