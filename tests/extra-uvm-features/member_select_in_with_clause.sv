// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2022 by Antmicro Ltd.
// SPDX-License-Identifier: CC0-1.0

`define stop $stop
`define checkh(gotv,expv) do if ((gotv) !== (expv)) begin $write("%%Error: %s:%0d:  got='h%x exp='h%x\n", `__FILE__,`__LINE__, (gotv), (expv)); `stop; end while(0);

module t (input logic clk);
   typedef struct packed { int x, y; } point;
   typedef struct packed { point p; int z; } point_3d;
   initial begin
      point_3d points_q[$];
      point_3d points_qv[$];

      points_q.push_back(point_3d'{point'{1, 2}, 3});
      points_q.push_back(point_3d'{point'{2, 3}, 5});
      points_q.push_back(point_3d'{point'{1, 4}, 5});

      points_qv = points_q.find_first with (item.z == 5);
      `checkh(points_qv[0].p.y, 3);
      points_qv = points_q.find_first with (item.p.x == 1);
      `checkh(points_qv[0].p.y, 2);

      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule
