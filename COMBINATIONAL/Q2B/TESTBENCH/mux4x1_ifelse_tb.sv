module mux4x1_ifelse_tb();
    logic i0,i1,i2,i3;
    logic s0,s1;
    wire  out;
    logic expected_out;

  mux4x1_ifelse dut (i0,i1,i2,i3,s0,s1,out);
   initial begin
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
//----------------------------------------//
//-----MUX 4X1 CHECKER BY USING CASE------//
//----------------------------------------//
  always_comb begin

   case({s1,s0})
      2'b00: expected_out=i0;
      2'b01: expected_out=i1;
      2'b10: expected_out=i2;
      2'b11: expected_out=i3;
      default: expected_out=1'b0;
      endcase
  
       if (out === expected_out)
            $monitor("Time %0t : Inputs: s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b | Output: MATCH out=%b expected_out=%b",
              $time,s0,s1, i0, i1, i2, i3, out, expected_out);
                              
      else
            $monitor("Time %0t : Inputs: s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b | Output: NOTMATCH out=%b expected_out=%b",
              $time,s0,s1, i0, i1, i2, i3, out, expected_out);

endmodule
