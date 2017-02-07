`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
//
// Create Date:   10:50:45 10/18/2016
// Design Name:   call_modules
// Module Name:   X:/EC551/LAB_1/t_call_modules.v
// Project Name:  LAB_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: call_modules
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_call_modules;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] inst;

	// Outputs
	wire [31:0] alu_out;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	call_modules uut (
		.clk(clk), 
		.rst(rst), 
		.inst(inst), 
		.alu_out(alu_out)
	);

always begin
		#1 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
	clk = 0;
	rst = 1;
	#1 rst = 0;
	#1 rst = 1;
	inst = {2'b01,1'b1,3'b010,5'b00000,5'b00001,16'h9525};
	#4 inst = {2'b01,1'b1,3'b010,5'b00001,5'b00001,16'h9635};
	for(i = 0;i < 7;i = i + 1)
	begin
		#3 inst = {2'b01,1'b0,i,5'b00010,5'b00000,5'b00001,11'd0};
	end
	#2 inst = 32'h00000000;
	end
endmodule	
	



