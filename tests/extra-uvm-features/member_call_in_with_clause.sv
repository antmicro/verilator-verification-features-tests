// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0

`define stop $stop
`define checkh(gotv,expv) do if ((gotv) !== (expv)) begin $write("%%Error: %s:%0d:  got='h%x exp='h%x\n", `__FILE__,`__LINE__, (gotv), (expv)); `stop; end while(0);
`define checks(gotv,expv) do if ((gotv) !== (expv)) begin $write("%%Error: %s:%0d:  got='%s' exp='%s'\n", `__FILE__,`__LINE__, (gotv), (expv)); `stop; end while(0);

module t (input logic clk);
   initial begin
      string string_q[$];
      string string_qv[$];

      string_q.push_back("a");
      string_q.push_back("A");
      string_q.push_back("b");

      string_qv = string_q.unique(s) with (s.toupper);
      `checkh(string_qv.size(), 2);

      string_qv = string_q.find_last(s) with (s.tolower() == "a");
      `checks(string_qv[0], "A");

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
