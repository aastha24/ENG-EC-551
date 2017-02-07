`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    17:29:01 10/17/2016 
// Design Name: 
// Module Name:    stage2_3 
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
module stage2_3(clk,rst,rdata1,rdata2,imm,datasrc,aop,alu_out,ws,wtsel);
input clk,rst;
input [31:0] rdata1;
input [31:0] rdata2;
input [15:0] imm;
input datasrc;
input [2:0] aop;
input [4:0] ws;
output reg [31:0] alu_out;
output reg [4:0] wtsel;

wire [31:0] a_wire;
wire [31:0] b_wire;

ALU A1 (.r2(rdata1),.r3(a_wire),.aop(aop),.r1(b_wire));
MUX M1 (.rdata2(rdata2),.imm(imm),.datasrc(datasrc),.r3(a_wire));

always @(posedge clk or negedge rst)

if (rst == 0)
begin
alu_out <=0;
end
else
begin
alu_out <= b_wire;
wtsel <= ws;
end
endmodule
