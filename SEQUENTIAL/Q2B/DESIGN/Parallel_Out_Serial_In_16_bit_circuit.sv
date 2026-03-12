// Filename :Parallel_Out_Serial_In_16_bit_circuit.sv

// Creation Date : 10/03/2026

module Parallel_Out_Serial_In_16_bit_circuit(
    
    input logic clk,
    input logic rst,
    input logic serial_data,
    output logic [15:0] parallel_out
   
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            parallel_out<= 15'b0;
        
        else begin
    
              parallel_out <={ parallel_out [14:0],serial_data};  // load data
        end
    end
        
    

endmodule
