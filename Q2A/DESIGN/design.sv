module mux4x1_ifelse(i0,i1,i2,i3,s0,s1,out);
input logic i0,i1,i2,i3;
input logic s0,s1;
output logic out;
always_comb
begin
if (s1==1'b0 & s0==1'b0)
out=i0;
else if( s1==1'b0 & s0==1'b1)
out=i1;
else if( s1==1'b1 & s0==1'b0)
out=i2;
else if( s1==1'b1 & s0==1'b1)
out=i3;
end
endmodule