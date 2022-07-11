/* *** Issue description

   Sequence declarations with cycle delays are rejected by Verilator parser.

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
    ##5 wr_valid
  endsequence
  // Example end

endmodule
