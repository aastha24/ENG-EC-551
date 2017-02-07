`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    17:20:30 10/17/2016 
// Design Name: 
// Module Name:    stage1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stage1(clk,rst,wtdata,wenable,inst,wsprev,rdata1,rdata2,wtsel,imm,datasrc,aop);
input clk,rst; //CLK and RESET
input [31:0] wtdata; //WRITE DATA
input wenable; // WRITE ENABLE
input [31:0] inst; // 32 BIT INSTRUCTION
input [4:0]wsprev;
output [31:0] rdata1; // READ DATA 1
output [31:0] rdata2; // READ DATA 2
output reg [4:0] wtsel; // WRITE SELECT
output reg[15:0] imm; //Immediate data
output reg datasrc; // Data source
output reg[2:0] aop; //ALUop

wire [4:0]rdsel1;
wire [4:0]rdsel2;
wire [4:0]wt_sel;
wire [15:0] imme;
wire datasource;
wire [2:0]aop_wr;
 

assign rdsel1 = inst[20:16];
assign rdsel2 = inst[15:11];
assign wt_sel = inst[25:21];
assign imme = inst[15:0];
assign aop_wr = inst[28:26];
assign datasource = inst[29];

rd_wt_block r1 (.rdata1(rdata1), .rdata2(rdata2),.clk(clk),.rst(rst),.rdsel1(rdsel1),.rdsel2(rdsel2),.wtsel(wsprev),.wtdata(wtdata),.wenable(1'd1));

always @ (posedge clk or negedge rst)
begin
if (rst==0)
	begin
	datasrc <=0;
	aop <=0;
	imm <=0;
	end
else
	begin
	datasrc <= datasource;
	aop <= aop_wr;
	imm <= imme;
	wtsel <= wt_sel;
	end
end
endmodule
