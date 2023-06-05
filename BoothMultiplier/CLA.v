module CLA (input [7:0]x, y, input c_in, output [7:0]z);
  wire [6:0]g0;
  wire [6:0]g1;
  wire [6:0]p0;
  wire [6:0]p1;
  wire [6:0]c0;
  wire [6:0]c1;
  wire g,p;
  
  AC ac7(.x(x[7]),.y(y[7] ^ c_in),.c(c1[6]),.g(g0[6]),.p(p0[6]),.z(z[7]));
  AC ac6(.x(x[6]),.y(y[6] ^ c_in),.c(c0[6]),.g(g1[6]),.p(p1[6]),.z(z[6]));
  AC ac5(.x(x[5]),.y(y[5] ^ c_in),.c(c1[5]),.g(g0[5]),.p(p0[5]),.z(z[5]));
  AC ac4(.x(x[4]),.y(y[4] ^ c_in),.c(c0[5]),.g(g1[5]),.p(p1[5]),.z(z[4]));
  AC ac3(.x(x[3]),.y(y[3] ^ c_in),.c(c1[4]),.g(g0[4]),.p(p0[4]),.z(z[3]));
  AC ac2(.x(x[2]),.y(y[2] ^ c_in),.c(c0[4]),.g(g1[4]),.p(p1[4]),.z(z[2]));
  AC ac1(.x(x[1]),.y(y[1] ^ c_in),.c(c1[3]),.g(g0[3]),.p(p0[3]),.z(z[1]));
  AC ac0(.x(x[0]),.y(y[0] ^ c_in),.c(c0[3]),.g(g1[3]),.p(p1[3]),.z(z[0]));
  
  BC bc6(.g0_in(g0[6]),.p0_in(p0[6]),.g1_in(g1[6]),.p1_in(p1[6]),.c_in(c1[2]),.g_out(g0[2]),.p_out(p0[2]),.c0_out(c0[6]),.c1_out(c1[6]));
  BC bc5(.g0_in(g0[5]),.p0_in(p0[5]),.g1_in(g1[5]),.p1_in(p1[5]),.c_in(c0[2]),.g_out(g1[2]),.p_out(p1[2]),.c0_out(c0[5]),.c1_out(c1[5]));
  BC bc4(.g0_in(g0[4]),.p0_in(p0[4]),.g1_in(g1[4]),.p1_in(p1[4]),.c_in(c1[1]),.g_out(g0[1]),.p_out(p0[1]),.c0_out(c0[4]),.c1_out(c1[4]));
  BC bc3(.g0_in(g0[3]),.p0_in(p0[3]),.g1_in(g1[3]),.p1_in(p1[3]),.c_in(c0[1]),.g_out(g1[1]),.p_out(p1[1]),.c0_out(c0[3]),.c1_out(c1[3]));
  BC bc2(.g0_in(g0[2]),.p0_in(p0[2]),.g1_in(g1[2]),.p1_in(p1[2]),.c_in(c1[0]),.g_out(g0[0]),.p_out(p0[0]),.c0_out(c0[2]),.c1_out(c1[2]));
  BC bc1(.g0_in(g0[1]),.p0_in(p0[1]),.g1_in(g1[1]),.p1_in(p1[1]),.c_in(c0[0]),.g_out(g1[0]),.p_out(p1[0]),.c0_out(c0[1]),.c1_out(c1[1]));
  BC bc0(.g0_in(g0[0]),.p0_in(p0[0]),.g1_in(g1[0]),.p1_in(p1[0]),.c_in(c_in),.g_out(g),.p_out(p),.c0_out(c0[0]),.c1_out(c1[0]));
   
endmodule
