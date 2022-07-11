/* *** Issue description

   `std::randomize()` call can be followed by a set of constraints to be applied.
   This is not supported in Verilator.

   *** End of description
*/
module top (
    output int o
);
    // Example:
    int val_o;

    function bit randomize_o();
        bit success;
        success = std::randomize(val_o) with {val_o > 5;};
        return success;
    endfunction
    // Example end

    assign o = val_o;
endmodule
