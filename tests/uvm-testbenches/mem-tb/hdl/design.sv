//------------------------------------------------------------------------
//				Memory Model RTL - www.verificationguide.com
//------------------------------------------------------------------------
/*
              -----------------
              |               |
    addr ---->|               |
              |               |------> rdata
              | Memory Model  |
   wdata ---->|               |
              |               |
              -----------------
                   ^     ^
                   |     |
                wr_en  rd_en

-------------------------------------------------------------------------- */
module memory #(
    parameter ADDR_WIDTH = 2,
    parameter DATA_WIDTH = 8
) (
    input logic clk,
    input logic reset,

    //control signals
    input logic [ADDR_WIDTH-1:0] addr,
    input logic                  wr_en,
    input logic                  rd_en,

    //data signals
    input  logic [DATA_WIDTH-1:0] wdata,
    output logic [DATA_WIDTH-1:0] rdata
);

  //Memory
  logic [DATA_WIDTH-1:0] mem[2**ADDR_WIDTH];

  //Reset
  always @(posedge reset) for (int i = 0; i < 2 ** ADDR_WIDTH; i++) mem[i] = 8'hFF;

  // Write data to Memory
  always @(posedge clk) if (wr_en) mem[addr] <= wdata;

  // Read data from memory
  always @(posedge clk) if (rd_en) rdata <= mem[addr];

endmodule
