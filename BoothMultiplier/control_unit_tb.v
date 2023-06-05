module control_unit_tb;
  reg clk, rst_b, start, counted7;
  reg [0:-1]q;
  wire [6:0]c;
  
  control_unit cut(.clk(clk),.rst_b(rst_b),.start(start),.counted7(counted7),.q(q),.c(c));
  
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
    q = 0;
    counted7 = 0;
    #30 start = 1;
    #100 q = 2'b01;
    #100 q = 2'b10;
    #200 counted7 = 1;
  end
  
endmodule
