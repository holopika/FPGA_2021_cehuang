module xianshi(
output [19:0] d,
input [7:0]  s_out
);

assign d[19:16] =  s_out/100%10;//dis/10000;    // ��λ
assign d[15:12] =  s_out/10%10;//dis/1000%10;  // ʮλ
assign d[11:8]  =  s_out%10;//dis/100%10;   // ��λ
assign d[7:4]   =  s_out*10%10;//dis/10%10;    // 0.1
assign d[3:0]   =  s_out*100%10;//dis%10;       // 0.01
   
endmodule