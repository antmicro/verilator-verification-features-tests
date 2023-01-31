/* *** Issue description

   Static functions don't work.
   According to section 13.4.3 of IEEE Std 1800-2017,
   execution at elaboration has no effect on the initial values
   of the variables used either at simulation time or among
   multiple invocations of a function at elaboration time

   *** End of description
*/

module t (input logic clk);
   function static int get_cnt;
      int cnt = 0;
      cnt++;
      return cnt;
   endfunction

   parameter int CNT1 = get_cnt();
   parameter int CNT2 = get_cnt();

   initial begin
      if (CNT1 != 1 || CNT2 != 1) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
