`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
//
// Create Date:   20:12:01 10/15/2016
// Design Name:   ALU
// Module Name:   X:/EC551/LAB_1/t_ALU.v
// Project Name:  LAB_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_ALU;

	// Inputs
	reg [31:0] r2;
	reg [31:0] r3;
	reg [2:0] aop;

	// Outputs
	wire [31:0] r1;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.r2(r2), 
		.r3(r3), 
		.aop(aop), 
		.r1(r1)
	);

	initial begin
	#100 $finish;
	end
	
	initial begin
	r2 = 32'd0;
	r3 = 32'd1;
	aop =0;
	#20 aop=3'd7;
	#20 aop=3'd1;
	end
      
endmodule

