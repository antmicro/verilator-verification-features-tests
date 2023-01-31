/* *** Issue description
   Static functions don't work
   *** End of description
*/

module t (input logic clk);
   function static int get_cnt;
      automatic int cnt = 0;
      cnt++;
      return cnt;
   endfunction

   int cnt1 = get_cnt();
   int cnt2 = get_cnt();

   initial begin
      if (cnt1 != 1 || cnt2 != 1) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
