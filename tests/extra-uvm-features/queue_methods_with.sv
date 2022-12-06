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
      int q[$];
      int qv[$];
      int qi[$];
      string v;

      q = '{2, 2, 4, 1, 3};
      qv = q.unique(x) with (x % 2);
      `checkh(qv.size(), 2);

      qi = q.unique_index(x) with (x % 3); qv.sort;
      `checkh(qi.size(), 3);

      qv = q.min(x) with (x + 1);
      v = $sformatf("%p", qv); `checks(v, "'{'h1} ");
      qv = q.max(x) with ((x % 4) + 100);
      v = $sformatf("%p", qv); `checks(v, "'{'h3} ");

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
