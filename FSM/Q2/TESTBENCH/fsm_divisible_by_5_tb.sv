module fsm_divisible_by_5_tb;
        logic clk, reset, seq_in;
        logic seq_det;

   fsm_divisible_by_5 dut (clk, reset, seq_in,seq_det);

        // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; 

    initial begin
            reset = 1; 
            seq_in = 0;
            #10 reset = 0;

            // Test sequence: 0010101010
            seq_in = 0; #10;
            seq_in = 0; #10;
            seq_in = 1; #10;
            seq_in = 0; #10;  
            seq_in = 1; #10;
            seq_in = 0; #10;
            seq_in = 1; #10;  
            seq_in = 0; #10;
            seq_in = 1; #10;
            seq_in = 0; #10; 

            #20 $stop;
            
    end

        // Checker
        int number;
        logic expected;
    always @(posedge clk)
    begin
        if(reset)
        begin
            number = 0;
        end
        else
        begin
            // form binary number
            number = number*2 + seq_in;

            // expected output
            if(number % 5 == 0)
                expected = 1;
            else
                expected = 0;

            // compare
            if(seq_det !== expected)
                $display("ERROR: seq_in=%b number=%0d expected=%b seq_det=%b",
                          seq_in, number, expected, seq_det);
            else
                $display("PASS: seq_in=%b number=%0d expected=%b seq_det=%b",
                          seq_in, number, expected, seq_det);
        end
    end
         initial begin
            $monitor("Time=%0t : clk=%b, seq_in=%0b -> seq_det=%0b", $time,clk,seq_in,seq_det);
        end

endmodule