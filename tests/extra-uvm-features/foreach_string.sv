// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0

`define checkh(gotv,expv) do if ((gotv) !== (expv)) begin $write("%%Error: %s:%0d:  got='h%x exp='h%x\n", `__FILE__,`__LINE__, (gotv), (expv)); $stop; end while(0);

module t (input logic clk);
   reg [63:0] add;
   string          str1;
   string          str2;

   initial begin
      str1 = "abcd";
      str2 = "1234";
      foreach (str1[i]) begin
         str2[i] = str1[i];
      end
      if (str1 != str2) $stop;

      str1 = "";
      add = 0;
      foreach(str1[i]) begin
         add++;
      end
      `checkh(add, 0);

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
