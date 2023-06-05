module AC (input x, y, c, output g, p, z);
  assign g = x & y;
  assign p = x | y;
  assign z = (x ^ y) ^ c;
endmodule
