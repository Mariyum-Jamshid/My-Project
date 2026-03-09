module converter_tb();
  logic [3:0] gray;
  logic [3:0] bin;

  //logic [3:0] gray_new;
  logic [3:0] bin_new;
   
binary_to_gray_4bit dut1 (bin, gray);
gray_to_binary_4bit dut2 (.gray(gray), .bin(bin_new));

initial begin
   $display("CONVERSION OF BINARY TO GRAY AND GRAY TO BINARY NUMBER");
   $monitor("Time=%0t  | Inputs: [3:0]bin=%b | Output: [3:0]gray=%b |Output: [3:0]bin_new=%b",  $time,bin,gray,bin_new);
repeat (10) begin
    
            bin=$urandom_range(0,15);
            #10;
            
end


end 

endmodule