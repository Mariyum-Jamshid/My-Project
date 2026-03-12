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

        #20 $stop ;
       
    end
    // checker logic for sequence detection

    logic [3:0] shift_reg;
    logic expected;

    always @(posedge clk)
    begin
        if(reset)
        begin
            shift_reg = 4'b0000;
            expected  = 0;
        end
        else
        begin
            // shift input stream
            shift_reg = {shift_reg[2:0], seq_in};

            // detect pattern 1001
            if(shift_reg == 4'b1001)
                expected = 1;
            else
                expected = 0;

            // compare DUT output with expected
            if(seq_det !== expected)
                $display("ERROR at time %0t : shift_reg=%b expected=%b seq_det=%b",
                          $time, shift_reg, expected, seq_det);
            else
                $display("PASS at time %0t : sshift_reg=%b expected=%b seq_det=%b",
                          $time, shift_reg, expected, seq_det);
        end
    end

endmodule