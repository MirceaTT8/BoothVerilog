module BC (input g0_in, p0_in, c_in, g1_in, p1_in, output g_out, p_out, c0_out, c1_out);
  assign g_out = g0_in | (g1_in & p0_in);
  assign p_out = p0_in & p1_in;
  assign c0_out = c_in;
  assign c1_out = (c_in & p1_in) | g1_in;
endmodule
