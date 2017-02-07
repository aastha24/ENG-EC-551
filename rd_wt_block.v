`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    21:13:11 10/15/2016 
// Design Name: 
// Module Name:    rd_wt_block 
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
module rd_wt_block(rdata1,rdata2,clk,rst,rdsel1,rdsel2,wtsel,wtdata,wenable);
input rst,clk; //RESET & CLOCK
input [4:0] rdsel1; //READ SELECT 1
input [4:0] rdsel2; //READ SELECT 2
input [4:0] wtsel; //WRITESELECT
input wenable; //WRITE ENABLE
input [31:0] wtdata; // WRITE DATA
output reg[31:0] rdata1; //READ DATA 1
output reg[31:0] rdata2; //READ DATA2
integer i;
reg [31:0] memory [31:0]; //32 memory spaces of 32 bit each
always @ (posedge clk or negedge rst)
begin
	if (rst==0) //if rst=0 reset everything 
	begin
		for (i=0;i<32;i=i+1) 
			memory[i] <= 0;
		rdata1 <= 0;
		rdata2 <= 0;
	end
	else
	begin
		rdata1<=memory[rdsel1];
		rdata2<=memory[rdsel2];
		if (wenable == 1)
		begin
			memory[wtsel] <= wtdata;
		end
	end 
end
endmodule
