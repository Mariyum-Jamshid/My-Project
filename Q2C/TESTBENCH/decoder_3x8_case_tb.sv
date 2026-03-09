module decoder_3x8_case_tb();
    logic  [2:0] in;
    wire [7:0] out;
decoder_3x8_case dut(in,out);
initial begin
 $monitor("Time=%0t  | Inputs: [2:0]in=%b  | Output: [7:0]=%b",  $time,in,out);

repeat (20) begin
 
            in = $urandom_range(0,7);;
            #10;
end
end 


endmodule