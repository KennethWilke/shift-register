/*

This test should validate the shift register works with 8bit wide data

*/

`timescale 1ns/1ns

module test_shift_register_8bit();

  logic clock;
  logic [0:7] data_in;
  logic [0:7] data_out;

  shift_register #(.width(8)) dut(clock, data_in, data_out);

  initial begin
    clock <= 0;
    data_in <= 8'b0;
    #3 data_in <= 8'b11010001;
    #4 assert(data_out == 0);
    data_in <= 0;
    #4 assert(data_out == 8'b11010001);
    #5 $finish();
  end

  // 2ns clock
  always #2 clock <= ~clock;

endmodule
