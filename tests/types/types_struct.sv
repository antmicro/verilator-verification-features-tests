/* *** Issue description

   Unpacked structs are not supported in Verilator.

   *** End of description
*/

module top ();

   // Example
    typedef struct {
       logic dir;
       logic [7:0] addr;
    } complex_t;
   // Example end

    complex_t s1;
endmodule
