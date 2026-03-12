// Filename :Parallel_In_Serial_Out_16_bit_circuit_tb.sv

// Creation Date : 10/03/2026

module Parallel_In_Serial_Out_16_bit_circuit_tb();
    
    logic clk;
    logic rst;
    logic load;
    logic [15:0] parallel_data;
    logic serial_out;

    Parallel_In_Serial_Out_16_bit_circuit(
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_data(parallel_data),
        .serial_out(serial_out)
        );

    initial begin
        rst = 1;
        load = 0;
        pdata = 16'hABCD;
        #10 rst = 0;

        load = 1;   // load data
        #10 load = 0;

        #200 $stop;
    end
endmodule