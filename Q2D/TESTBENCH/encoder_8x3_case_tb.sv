module encoder_8x3_case_tb();
    logic  [7:0] in;
    wire [2:0] out;
    integer i;
encoder_8x3_case dut(in,out);
initial begin
 $monitor("Time=%0t  | Inputs: [7:0]in=%b  | Output: [2:0]=%b",  $time,in,out);

repeat (10) begin
    
            i = $urandom_range(0,7);
            in=8'b00000001<<i;

            #10;
end
end 


endmodule