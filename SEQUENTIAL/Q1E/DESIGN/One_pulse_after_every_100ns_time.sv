// Filename :One_pulse_after_every_100ns_time.sv

// Creation Date : 08/03/2026

module One_pulse_after_every_100ns_time (
    
    input  logic clk,
    input  logic rst,
    output logic pulse
);

logic [3:0] counter;   // 4 bits enough to count to 10

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 4'd0;
        pulse   <= 1'b0;
    end
    else begin
        if (counter == 4'd9) begin
            counter <= 4'd0;
            pulse   <= 1'b1;   // generate pulse
        end
        else begin
            counter <= counter + 1;
            pulse   <= 1'b0;
        end
    end
end

endmodule