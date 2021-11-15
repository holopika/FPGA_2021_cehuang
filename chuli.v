module chuli(
input clk,//cj_clk 20Hz
input [8:0]data,
input  en,
input rst,
//output[7:0] xl_out
output  [7:0] sum_out,
output  [7:0] s_out
//output  [9:0] xl_out
   );


reg [8:0]db;
reg [7:0]sum;  //间隔之和
reg [8:0]c;    //差值
reg [7:0]s;    //储存个数
reg  [8:0]x;     
reg[7:0] xl;
reg [7:0] sum_out_r;
reg [7:0] s_out_r;
//reg[9:0]xl_out_r;
reg [1:0] t;    //zhuangtai
//assign xl_out = xl_out_r;
assign sum_out = sum_out_r;
assign s_out = s_out_r;

always@(posedge clk or posedge rst)
begin
 if(rst==1 )
    begin
     xl <= 0;
     sum <=0;
     db <=0;
     s  <=0;
     c <=0;
     x  <=0;
//    xl_out_r <= 0;
    t <=0;
 sum_out_r<=0;
 s_out_r<=0;
    end
 else
begin 
  case(t)
   2'b00:begin
      if(en==0   )
         begin
         t <= 1;   //结算状态
          end
      else if (data < db)
          begin 
          c <= db-data;
          t <= 3;  //比较差
       end
     else 
         begin 
        db <= data;
         x <=x+1;
        end  
end


 2'b01:begin                     
    sum_out_r <= sum;
    s_out_r   <= s;
    t  <= 2;  //静止状态
       end

 2'b10:begin
 if(en ==1)    
  begin t <=0; end
 else
  begin
     sum <=0;
     db <=0;
     s  <=0;
     c <=0;
     x  <=0;
   end
 end

2'b11:begin
    if(c>=16)     //20
      begin 
      s <= s+1; 
      sum <= sum+x;
      db <= 0;
      x  <= 0;
      t  <= 0;
      end  
      else 
      begin  
      x <= x+1;
      t <= 0;
      end
end
endcase
end
end
endmodule