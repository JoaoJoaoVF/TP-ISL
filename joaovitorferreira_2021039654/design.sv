// Code your testbench here
// or browse Examples
module fsm(A, B, C, CLK, RST, LED);
  
  input A, B, C, CLK, RST;
  output LED;
  
  //Registrador de estado
  reg [2:0] STATE;
  reg LED, TRIG;
  
  //Codificacao dos estados
  parameter[2:0]
  			S0 = 3'b000,
  			S1 = 3'b001,
  			S2 = 3'b010,
  			S3 = 3'b101, 
  			S4 = 3'b110, 
   			S5 = 3'b111; 
 
  wire CLK, RST;
  assign RST = 0;
  
 //Primeiro Procedimento - Estado Proximo
  always @(posedge CLK) begin
    if(RST == 1'b1)
      begin
        STATE <= S0;
        LED <= 1'b0;
        TRIG <= 1'b0;
      end else begin
        case(STATE)
          S0:
                if(C == 1'b1 & TRIG == 1'b0)
                  begin
                    STATE <= S1;
                    TRIG <= 1'b1;
                    $display("S0");
                  end else begin
                                    //   else if(A == 1'b1 & TRIG == 1'b0 || B == 1'b1 & TRIG == 1'b0)
                                    //     begin
                                    //         STATE <= S0;
                                    //         TRIG <= 1'b1;
                                    //     end else begin
                    if(C == 1'b0)   // || A == 1'b1 || B == 1'b1)
                      begin
                      	TRIG <= 1'b0;
                      end
                    STATE <= S0;
                    LED <= 1'b0;
                  end
        S1:
                if(C == 1'b1 & TRIG == 1'b0)
                begin
                    STATE <= S2;
                    TRIG <= 1'b1;                  
                  $display("S1");
                                    //   end 
                                    //   else if(A == 1'b1 & TRIG == 1'b0 || B == 1'b1 & TRIG == 1'b0)
                                    //     begin
                                    //         STATE <= S0;
                                    //         TRIG <= 1'b1;
                end else begin
                    if(C == 1'b0)
                    begin
                        TRIG <= 1'b0;
                    end
                    STATE <= S1;
                    LED <= 1'b0;
                end                
        S2:
            if(B == 1'b1 & TRIG == 1'b0)
                    begin
                        STATE <= S3;
                        TRIG <= 1'b1;
                      $display("S2");
                    end else begin
                        if(B == 1'b0)
                        begin
                            TRIG <= 1'b0;
                        end
                        STATE <= S2;
                        LED <= 1'b0;
                    end  
        S3:
            if(B == 1'b1 & TRIG == 1'b0)
                    begin
                        STATE <= S4;
                        TRIG <= 1'b1;
                      $display("S3");
                    end else begin
                        if(B == 1'b0)
                        begin
                            TRIG <= 1'b0;
                        end
                        STATE <= S3;
                        LED <= 1'b0;
                    end  
        S4:
          if(B == 1'b1 & TRIG == 1'b0)
                    begin
                        STATE <= S5;
                        TRIG <= 1'b1;
                      $display("S4");
                    end else begin
                        if(B == 1'b0)
                        begin
                            TRIG <= 1'b0;
                        end
                        STATE <= S4;
                        LED <= 1'b1;
                    end  
        S5:
          if(B == 1'b1 & TRIG == 1'b0)
        begin
            STATE <= S0;
            TRIG <= 1'b1;
          $display("S5");
        end else begin
            if(B == 1'b0)
            begin
                TRIG <= 1'b0;
            end
                STATE <= S3;
                LED <= 1'b1;
            end   


        default:
        begin
          STATE <= S0;
          LED <= 1'b0;
          TRIG <= 1'b0;
        end
        endcase
      end
  end
endmodule