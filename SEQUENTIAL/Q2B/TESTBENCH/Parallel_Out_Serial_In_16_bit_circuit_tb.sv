// Filename :Parallel_In_Serial_Out_16_bit_circuit_tb.sv

// Creation Date : 10/03/2026

module Parallel_Out_Serial_In_16_bit_circuit_tb();
    
    logic clk;
    logic rst;
    //logic load;
    logic serial_data;
    logic [15:0] parallel_out;
    

    Parallel_Out_Serial_In_16_bit_circuit dut(
        .clk(clk),
        .rst(rst),
        .serial_data(serial_data),
        .parallel_out(parallel_out)
        );
 
        
    always 
    #5 clk=~clk;

    initial begin
        clk = 0;
        rst = 1;
        serial_data = 0;

        #10 rst = 0;

        #10 serial_data = 1;
        #10 serial_data = 1;
        #10 serial_data = 0;
        #10 serial_data = 0;
        #10 serial_data = 1;
        #10 serial_data = 0;
        #10 serial_data = 1;
        #10 serial_data = 1;
        #10 serial_data = 0;
        #10 serial_data = 1;
        #10 serial_data = 1;
        #10 serial_data = 0;
        #10 serial_data = 1;
        #10 serial_data = 0;
        #10 serial_data = 0;
        #10 serial_data = 1;
      

        #50 $stop;
    end
    /////////////////////////////////////////////////////////////

    ///CHECKER LOGIC FOR Parallel_Out_Serial_In_16_bit_circuit ///

    /////////////////////////////////////////////////////////////
    logic [15:0] expected_parallel;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            expected_parallel <= 15'b0;
        else
            expected_parallel <= {expected_parallel[14:0], serial_data};
    end

    always_ff @(posedge clk) begin
        if (parallel_out === expected_parallel)
            $display("PASS: parallel_out=%b", parallel_out);
        else
            $display("FAIL: parallel_out=%b expected=%b", parallel_out, expected_parallel);
    end
        initial
        $monitor("Time=%0t clk=%b serial_data=%b parallel_out=%b",
            $time, clk, serial_data, parallel_out);
endmodule