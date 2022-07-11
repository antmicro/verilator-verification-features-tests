/* *** Issue description

   Sequence declarations with cycle delay ranges are rejected by Verilator parser.

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
    ##[1:5] wr_valid
  endsequence
  // Example end

endmodule
