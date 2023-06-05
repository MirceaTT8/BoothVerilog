module CLA_tb;
  reg [7:0]x;
  reg [7:0]y;
  reg c_in;
  wire [7:0]z;
  
  CLA cut(.x(x),.y(y),.c_in(c_in),.z(z));
  
  initial begin
    x = 8'b00001001;
    y = 8'b10010000;
    c_in = 0;
    #150
    x = 8'b00001001;
    y = 8'b10010000 ^ 8'b11111111;
    c_in = 1;
  end
  
endmodule
