module multiplier_tb;
  reg clk, rst_b, start;
  reg [15:0]INBUS;
  wire [15:0]OUTBUS;

  multiplier cut(.clk(clk), .rst_b(rst_b), .start(start), .INBUS(INBUS), .OUTBUS(OUTBUS));
  
  //clk
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
  
  //rst_b
  initial begin
    rst_b = 1;
    #10 rst_b = 0;
    #10 rst_b = 1;
  end
  
  //numere
  initial begin
    start = 0;
    INBUS[15:8] = 8'b01001010;
    INBUS[7:0] = 8'b11000001;
    #30 start = 1;
  end
endmodule