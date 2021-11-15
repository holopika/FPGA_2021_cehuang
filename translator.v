module translator(
	//Clock Input:48M
	input	 clk,
	input res_n,
	input  [3:0]num1,//��λ
	input  [3:0]num2, //ʮλ
	input  [3:0]num3 ,//��λ
	input  [3:0]num4, //0.1
	input  [3:0]num5, //0.01
	output reg [4:0]ds_en,//5λ�����ʹ��,�����λѡ��ѡ��ǰҪ��ʾ�������
	//Digital tube
	output reg [7:0]ds_reg	//����ܶ�ѡ����ǰҪ��ʾ������
);
	//������������
	parameter [6:0]NUM_0=7'b1000000;
	parameter [6:0]NUM_1=7'b1111001;
	parameter [6:0]NUM_2=7'b0100100;
	parameter [6:0]NUM_3=7'b0110000;
	parameter [6:0]NUM_4=7'b0011001;
	parameter [6:0]NUM_5=7'b0010010;
	parameter [6:0]NUM_6=7'b0000010;
	parameter [6:0]NUM_7=7'b1111000;
	parameter [6:0]NUM_8=7'b0000000;
	parameter [6:0]NUM_9=7'b0010000;
	parameter [6:0]NUM_A=7'b0001000;
	parameter [6:0]NUM_B=7'b0000011;
	parameter [6:0]NUM_C=7'b0100111;
	parameter [6:0]NUM_D=7'b0100001;
	parameter [6:0]NUM_E=7'b0000110;
	parameter [6:0]NUM_F=7'b0001110;
	parameter [6:0]NUM_BLK=7'b1111111;
	
	//	5λ�����ʹ��
	parameter [4:0]EN_1=5'b00001;//�����1ʹ��
	parameter [4:0]EN_2=5'b00010;//�����2ʹ��
	parameter [4:0]EN_3=5'b00100;//�����3ʹ��
	parameter [4:0]EN_4=5'b01000;//�����4ʹ��
	parameter [4:0]EN_5=5'b10000;//�����5ʹ��
	parameter [4:0]EN_A=5'b11111;//ȫ�������ʹ��

	reg [18:0]cnt;
	always @(posedge clk or negedge res_n)
		begin
		if(!res_n)
			cnt =19'd0;
			else
			cnt = cnt + 1'b1;
		end

	always @(posedge clk)
		begin
			if(cnt[18:16] == 3'b001)
				case (num1)//�����1��ʾ��λ
				4'h0 :   begin ds_reg = {1'b1,NUM_0}; ds_en=EN_1;end
				4'h1 :   begin ds_reg = {1'b1,NUM_1}; ds_en=EN_1;end
				4'h2 :   begin ds_reg = {1'b1,NUM_2}; ds_en=EN_1;end
				4'h3 :   begin ds_reg = {1'b1,NUM_3}; ds_en=EN_1;end
				4'h4 :   begin ds_reg = {1'b1,NUM_4}; ds_en=EN_1;end
				4'h5 :   begin ds_reg = {1'b1,NUM_5}; ds_en=EN_1;end
				4'h6 :   begin ds_reg = {1'b1,NUM_6}; ds_en=EN_1;end
				4'h7 :   begin ds_reg = {1'b1,NUM_7}; ds_en=EN_1;end
				4'h8 :   begin ds_reg = {1'b1,NUM_8}; ds_en=EN_1;end
				4'h9 :   begin ds_reg = {1'b1,NUM_9}; ds_en=EN_1;end
				4'ha :   begin ds_reg = {1'b1,NUM_A}; ds_en=EN_1;end
				4'hb :   begin ds_reg = {1'b1,NUM_B}; ds_en=EN_1;end
				4'hc :   begin ds_reg = {1'b1,NUM_C}; ds_en=EN_1;end
				4'hd :   begin ds_reg = {1'b1,NUM_D}; ds_en=EN_1;end
				4'he :   begin ds_reg = {1'b1,NUM_E}; ds_en=EN_1;end
				4'hf :   begin ds_reg = {1'b1,NUM_F}; ds_en=EN_1;end
				default: begin ds_reg = {1'b1,NUM_BLK}; ds_en=EN_1;end
				endcase  
			else if(cnt[17:14] == 4'b010)
				case (num2)//�����2��ʾʮλ
				4'h0 :   begin ds_reg = {1'b1,NUM_0}; ds_en=EN_2;end
				4'h1 :   begin ds_reg = {1'b1,NUM_1}; ds_en=EN_2;end
				4'h2 :   begin ds_reg = {1'b1,NUM_2}; ds_en=EN_2;end
				4'h3 :   begin ds_reg = {1'b1,NUM_3}; ds_en=EN_2;end
				4'h4 :   begin ds_reg = {1'b1,NUM_4}; ds_en=EN_2;end
				4'h5 :   begin ds_reg = {1'b1,NUM_5}; ds_en=EN_2;end
				4'h6 :   begin ds_reg = {1'b1,NUM_6}; ds_en=EN_2;end
				4'h7 :   begin ds_reg = {1'b1,NUM_7}; ds_en=EN_2;end
				4'h8 :   begin ds_reg = {1'b1,NUM_8}; ds_en=EN_2;end
				4'h9 :   begin ds_reg = {1'b1,NUM_9}; ds_en=EN_2;end
				4'ha :   begin ds_reg = {1'b1,NUM_A}; ds_en=EN_2;end
				4'hb :   begin ds_reg = {1'b1,NUM_B}; ds_en=EN_2;end
				4'hc :   begin ds_reg = {1'b1,NUM_C}; ds_en=EN_2;end
				4'hd :   begin ds_reg = {1'b1,NUM_D}; ds_en=EN_2;end
				4'he :   begin ds_reg = {1'b1,NUM_E}; ds_en=EN_2;end
				4'hf :   begin ds_reg = {1'b1,NUM_F}; ds_en=EN_2;end
				default: begin ds_reg = {1'b1,NUM_BLK}; ds_en=EN_2;end
				endcase  
			else if(cnt[17:14] == 4'b011)
				case (num3)//�����3��ʾ��λ
				4'h0 :   begin ds_reg = {1'b0,NUM_0}; ds_en=EN_3;end
				4'h1 :   begin ds_reg = {1'b0,NUM_1};  ds_en=EN_3;end
				4'h2 :   begin ds_reg = {1'b0,NUM_2}; ds_en=EN_3;end
				4'h3 :   begin ds_reg = {1'b0,NUM_3}; ds_en=EN_3;end
				4'h4 :   begin ds_reg = {1'b0,NUM_4};  ds_en=EN_3;end
				4'h5 :   begin ds_reg = {1'b0,NUM_5}; ds_en=EN_3;end
				4'h6 :   begin ds_reg = {1'b0,NUM_6}; ds_en=EN_3;end
				4'h7 :   begin ds_reg = {1'b0,NUM_7}; ds_en=EN_3;end
				4'h8 :   begin ds_reg =  {1'b0,NUM_8};ds_en=EN_3;end
				4'h9 :   begin ds_reg =  {1'b0,NUM_9}; ds_en=EN_3;end
				4'ha :   begin ds_reg =  {1'b0,NUM_A};ds_en=EN_3;end
				4'hb :   begin ds_reg = {1'b0,NUM_B};ds_en=EN_3;end
				4'hc :   begin ds_reg =  {1'b0,NUM_C};ds_en=EN_3;end
				4'hd :   begin ds_reg =  {1'b0,NUM_D};ds_en=EN_3;end
				4'he :   begin ds_reg = {1'b0,NUM_E}; ds_en=EN_3;end
				4'hf :   begin ds_reg = {1'b0,NUM_F}; ds_en=EN_3;end
				default: begin ds_reg = {1'b0,NUM_BLK}; ds_en=EN_3;end
				endcase  
			 else if(cnt[17:14] == 4'b100)
				case (num4)//�����4��ʾʮ��λ
				4'h0 :   begin ds_reg = {1'b1,NUM_0}; ds_en=EN_4;end
				4'h1 :   begin ds_reg = {1'b1,NUM_1}; ds_en=EN_4;end
				4'h2 :   begin ds_reg = {1'b1,NUM_2}; ds_en=EN_4;end
				4'h3 :   begin ds_reg = {1'b1,NUM_3}; ds_en=EN_4;end
				4'h4 :   begin ds_reg = {1'b1,NUM_4}; ds_en=EN_4;end
				4'h5 :   begin ds_reg = {1'b1,NUM_5}; ds_en=EN_4;end
				4'h6 :   begin ds_reg = {1'b1,NUM_6}; ds_en=EN_4;end
				4'h7 :   begin ds_reg = {1'b1,NUM_7}; ds_en=EN_4;end
				4'h8 :   begin ds_reg = {1'b1,NUM_8}; ds_en=EN_4;end
				4'h9 :   begin ds_reg = {1'b1,NUM_9}; ds_en=EN_4;end
				4'ha :   begin ds_reg = {1'b1,NUM_A}; ds_en=EN_4;end
				4'hb :   begin ds_reg = {1'b1,NUM_B}; ds_en=EN_4;end
				4'hc :   begin ds_reg = {1'b1,NUM_C}; ds_en=EN_4;end
				4'hd :   begin ds_reg = {1'b1,NUM_D}; ds_en=EN_4;end
				4'he :   begin ds_reg = {1'b1,NUM_E}; ds_en=EN_4;end
				4'hf :   begin ds_reg = {1'b1,NUM_F}; ds_en=EN_4;end
				default: begin ds_reg = {1'b1,NUM_BLK}; ds_en=EN_4;end
				endcase  
			else if(cnt[17:14] == 4'b101)
				case (num5)//�����5��ʾ�ٷ�λ
				4'h0 :   begin ds_reg = {1'b1,NUM_0}; ds_en=EN_5;end
				4'h1 :   begin ds_reg = {1'b1,NUM_1}; ds_en=EN_5;end
				4'h2 :   begin ds_reg = {1'b1,NUM_2}; ds_en=EN_5;end
				4'h3 :   begin ds_reg = {1'b1,NUM_3}; ds_en=EN_5;end
				4'h4 :   begin ds_reg = {1'b1,NUM_4}; ds_en=EN_5;end
				4'h5 :   begin ds_reg = {1'b1,NUM_5}; ds_en=EN_5;end
				4'h6 :   begin ds_reg = {1'b1,NUM_6}; ds_en=EN_5;end
				4'h7 :   begin ds_reg = {1'b1,NUM_7}; ds_en=EN_5;end
				4'h8 :   begin ds_reg = {1'b1,NUM_8}; ds_en=EN_5;end
				4'h9 :   begin ds_reg = {1'b1,NUM_9}; ds_en=EN_5;end
				4'ha :   begin ds_reg = {1'b1,NUM_A}; ds_en=EN_5;end
				4'hb :   begin ds_reg = {1'b1,NUM_B}; ds_en=EN_5;end
				4'hc :   begin ds_reg = {1'b1,NUM_C}; ds_en=EN_5;end
				4'hd :   begin ds_reg = {1'b1,NUM_D}; ds_en=EN_5;end
				4'he :   begin ds_reg = {1'b1,NUM_E}; ds_en=EN_5;end
				4'hf :   begin ds_reg = {1'b1,NUM_F}; ds_en=EN_5;end
				default: begin ds_reg = {1'b1,NUM_BLK}; ds_en=EN_5;end
			
				endcase  
		end 

endmodule