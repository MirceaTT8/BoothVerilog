module multiplier (input clk, rst_b, start, input [15:0]INBUS, output [15:0]OUTBUS);
  
  // Daca vrei sa vezi valorile lui A,Q,c in simulare poti sa le pui la output in loc de wire
  
  wire [6:0]c;
  wire [7:0]addition_result;
  wire [7:0]A,M;
  wire [7:-1]Q;
  wire counter_is_7;
  
  control_unit controller(.clk(clk), .rst_b(rst_b), .start(start), .counted7(counter_is_7), .q({Q[0],Q[-1]}), .c(c));
  
  reg_m register_m(.clk(clk), .rst_b(rst_b), .ld_ibus(c[0]), .ibus(INBUS[15:8]), .q(M));
  reg_a register_a(.clk(clk), .rst_b(rst_b), .ld_sum(c[2]), .ld_obus(c[5]), .sh_r(c[4]), .sh_i(A[7]), .sum(addition_result), .obus(OUTBUS[15:8]), .q(A));
  reg_q register_q(.clk(clk), .rst_b(rst_b), .ld_ibus(c[1]), .ld_obus(c[6]), .clr_lsb(c[0]), .sh_r(c[4]), .sh_i(A[0]), .ibus(INBUS[7:0]), .obus(OUTBUS[7:0]), .q(Q));
  
  CLA adder(.x(A) ,.y(M) , .c_in(c[3]), .z(addition_result));
  
  counter counter7(.clk(clk), .rst_b(rst_b), .c_up(c[4]), .count_end(counter_is_7));
  
endmodule

