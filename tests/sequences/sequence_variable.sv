/* *** Issue description

   Sequence declarations with indefinite delays are rejected by Verilator parser.

   *** End of description
*/

module top (
  input logic clk,
  input logic do_wr,
  input logic ready,
  input logic wr_valid
);

  default clocking @(posedge clk);
  endclocking

  // Example
  sequence write_on_clk;
    int was_valid;
    @posedge (clk)
    (do_wr, was_valid = wr_valid)
    ##1
    ready [*1:$]
    ##1
    (ready & do_wr & (wr_valid == was_valid))
  endsequence
  // Example end

endmodule
