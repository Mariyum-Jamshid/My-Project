module complex_add_mul(
    input logic clk,
    input logic rst,
    input logic [15:0]  a_real, 
    input logic [15:0]  b_imag,
    input logic [15:0]  c_real, 
    input logic [15:0]  d_imag,
    input logic valid_in,
    output logic [15:0]  w_real,
    output logic [15:0]  x_imag,
    output logic [31:0]  y_real,
    output logic [31:0]  z_imag,
    output logic valid_out
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            w_real  <= 16'd0;
            x_imag  <= 16'd0;
            y_real  <= 32'd0;
            z_imag  <= 32'd0;
            valid_out <= 1'b0;
        end else if (valid_in) begin
            w_real  <= a_real + c_real;
            x_imag  <= b_imag + d_imag;
            y_real  <= (a_real * c_real) - (b_imag * d_imag);
            z_imag  <= (a_real * d_imag) + (b_imag * c_real);
            valid_out <= 1'b1;
        end else begin
            valid_out <= 1'b0;
        end
    end
endmodule