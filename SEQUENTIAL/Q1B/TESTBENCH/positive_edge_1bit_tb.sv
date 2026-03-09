// Filename : positive_edge_1bit_tb.sv

// Creation Date : 04/03/2026


`timescale 1ps/1ps

module positive_edge_1bit_tb;

    // Signals
    logic clk;
    logic rst;
    logic data;
    logic out;

    // Instantiate DUT
   positive_edge_1bit dut (
        .clk(clk),
        .rst(rst),
        .data(data),
        .out(out)
    );

    // Clock generation: 10ps period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        rst = 1;           // Apply reset
        data  = 1'b0;
        #10 rst = 0;       // Release reset after 10ns

        // Apply some test inputs
        #10 data = 1'b1;
        #30 data = 1'b0;
        #50 data = 1'b1;
        #70 data = 1'b0;
        #100 data =1'b1;
        #20 $stop;
    end

    // Monitor in console
    initial begin
        $display("Time(ns) | data       | out");
        $monitor("%0t | %b | %b", $time, data, out);
    end

    // -----------------------------
    // FSM Checker for Positive Edge
    // -----------------------------
    parameter IDLE=0, HIGH=1;
    reg[1:0] checker_state, next_state;
    logic checker_out;
    
    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            checker_state <= IDLE;
        else
            checker_state <= next_state;
    end

    // Next state logic
    always_comb begin
        case (checker_state)
            IDLE: begin
                if (data) 
                    next_state = HIGH;
                else
                    next_state = IDLE;
            end
            HIGH: begin
                if (!data)
                    next_state = IDLE; // go back to IDLE when input low
                else
                    next_state = HIGH;
            end
            default: begin next_state= checker_state;
                     
                 end
        endcase
    end
  
    always_comb
    checker_out = (checker_state==IDLE)&&(data);

    // Compare DUT output with FSM checker
    always_ff @(posedge clk) begin
        if (!rst) begin
            if (out !== checker_out)
                $display("MISMATCH at %0t: DUT=%b, FSM-checker=%b", $time, out, checker_out);
            else
                $display("MATCH at %0t: DUT=%b", $time, out);
        end
    end


endmodule