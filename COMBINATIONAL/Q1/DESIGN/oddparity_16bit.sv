module oddparity_16bit (
    input logic [15:0] num,
    output logic  odd_par
);

assign odd_par = ~^num; 

endmodule