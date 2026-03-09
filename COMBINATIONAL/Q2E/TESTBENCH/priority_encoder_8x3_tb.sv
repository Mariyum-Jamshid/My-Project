module priority_encoder_8x3_tb();
    logic [7:0] in;
    logic [2:0] out;
    logic [2:0] expected_out;
    logic valid;
    integer i;
priority_encoder_8x3 dut(in,out,valid);
initial begin

  repeat (10) begin
      
              i = $urandom_range(0,7);
              in=8'b00000001<<i;
              #10;
   
end 
end

//-----------------------------------------------------------//
//--PRIORITY ENCODER 8x3 CHECKER BY USING TERNARY OPERATOR--//
//---------------------------------------------------------//
  always_comb begin 
       
    if(valid) begin
    expected_out =(   in[0] ?  3'b000 :
                      in[1] ?  3'b001 :
                      in[2] ?  3'b010 :
                      in[3] ?  3'b011 :
                      in[4] ?  3'b100 :
                      in[5] ?  3'b101 :
                      in[6] ?  3'b110 :
                               3'b111); 
    end
                  
    else
        expected_out=3'b000;
    
        
    if (out === expected_out)
            $monitor("Time=%0t  | Inputs: [7:0]in=%h  | Output:MATCH [2:0]out=%h [2:0]expected_out=%h",  $time,in,out,expected_out);

                              
    else
            $monitor("Time=%0t  | Inputs: [7:0]in=%h | Output:MATCH [2:0]out=%h [2:0]expected_out=%h",  $time,in,out,expected_out);
                              
      
   end



endmodule