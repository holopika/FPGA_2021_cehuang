module fifo_in_out(
    input       sys_clk    ,         // 时钟信号
    input       cj_clk     ,
    input       rst_n      ,      // 复位
    input [8:0] sum1       , 
    input       vs_s       ,
    output      data_fifo  ,
    output       rdreq      
);

//wire define

wire            vs_s    ;        
wire   [8:0]    data    ;         
//reg    [8:0]    sum1    ;
wire     [8:0]    sum1   ;
wire            rdreq   ;        
wire    [8:0]   q       ;         
wire            empty ;        
wire            full  ;         
//*****************************************************
//**                    main code
//*****************************************************

//always  @(posedge cj_clk or negedge rst)begin
  //  if(rst==1'b0)begin
        //data <= 0 ;
  //  end
   // else if(vs_s==1)begin
  //      data <= sum1 ;
 //   end

//end



//例化FIFO模块
fifo u_fifo(
    .wr_data(sum1), // input [7:0]
    .wr_en(vs_s), // input
    .wr_clk(cj_clk), // input
    .full(), // output
    .wr_rst(~rst_n ), // input
    .almost_full(  full   ), // output
    .rd_data(data), // output [7:0]
    .rd_en(rdreq), // input
    .rd_clk(sys_clk), // input
    .empty(), // output
    .rd_rst(~rst_n ), // input
    .almost_empty(   empty      )
);


//例化读FIFO模块
fifo_rd u_fifo_rd(
    .clk     (sys_clk ),          // 读时???
    .rst_n   (~rst_n   ),         // 复位信号

    .rdreq   (rdreq   ),          // 读请???
    .data     (data       ),          // 从FIFO输出的数???
    .empty (empty ),          // 读空信号
    .full  (full  ),           // 读满信号
    .fifodate  (data_fifo)
   
);

endmodule 