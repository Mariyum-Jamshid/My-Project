module mux4x1_case(i0,i1,i2,i3,s0,s1,out);
input logic i0,i1,i2,i3;
input logic s0,s1;
output logic out;
always_comb
begin
case({s1,s0})
2'b00: out=i0;
2'b01: out=i1;
2'b10: out=i2;
2'b11:out=i3;
default: out=1'b0;
endcase
end
endmodule




