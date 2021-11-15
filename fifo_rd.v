module fifo_rd(
    //system clock
    input                    clk    ,        // ʱ���ź�
    input                    rst_n  ,        // ��λ�źţ�����Ч???

    //user interface
    input           [8:0]    data   ,        // ��FIFO�������???
    input                    full ,        // �����ź�
    input                    empty,        // �����ź�
    output   reg             rdreq,           // ����???
    output                  fifodate
);

//reg define
reg   [8:0]                  data_fifo;      // ��ȡ��FIFO����
reg   [1:0]                  flow_cnt ;      // ״̬��ת��???
wire [8:0] fifodata ;

//*****************************************************
//**                    main code
//*****************************************************
assign fifodata  = data_fifo;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rdreq <= 1'b0;
        data_fifo <= 8'd0;
    end
    else begin
        case(flow_cnt)
            2'd0: begin
                if(full) begin
                    rdreq <= 1'b1;
                    flow_cnt <= flow_cnt + 1'b1;
                end
                else
                    flow_cnt <= flow_cnt;
            end 
            2'd1: begin
                if(empty) begin
                    rdreq <= 1'b0;
                    data_fifo <= 8'd0;
                    flow_cnt  <= 2'd0;
                end
                else begin
                    rdreq <= 1'b1;
                    data_fifo <= data;
                end 
            end 
            default: flow_cnt <= 2'd0;
        endcase
    end
end

endmodule