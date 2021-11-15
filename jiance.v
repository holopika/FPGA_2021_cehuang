module jiance(
 input     clk,
 input  [8:0] sum_out, 
 input    rst,
 output   sum
 );

reg   [8:0] sum;
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sum <= 0;
 else   sum  <= sum_out + 'd5;
end
endmodule
