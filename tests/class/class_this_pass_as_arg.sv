/* *** Issue description
   Direct usage of 'this' in classes is reported as undefined variable.
   *** End of description
*/
// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0
//

class wrapped_int;
   int x;
   static wrapped_int q[$];
   function new(int a);
      this.x = a;
   endfunction
   function void push_this;
      q.push_back(this);
   endfunction
endclass

module t(/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   wrapped_int i1, i2;

   initial begin
      i1 = new(1);
      i1.push_this();
      i2 = new(2);
      i2.push_this();
      if (wrapped_int::q.size() != 2) $stop;

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
