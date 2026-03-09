module mux4x1_case_tb();
       logic i0,i1,i2,i3;
       logic s0,s1;
       logic expected_out;
       wire out;

       mux4x1_case dut (i0,i1,i2,i3,s0,s1,out);
        initial begin

               // Apply test cases
               // Initialize inputs at time 0
               i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 =1'b0;
               s1 = 1'b0; s0=1'b0;
               #10; // Wait 10 time units

               i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0;
               s1 = 1'b0; s0=1'b1;
               #10; // Wait 10 time units

               i0 = 1'b1; i1 = 1'b1; i2 = 1'b1; i3 = 1'b0;
               s1 = 1'b1; s0=1'b0;
               #10; // Wait 10 time units

               i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1;
               s1 = 1'b1; s0=1'b1;
               #10; // Wait 10 time units
       end

       //----------------------------------------//
       //----MUX 4X1 CHECKER BY USING IFELSE-----//
       //----------------------------------------//
       always_comb begin

       
              if (s1==1'b0 & s0==1'b0)
              expected_out=i0;
              else if( s1==1'b0 & s0==1'b1)
              expected_out=i1;
              else if( s1==1'b1 & s0==1'b0)
              expected_out=i2;
              else if( s1==1'b1 & s0==1'b1)
              expected_out=i3;

       end
       always_comb begin
              if (out === expected_out)
            $monitor("Time %0t : Inputs: s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b | Output: MATCH out=%b expected_out=%b",
              $time,s0,s1, i0, i1, i2, i3, out, expected_out);
                              
      else
            $monitor("Time %0t : Inputs: s0=%b s1=%b i0=%b i1=%b i2=%b i3=%b | Output: NOTMATCH out=%b expected_out=%b",
              $time,s0,s1, i0, i1, i2, i3, out, expected_out);
                              
      end
       
endmodule