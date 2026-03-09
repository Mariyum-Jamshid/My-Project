module oddparity_16bit_tb ();
    logic [15:0] num;
    wire logic  odd_par;
oddparity_16bit dut( num,odd_par);
initial begin
// Monitor the signals for changes and print to console
 $monitor("Time=%0t  | Inputs: [15:0]num=%b  | Output: odd_par=%b",  $time,num,odd_par);

repeat (20) begin
 
            num = $urandom_range(0,16'hFFFF);;
            #10;
end
end
       
endmodule