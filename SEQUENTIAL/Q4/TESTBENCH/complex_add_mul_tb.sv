`timescale 1ps/1ps

module complex_add_mul_tb;

    // Clock and reset
    logic clk;
    logic rst;

    // Inputs
    logic [15:0] a_real, b_imag, c_real, d_imag;
    logic valid_in;

    // Outputs
    logic [15:0] w_real, x_imag;
    logic [31:0] y_real, z_imag;
    logic valid_out;

    // Instantiate DUT
    complex_add_mul dut (
        .clk(clk),
        .rst(rst),
        .a_real(a_real),
        .b_imag(b_imag),
        .c_real(c_real),
        .d_imag(d_imag),
        .valid_in(valid_in),
        .w_real(w_real),
        .x_imag(x_imag),
        .y_real(y_real), 
        .z_imag(z_imag),
        .valid_out(valid_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor signals
    initial begin
        $monitor("Time=%0t : a=%0d+%0di, c=%0d+%0di -> w=%0d, x=%0d,  y=%0d, z=%0d valid=%b", 
                  $time, a_real, b_imag, c_real, d_imag, w_real, x_imag, y_real, z_imag, valid_out);
    end

    // Test sequence
    initial begin
        // Reset pulse
        rst = 1; valid_in = 0;
        a_real = 0; b_imag = 0; c_real = 0; d_imag = 0;
        @(posedge clk);
        rst = 0;
        @(posedge clk);

        // Example fixed test
        a_real = 3; b_imag = 2; c_real = 1; d_imag = 4;
        valid_in = 1; @(posedge clk);
        valid_in = 0; @(posedge clk);

        // Random tests
        repeat(5) begin
            a_real = $urandom % 65536;
            b_imag = $urandom % 65536;
            c_real = $urandom % 65536;
            d_imag = $urandom % 65536;
            valid_in = 1; @(posedge clk);
            valid_in = 0; @(posedge clk);
        end

        $display("All tests done!");
       #500 $stop ;
    end

endmodule