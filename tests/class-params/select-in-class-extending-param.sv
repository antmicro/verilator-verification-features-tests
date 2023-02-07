/* *** Issue description
   Select operation in a class extending its parameter doesn't work
   *** End of description
*/

class DictWrapper;
   int m_dict[string];
endclass

class DictOperator #(type T) extends T;
   function void set(string s, int x);
      m_dict[s] = x;
   endfunction

   function int get(string s);
      return m_dict[s];
   endfunction
endclass

module t (input logic clk);
   DictOperator #(DictWrapper) dict_op;
   initial begin
      dict_op = new;
      dict_op.set("abcd", 1);
      if(dict_op.get("abcd") != 1) $stop;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
