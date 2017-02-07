`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:25:23 11/23/2016
// Design Name:   mac
// Module Name:   X:/EC551/Anand_Nair_EC551_Lab3/systolic_array/t_mac.v
// Project Name:  systolic_array
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mac
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_mac;

	reg [8:0] din;
	reg [8:0] wt;
	reg [17:0] sumin;
	reg clock;
	reg reset;

	wire [17:0] sumout;
	wire [8:0] x;

	mc uut (
		.din(din), 
		.wt(wt), 
		.sumin(sumin), 
		.sumout(sumout), 
		.x(x), 
		.clock(clock), 
		.reset(reset)
	);

		always
	begin
		clock=1'b0;
		#2;
		clock=1'b1;
		#2;
	end
	
	initial begin
		reset = 1;
		#4;
		reset = 0;
		din = 8'h02;
		wt = {1'b1,8'hFF};
		sumin = 8'b0;
		#4;
		din = 8'h03;
		wt = {1'b1,8'hFE};
		sumin = 8'b0;
		#4;
		din = 8'h04;
		wt = {1'b1,8'hFD};
		sumin = 8'b0;
		#4;
		
		#40;

	end
      
endmodule