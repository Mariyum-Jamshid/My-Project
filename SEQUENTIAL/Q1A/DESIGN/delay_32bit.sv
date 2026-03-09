// Filename : delay_32bit.sv

// Creation Date : 04/03/2026


module delay_32bit #(
    parameter N = 4   // number of delay cycles
)(
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] in,
    output logic [31:0] out
);

logic [31:0] shift_reg [N-1:0];
integer i;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        for (i = 0; i < N; i = i + 1)
            shift_reg[i] <= 32'd0;
    end
    else begin
        shift_reg[0] <= in;
        for (i = 1; i < N; i = i + 1)
            shift_reg[i] <= shift_reg[i-1];
    end
end

assign out = shift_reg[N-1];

endmodule