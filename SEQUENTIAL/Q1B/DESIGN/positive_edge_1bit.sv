// Filename : positive_edge_1bit.sv

// Creation Date : 04/03/2026

module positive_edge_1bit (
    
    input  logic clk,
    input  logic rst,
    input  logic data,
    output logic out
);

    logic data_d;


always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        data_d<= 1'b0;
    end
    else begin
      data_d<= data;
    end
end

assign out = (data)&(~data_d);

endmodule