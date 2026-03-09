// Filename : any_change_in_32bit.sv

// Creation Date : 05/03/2026




module any_change_in_32bit (
    
    input  logic clk,
    input  logic rst,
    input  logic [31:0]data,
    output logic out
);
//integer i;
    logic [31:0]data_d;


always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        data_d<= 32'h00000000;

    end
    else begin
      data_d<= data;
    end
end

assign out = (data != data_d);
/*
   // -----------------------------
    // FSM Checker for Negative Edge
    // -----------------------------
   parameter IDLE=0, HIGH=1;
    reg checker_state, next_state;
   // logic checker_out;
    
    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            checker_state <= IDLE;
        else
            checker_state <= next_state;
    end

    // Next state logic
    always_comb begin
        case (checker_state)
            IDLE: begin
                for (int i = 0; i < 4; i++) begin
                   if (data[i]) 
                    next_state = HIGH;
                else
                    next_state = IDLE;
                checker_out = (checker_state==IDLE)&&(data[i]);
                end
                
            end
            HIGH: begin
                for (int i = 0; i < 4; i++) begin
                   if (!data)
                    next_state = IDLE; // go back to IDLE when input low
                else
                    next_state = HIGH;
                checker_out = (checker_state==HIGH)&&(~data[i]);
                end
                
            end
            default: begin next_state= checker_state;
                     
                 end
        endcase
    end
  
   /* always_comb
        case(next_state) 
            HIGH: checker_out = (checker_state==HIGH)&&(~data);
           // IDLE: checker_out = (checker_state==IDLE)&&(data);
        
    endcase // next_state  */



endmodule