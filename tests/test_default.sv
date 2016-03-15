/*

This test should validate the shift register works with the default parameters.

*/

`timescale 1ns/1ns

module test_shift_register_default();

  logic clock;
  logic data_in;
  logic data_out;

  shift_register dut(clock, data_in, data_out);

  initial begin
    clock <= 0;
    data_in <= 0;
    #3 data_in <= 1;
    #4 assert (data_out == 0);
    data_in <= 0;
    #4 assert(data_out == 1);
    #5 $finish();
  end

  // 2ns clock
  always #2 clock <= ~clock;

endmodule
