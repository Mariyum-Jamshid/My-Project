module priority_encoder_8x3_tb();
    logic  [7:0] in;
    logic [2:0] out;
    logic valid;
    integer i;
priority_encoder_8x3 dut(in,out,valid);
initial begin
 $monitor("Time=%0t  | Inputs: [7:0]in=%b  | Output: [2:0]=%b | Output: valid=%b",  $time,in,out,valid);

  repeat (10) begin
      
              i = $urandom_range(0,7);
              in=8'b00000001<<i;
   checker_priority(i);
         
              #10;
  end
end 

task checker_priority(logic i);
     i;

endtask


endmodule