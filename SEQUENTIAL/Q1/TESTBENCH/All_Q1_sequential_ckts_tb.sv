// Filename : All_Q1_sequential_ckts_tb.sv

// Creation Date : 08/03/2026


`timescale 1ps/1ps
    module All_Q1_sequential_ckts_tb;
        parameter N = 4;
        logic clk;
        logic rst;
        logic [31:0] in; // Signals of Q1A
        logic [31:0] out; // Signals of Q1A
        logic data; // Signals of Q1B
        logic posout; // Signals of Q1B
     // logic data;// Signals of Q1C
        logic negout; // Signals of Q1C
     // logic [31:0]data; // Signals of Q1D using the same [31:0]in
        logic combine_out; // Signals of Q1D
        logic pulse; // Signals of Q1E


    // Instantiate DUT delay_32bit
        delay_32bit #(N) dut1 (
            .clk(clk),
            .rst(rst),
            .in(in),
            .out(out)
        );
    //Instantiate DUT positive_edge_1bit
        positive_edge_1bit dut2 (
            .clk(clk),
            .rst(rst),
            .data(data),
            .out(posout)
        );
    // Instantiate DUT negative_edge_1bit
        negative_edge_1bit dut3 (
            .clk(clk),
            .rst(rst),
            .data(data),
            .out(negout)
        );
    // Instantiate DUT any_change_in_32bit
        any_change_in_32bit dut4 (
            .clk(clk),
            .rst(rst),
            .data(in),
            .out(combine_out)
        );
    
    // Instantiate DUT
        One_pulse_after_every_100ns_time dut5 (
            .clk(clk),
            .rst(rst),
            .pulse(pulse)
        );

    // Clock generation: 10ps period
    initial clk = 0;
    always #5 clk = ~clk;
    // Q1A
    // Stimulus
    initial begin
        rst = 1;           // Apply reset
        in  = 32'h00000000;
        data  = 1'b0;
        #10 rst = 0;       // Release reset after 10ns

        // Apply some test inputs
        #10 in = 32'hA1;
        #10 data = 1'b1;
        #10 in = 32'hB2;
        #30 data = 1'b0;
        #10 in = 32'hC3;
        #50 data = 1'b1;
        #10 in = 32'hD4;
        #70 data = 1'b0;
        #10 in = 32'hE5;
        #100 data =1'b1;
        #500 $stop; 
    end

    // Monitor in console
    initial begin
        $display("Time(ns) | data |posout |negout");
        $monitor("%0t |%b | %h | %h | %b | %b|%b  | %b | %b", $time,clk, in, out, data, posout,negout, combine_out,pulse);
    end  

endmodule