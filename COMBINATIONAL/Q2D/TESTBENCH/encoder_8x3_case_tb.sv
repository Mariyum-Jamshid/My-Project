module encoder_8x3_case_tb();
    logic [7:0] in;
    logic [2:0] out;
    logic [2:0] expected_out;
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
//--------------------------------------------------//
//--ENCODER 8x3 CHECKER BY USING TERNARY OPERATOR--//
//------------------------------------------------//
always_comb begin
       expected_out =((in == 8'b00000001) ? 3'b000 :
                      (in == 8'b00000010) ?  3'b001:
                      (in == 8'b00000100) ?  3'b010 :
                      (in == 8'b00001000) ?  3'b011 :
                      (in == 8'b00010000) ?  3'b100 :
                      (in == 8'b00100000) ?  3'b101 :
                      (in == 8'b01000000) ?  3'b110 :
                                             3'b111); 
    

   
      if (out === expected_out)
            $monitor("Time=%0t  | Inputs: [7:0]in=%h  | Output:MATCH [2:0]out=%h [2:0]expected_out=%h",  $time,in,out,expected_out);

                              
      else
            $monitor("Time=%0t  | Inputs: [7:0]in=%h | Output:MATCH [2:0]out=%h [2:0]expected_out=%h",  $time,in,out,expected_out);
                              
      
    end

endmodule