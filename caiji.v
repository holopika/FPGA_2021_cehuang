module caiji(
 input     clk,
 input  [15:0] vout_data, 
 input    rst,
 output  [8:0] sum_out,
//new
//input en,      //存满之后拉高使状态机置于初始位置
input key,
input vs,
output vs_s



 );


reg   vs_t ;
reg   vs_s ;
reg   [1:0] t;   //状态
wire  [4:0] r;
reg   [11:0]  s;
reg   [8:0] sum;
reg   [8:0] sum_ing;
reg   [21:0] a;
reg   [8:0] sum_out;
assign r     = vout_data[15:11];
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		sum <= 0;
        a  <=  0;
        s  <=  0;
        sum_ing <= 0; 
        t  <= 0;
       vs_t <=0;
       vs_s <=0;
	end

else
  begin
  case(t)
   2'b00:begin
         if (key == 0)
          begin 
          t <= 2'b01;
          vs_t <= 1; 
          end
         else 
               begin 
                   t <= 2'b00;
                   vs_t <=0;
                   vs_s <=0;  
                   sum <= 0;
                   a  <=  0;
                   s  <=  0;
                   sum_ing <= 0; 
               end
         end 
   2'b01:begin
             if ( vs_t==1 && vs==0 )
             begin
             vs_s <= 1; 
             t <=2'b10; 
           end
         end 
   2'b10:begin
if (s == 601 )  //3601为全程精准测量，601为10s速测
        begin
        t  <= 0;
        s  <=  0;
         
       end
else if(a == 1075200 ) 
        
        begin
        s <=  s+1;
        a <=  a+1;
        end
 else if(a == 1075202 ) 
       begin 
        a <=  a+1;
      sum <= sum_ing;
        end  
      
else if(a == 1075203)
     
        begin
        a <=  a+1;
        sum_out  <= sum;
        end
 else if(a == 1075204 ) 
           begin   
            a <= 0;
             sum_ing <= 0;
           end
else if (a == 304360 ||a == 305000 ||a == 562728 ||a == 820456||a == 821096 )
         begin 
         sum_ing <= sum_ing + r;
           a <=  a+1;
           end 
 else
         	begin
           a <=  a+1;
            end
end 

default     :  t <= 2'b00;
endcase
end
end

endmodule