module divider_module
(dividend,divisor,clk,rst,quotient,reminder);
//端口定义//
input [7:0]dividend;
input [7:0]divisor;
input clk;
input rst;
output [7:0]quotient;
output [7:0]reminder;
//寄存器变量定义//
reg [7:0]q;
reg [7:0]r;
reg [7:0]t;
wire [7:0]quotient;
wire [7:0]reminder;
integer i;
parameter j=8;

always@(posedge clk or negedge rst)
begin
if(!rst)
begin
q=0;
r=0;
end
else
begin
q=dividend;
t={4'b0000,divisor};
r=8'b00000000;
{r,q}={r,q}<<1;

//进行8次循环比较//
for(i=0;i<j;i=i+1)
if(r>=t)
begin
r=r-t;
{r,q}={r,q}<<1;
q[0]=1;
end
else
begin
r=r;
{r,q}={r,q}<<1;
q[0]=0;
end
end
end
assign quotient=q;
assign reminder=r>>1;
endmodule