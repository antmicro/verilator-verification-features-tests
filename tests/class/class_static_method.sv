/* *** Issue description
   Static variables in methods are handled as automatic
   *** End of description
*/

class Cls;
   function static int get_cnt;
      int cnt = 0;
      cnt++;
      return cnt;
   endfunction
endclass

module t (input logic clk);
   int cnt1 = Cls::get_cnt();
   int cnt2 = Cls::get_cnt();

   initial begin
      if (cnt1 != 1 || cnt2 != 2) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
