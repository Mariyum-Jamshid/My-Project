// Filename : One_pulse_after_every_100ns_time_tb.sv

// Creation Date : 08/03/2026


`timescale 1ps/1ps

module One_pulse_after_every_100ns_time_tb;

    // Signals
    logic clk;
    logic rst;
    logic pulse;

    // Instantiate DUT
   One_pulse_after_every_100ns_time dut (
        .clk(clk),
        .rst(rst),
        .pulse(pulse)
    );

    initial clk = 0;
    always #5 clk = ~clk;   // 10ns clock

    initial begin
        rst = 1;
        #20 rst = 0;

        #500 $stop;
    end
    initial 
    $monitor("%0t|%b | %b", $time,clk,pulse);
   
    // ------------------------------------------------
    // Checker for  One_pulse_after_every_100ns_time
    // -----------------------------------------------
    integer cycle_count;
    always @(posedge clk) begin
        if (rst)
            cycle_count = 0;
        else begin
            cycle_count = cycle_count + 1;

            if (pulse) begin
                if (cycle_count != 10) begin
                    $display("ERROR: Pulse generated at wrong time at %t", $time);
                end
                cycle_count = 0;
            end
        end
    end

endmodule