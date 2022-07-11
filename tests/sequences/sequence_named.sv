/* *** Issue description

   Named sequence declarations are rejected by Verilator parser.

   *** End of description
*/

module top (
  input logic clk,
  input logic do_wr,
  input logic wr_valid,
);
  // Example
  sequence write_on_clk;
    @posedge (clk)
    (do_wr & wr_valid)
  endsequence
  // Example end

endmodule
