module fsm_moore_ovrlapping_1001_tb;
    logic clk, reset, seq_in;
    logic seq_det;

    fsm_moore_ovrlapping_1001 dut (clk, reset, seq_in,seq_det);

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; 
        seq_in = 0;
        #10 reset = 0;

        // Test sequence: 1 0 0 1
        seq_in = 1; #10;
        seq_in = 0; #10;
        seq_in = 0; #10;
        seq_in = 1; #10;  // seq_detected should go high

        // Overlapping test: 1 0 0 1 0 0 1
        seq_in = 0; #10;
        seq_in = 0; #10;
        seq_in = 1; #10;  // seq_detected high again

        #20 ;
        //$finish;
    end

endmodule