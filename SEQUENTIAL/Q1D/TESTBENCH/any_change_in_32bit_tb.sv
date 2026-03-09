// Filename : any_change_in_32bit_tb.sv

// Creation Date : 05/03/2026


`timescale 1ps/1ps

module any_change_in_32bit_tb;

    // Signals
    logic clk;
    logic rst;
    logic [31:0]data;
    logic out;

    // Instantiate DUT
   any_change_in_32bit dut (
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
        data  = 32'h00000000;
        #10 rst = 0;       // Release reset after 10ns

        // Apply some test inputs
        #10 data = 32'h0001ACF0;
        #30 data = 32'hBE450101;
        #50 data = 32'hDE321111;
        #70 data = 32'h01EF0900;
        #100 data =32'hABCD1000;
        #20 $stop;
    end

    // Monitor in console
    initial begin
        $display("Time(ns) | data       | out");
        $monitor("%0t | %h | %b", $time, data, out);
    end
    // -----------------------------
    // any_change_in_32bit Checker
    // -----------------------------
    logic [31:0]data_d;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_d<= 32'h00000000;

        end
        else begin
            data_d<= data;
        end
    end

    assign checker_out = |(data ^ data_d);  
    // Compare DUT output with checker
    always_ff @(posedge clk) begin
        if (!rst) begin
            if (out !== checker_out)
                $display("MISMATCH at %0t: DUT=%b, FSM-checker=%b", $time, out, checker_out);
            else
                $display("MATCH at %0t: DUT=%b", $time, out,checker_out);
        end
    end


endmodule