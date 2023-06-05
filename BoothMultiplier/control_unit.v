module control_unit (input clk, rst_b, start, counted7, input [0:-1]q, output reg [6:0]c);
  
  // SHIFT <--> TEST
  localparam START = 0;
  localparam SCAN = 1;    
  localparam SHIFT = 2;
  localparam TEST = 3;
  localparam OUTPUT = 4;
  localparam END = 5;
  
  reg [2:0]state, state_next;
  
  //Se stabileste urmatorea stare in functie de starea curenta si input
  always@(*)
    begin
      state_next = state;
      case(state)
        START: if(start == 1) state_next = SCAN;
        SCAN: state_next = SHIFT;
        SHIFT: state_next = TEST;
        TEST: 
          begin
            if(counted7 == 1)
              state_next = OUTPUT;
            else
              state_next = SCAN;
          end
        OUTPUT: state_next = END;
      endcase
    end
  
  //Se stabilesc valorile semnalelor c in functie de valorile lui q
  always@(*)
    begin
      c = 0;
      case(state)
        START: 
          begin
            c[0] = 1;
            c[1] = 1;
          end
        SCAN: 
          begin
            if(q == 2'b01)
              c[2] = 1;
            else
              if(q == 2'b10)
                begin
                  c[2] = 1;
                  c[3] = 1;
                end
          end
        SHIFT: c[4] = 1;
        OUTPUT: 
          begin
            c[5] = 1;
            c[6] = 1;
          end
      endcase
    end
    
    always@(posedge clk, negedge rst_b)
      begin
        if(~rst_b) 
          begin
            state <= START;
            c = 0;
          end
        else
          state <= state_next; 
      end
      
endmodule 
