`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
//
// Create Date:   20:27:14 10/15/2016
// Design Name:   MUX
// Module Name:   X:/EC551/LAB_1/t_MUX.v
// Project Name:  LAB_1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_MUX;

	// Inputs
	reg [31:0] rdata2;
	reg [15:0] imm;
	reg datasrc;

	// Outputs
	wire [31:0] r3;

	// Instantiate the Unit Under Test (UUT)
	MUX uut (
		.rdata2(rdata2), 
		.imm(imm), 
		.datasrc(datasrc), 
		.r3(r3)
	);

	initial begin
		#50 $finish;
		end
		initial begin
		rdata2 = 0;
		imm = 16'd1;
		datasrc = 0;
		#20 datasrc = 0;
		#20 datasrc = 1;
      end
      
endmodule

