`timescale 1ns/1ns

module shift_register
    #(parameter width = 1,
      parameter depth = 1) (
  input logic clock,
  input logic [0:width-1] in,
  output logic [0:width-1] out);

  logic [0:depth-1][0:width-1] data;

  always_ff @ (posedge clock) begin
    {out, data} <= {data, in};
  end
endmodule
