module cj_clk(
input clk,
input    rst,
output cj_clk_r


   );

wire  cj_clk_r;
reg   [20:0] a;
reg  cj_clk;
assign  cj_clk_r =  cj_clk;
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
   begin 
      cj_clk <= 0;
   end
else if (a == 250000 )  //检测频率（采样时钟）是20HZ
  begin 
  a <= 0;
  cj_clk <= ~cj_clk;
  end

 else 
 a <= a + 1;
end

endmodule