module reg_q (input clk, rst_b, ld_ibus, ld_obus, clr_lsb, sh_r, sh_i, input [7:0]ibus, output reg [7:0]obus, output reg [7:-1]q );
  always@(posedge clk, negedge rst_b)
    begin
      if(!rst_b)  q <= 0;
      else
        begin
          if(ld_ibus)
            begin
              q[7:0] <= ibus;
              q[-1] <= 0;
            end
          else
            begin
              if(clr_lsb) q[-1] <= 0;
              else 
                if(sh_r)
                  begin
                    q[6:-1] <= q[7:0];
                    q[7] <= sh_i;
                  end
            end
        end
    end
  
  always@(*)
    obus = (ld_obus) ? q[7:0] : 8'bz;
endmodule