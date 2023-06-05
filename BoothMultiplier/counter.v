module counter (input clk, rst_b, c_up, output reg count_end);
  reg [2:0]q;
  always@(posedge clk, negedge rst_b)
    begin
      if(~rst_b) 
        begin
          q <= 0;
          count_end <= 0;
        end
      else
        begin
          if(c_up)
            q <= q + 1;
          if(q == 7)
            count_end <= 1;    
        end
    end
endmodule
