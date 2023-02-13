/* *** Issue description
   Class extending its parameter doesn't work.
   This test tests a case in which the inheritance is indirect.
   *** End of description
*/
module t (input logic clk);

   class Foo;
      int x = 1;
      function int get_x;
         return x;
      endfunction
      function int get_3;
         return 3;
      endfunction
   endclass

   class Bar #(type T=Foo) extends T;
   endclass

// Example
   class ExtendBar extends Bar;
     function int get_x;
        return super.get_x();
     endfunction
     function int get_6;
        return 2 * get_3();
     endfunction
   endclass
// Example end

   ExtendBar extend_bar_i;
   initial begin
      extend_bar_i = new;
      if (extend_bar_i.get_x() == 1 && extend_bar_i.get_6() == 6) begin
         $write("*-* All Finished *-*\n");
         $finish;
      end
      else begin
         $stop;
      end
   end
endmodule
