/* *** Issue description

   Associative arrays with wildcard index are not supported in Verilator.

   *** End of description
*/

module top (input logic clk);

   // Example
   int array [*] = '{default:255};
   // Example end
   initial begin
     array[1] = 0;
     array[1]++;
     $display("array[1] = %0b", array[1]);
     $finish;
    end

endmodule
