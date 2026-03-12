// Filename :Parallel_In_Serial_Out_16_bit_circuit.sv

// Creation Date : 10/03/2026

module Parallel_In_Serial_Out_16_bit_circuit(
    
    input logic clk,
    input logic rst,
    input logic load,
    input logic [15:0] parallel_data,
    output logic serial_out
);

    logic [15:0]shift_reg;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            shift_reg<= 16'b0;
        
        else begin
            if (load) 
              shift_reg<=parallel_data;  // load data
    
            else 
                shift_reg<={shift_reg[14:0],1'b0}; //shift data left
        end
    end
        assign
        serial_out=shift_reg[15];// MSB first
    

endmodule
