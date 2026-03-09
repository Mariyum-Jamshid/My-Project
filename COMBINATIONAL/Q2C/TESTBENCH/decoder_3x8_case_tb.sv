module decoder_3x8_case_tb();
    logic  [2:0] in;
    logic [7:0]expected_out;
    logic [7:0] out;
decoder_3x8_case dut(in,out);
initial begin
// $monitor("Time=%0t  | Inputs: [2:0]in=%b  | Output: [7:0]=%b",  $time,in,out);

repeat (20) begin
 
            in = $urandom_range(0,7);;
            #10;
end
end 
//--------------------------------------------------//
//--DECODER 3x8 CHECKER BY USING TERNARY OPERATOR--//
//------------------------------------------------//
  always_comb begin
   expected_out = ((in == 3'b000) ? 8'b00000001 :
                  (in == 3'b001) ? 8'b00000010 :
                  (in == 3'b010) ? 8'b00000100 :
                  (in == 3'b011) ? 8'b00001000 :
                  (in == 3'b100) ? 8'b00010000 :
                  (in == 3'b101) ? 8'b00100000 :
                  (in == 3'b110) ? 8'b01000000 :
                                   8'b10000000); 
                  

    
   
      if (out === expected_out)
            $monitor("Time=%0t  | Inputs: [2:0]in=%b  | Output:MATCH [7:0]out=%h [7:0]expected_out=%h",  $time,in,out,expected_out);
                              
      else
            $monitor("Time=%0t  | Inputs: [2:0]in=%b  | Output:MATCH [7:0]out=%h [7:0]expected_out=%h",  $time,in,out,expected_out);
                              
      
    end

endmodule