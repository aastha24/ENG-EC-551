`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    17:55:50 10/17/2016 
// Design Name: 
// Module Name:    call_modules 
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
module call_modules(clk,rst,inst,alu_out);
input clk,rst;
input [31:0] inst;
output [31:0] alu_out;

wire [31:0] rd1;
wire [31:0] rd2;
wire [15:0] i;
wire ds;
wire [4:0] ws_prev;
wire [4:0] wsel;
wire [2:0] ao;

stage1 sg1(.clk(clk),.rst(rst),.wtdata(alu_out),.wenable(1'd1),.inst(inst),.wsprev(ws_prev),.rdata1(rd1),.rdata2(rd2),.wtsel(wsel),.imm(i),.datasrc(ds),.aop(ao));
stage2_3 s23(.clk(clk),.rst(rst),.rdata1(rd1),.rdata2(rd2),.imm(i),.datasrc(ds),.aop(ao),.alu_out(alu_out),.ws(wsel),.wtsel(ws_prev));

endmodule

