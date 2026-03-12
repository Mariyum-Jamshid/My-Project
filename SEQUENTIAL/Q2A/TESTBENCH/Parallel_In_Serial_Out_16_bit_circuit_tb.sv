// Filename :Parallel_In_Serial_Out_16_bit_circuit_tb.sv

// Creation Date : 10/03/2026

module Parallel_In_Serial_Out_16_bit_circuit_tb();
    
    logic clk;
    logic rst;
    logic load;
    logic [15:0] parallel_data;
    logic serial_out;

    Parallel_In_Serial_Out_16_bit_circuit dut(
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_data(parallel_data),
        .serial_out(serial_out)
        );
 
        
    always 
    #5 clk=~clk;

    initial begin
        clk=0;
        rst = 1;
        load = 0;
        parallel_data = 16'hABCD;
        #10 rst = 0;

        load = 1;   // load data
        #10 load = 0;

        #200 $stop;
    end
    logic [15:0] expected_shift;
    logic expected_serial;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            expected_shift <= 16'b0;
        else if (load)
            expected_shift <= parallel_data;  // mirror DUT load
        else
            expected_shift <= {expected_shift[14:0], 1'b0}; // mirror DUT shift
    end

    always_comb expected_serial = expected_shift[15];

    always_ff @(posedge clk) begin
        if (serial_out === expected_serial)
            $display("PASS: time=%0t serial_out=%b", $time, serial_out);
        else
            $display("FAIL: time=%0t serial_out=%b expected=%b",
                     $time, serial_out, expected_serial);
    end
endmodule