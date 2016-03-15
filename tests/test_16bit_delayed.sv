/*

This test should validate the shift register works with 8bit wide data

*/

`timescale 1ns/1ns

module test_shift_register_16bit_delayed();

  logic clock;
  logic [0:15] data_in;
  logic [0:15] data_out;

  shift_register #(.width(16), .depth(2)) dut(clock, data_in, data_out);

  initial begin
    clock <= 0;
    data_in <= 16'b0011010010010010;
    #3 data_in <= 16'b1001001010010110;
    #9 assert(data_out == 16'b0011010010010010);
    data_in <= 0;
    #4 assert(data_out == 16'b1001001010010110);
    #5 $finish();
  end

  // 2ns clock
  always #2 clock <= ~clock;

endmodule
