// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0

module t (input logic clk);
   typedef struct {
      string fst, snd;
   } str_pair_t;

   str_pair_t p;

   initial begin
      str_pair_t a, b;

      a.fst = "hello";
      a.snd = "world";
      if (a.fst != "hello" || a.snd != "world")
         $stop;

      b.fst = "test-word-1";
      b.snd = "test-word-2";
      if (b.fst != "test-word-1" || b.snd != "test-word-2")
         $stop;

      a = b;
      if (a.fst != "test-word-1" || a.snd != "test-word-2")
         $stop;

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
