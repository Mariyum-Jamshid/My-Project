// Filename : delay_32bit_tb.sv

// Creation Date : 04/03/2026


`timescale 1ps/1ps

module delay_32bit_tb;

    // Parameter for delay cycles
    

    parameter N = 4;

    // Signals
    logic clk;
    logic rst;
    logic [31:0] in;
    logic [31:0] out;

    // Instantiate DUT
    delay_32bit #(N) dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation: 10ps period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        rst = 1;           // Apply reset
        in  = 32'h00000000;
        #10 rst = 0;       // Release reset after 10ns

        // Apply some test inputs
        #10 in = 32'hA1;
        #10 in = 32'hB2;
        #10 in = 32'hC3;
        #10 in = 32'hD4;
        #10 in = 32'hE5;
        #50 $stop;
    end

    // Monitor in console
    initial begin
        $display("Time(ns) | in        | out");
        $monitor("%0t | %h | %h", $time, in, out);
    end

    // ------------------------------
    // Expected Model (Shift Register)
    // -------------------------------

    logic [31:0] exp_shift [N-1:0];
    logic [31:0] exp_out;
    int cycle_count;

    always_ff @(posedge clk) begin
        if (rst) begin
            cycle_count <= 0;
            for (int i = 0; i < N; i++)
                exp_shift[i] <= 0;
        end
        else begin
            cycle_count <= cycle_count + 1;

            // Shift register
            exp_shift[0] <= in;
            for (int i = 1; i < N; i++)
                exp_shift[i] <= exp_shift[i-1];
            end

           assign exp_out = exp_shift[N-1];

            // Checker logic
            // Start checking only after N cycles
            if (cycle_count >= N) begin
                if (out === exp_out)
                    $display("Time %0t : MATCH  exp=%h  out=%h",
                              $time, exp_out, out);
                else
                    $display("Time %0t : MISMATCH  exp=%h  out=%h",
                              $time, exp_out, out);
            end
    
    end
endmodule