/* *** Issue description
   Static variables in functions don't work.
   *** End of description
*/

module t (input logic clk);
   function static int get_cnt;
      int cnt = 0;
      cnt++;
      return cnt;
   endfunction

   initial begin
      int cnt1 = get_cnt();
      int cnt2 = get_cnt();
      if (cnt1 != 1 || cnt2 != 2) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
