/* *** Issue description

   Verilator does not support randsequence blocks.

   *** End of description
*/

module top;
   task display_sequence();
   // Example
     randsequence (main)
       main     : op operand done;
       op       : add | subtract;
       operand  : one | two | three;
       add      : {$display("Adding"); };
       subtract : {$display("Subtracting"); };
       one      : {$display("one"); };
       two      : {$display("two"); };
       three    : {$display("three"); };
       done     : {$display("Done"); };
     endsequence
   // Example end
   endtask
   initial begin
     display_sequence();
   end
endmodule
