/* *** Issue description
   Complex arguments of methods of parameterized classes don't work
   *** End of description
*/

class Sum #(type T);
   static int sum;
   static function void add(T element);
      sum += int'(element);
      endfunction
endclass

class IntQueue;
   int          q[$];
   function int getSum();
      foreach(q[i])
        Sum#(int)::add(q[i]);
      return Sum#(int)::sum;
   endfunction
endclass

module t (input logic clk);
   IntQueue qi;
   int arr [1:0] = '{1, 2};
   initial begin
      qi = new;
      qi.q = '{2, 4, 6, 0, 2};

      if (qi.getSum() != 14) $stop;
      Sum#(int)::add(arr[0]);
      if(Sum#(int)::sum != 16) $stop;
      if(Sum#(real)::sum != 0) $stop;

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
