module fsm_divisible_by_5(
    input logic clk,
    input logic reset,
    input logic seq_in,
    output logic seq_det
);

    // State encoding
    typedef enum logic [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
    } state_t;

    state_t cs, ns;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            cs <= S0;
        else
            cs <= ns;
    end

    // Next state logic
    always_comb begin
        case (cs)
            S0: ns = (seq_in) ? S1 : S0;
            S1: ns = (seq_in) ? S3 : S2;
            S2: ns = (seq_in) ? S0 : S4;
            S3: ns = (seq_in) ? S2 : S1;
            S4: ns = (seq_in) ? S4 : S3;  // overlapping sequences
            default: ns = S0;
        endcase
    end
    always_comb begin
        case (cs)
            S0: seq_det =1'b1;
            S1: seq_det =1'b0;
            S2: seq_det =1'b0;
            S3: seq_det =1'b0;
            S4: seq_det =1'b0;  
            default: seq_det =1'b0;
        endcase
    end



endmodule
