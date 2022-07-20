// Testbench
module test;

  reg  CLK, A, B, C;
  wire LED;
  
  // Instantiate device under test
  fsm FSM(.CLK(CLK),
          .A(A),
          .B(B),
          .C(C),
          .LED(LED));
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1, test);

    CLK = 0;
    C = 0;
    //$display("Initial LED: %0h", LED);

    toggle_clk;
    //$display("IDLE LED: %0h", LED);
    
    C = 1;
    toggle_clk;
    //$display("S0 LED: %0h", LED);
 
    C = 0;
    toggle_clk;
    
    C = 1;
    toggle_clk;
    //$display("FINAL LED: %0h", LED);
	
    C = 0;
    toggle_clk;
       
    B = 1;
    toggle_clk;
    //$display("FINAL LED: %0h", LED);
    
    B = 0;
    toggle_clk;
     
    B = 1;
    toggle_clk;
    //$display("FINAL LED: %0h", LED);
    
    B = 0;
    toggle_clk;
    
    B = 1;
    toggle_clk;
    //$display("FINAL LED: %0h", LED);

  end
  
  task toggle_clk;
    begin
      #20 CLK = ~CLK;
      #20 CLK = ~CLK;
    end
  endtask
  
endmodule