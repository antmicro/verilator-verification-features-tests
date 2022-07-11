/* *** Issue description

   Verilator does not recognize the `randomize()` function when using `std::` prefix.

   *** End of description
*/
module top (
    output logic o
);
    logic val_o;

    // Example:
    function bit randomize_o();
        bit success;
        success = std::randomize(val_o);
        return success;
    endfunction
    // Example end

    assign o = val_o;
endmodule
