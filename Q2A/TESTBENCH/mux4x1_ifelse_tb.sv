module mux4x1_ifelse_tb();
logic i0,i1,i2,i3;
logic s0,s1;
wire  out;

mux4x1_ifelse dut (i0,i1,i2,i3,s0,s1,out);
 initial begin
// Monitor the signals for changes and print to console
 $monitor("Time=%0t  | Inputs: s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b  | Output: out=%b",  $time, s0,s1, i0, i1, i2, i3, out);

    
*/
  repeat (20) begin
 
            i0 = $urandom % 2;
            i1 = $urandom % 2;
            i2 = $urandom % 2;
            i3 = $urandom % 2;
            s0 = $urandom % 2;
            s1 = $urandom % 2;

            #5;
end
end
endmodule
