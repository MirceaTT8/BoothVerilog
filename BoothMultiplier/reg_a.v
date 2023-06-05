module reg_a (input clk, rst_b, ld_sum, ld_obus, sh_r, sh_i, input [7:0]sum, output reg [7:0]obus, q);
  always@(posedge clk, negedge rst_b)
    begin
      if(!rst_b) q <= 0;
      else
        begin
          if(ld_sum) q <= sum;
          else
            begin
              if(sh_r)
                begin
                  q[6:0] <= q[7:1];
                  q[7] <= sh_i;
                end
            end   
        end
    end
  always@(*)
    obus = (ld_obus) ? q : 8'bz;
endmodule