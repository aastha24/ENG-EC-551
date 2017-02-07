`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:42 11/24/2016
// Design Name:   convol_top
// Module Name:   X:/EC551/Anand_Nair_EC551_Lab3/systolic_array/t_convol.v
// Project Name:  systolic_array
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: convol_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module convolution_top_test;

	reg clock;
	reg reset;
	integer file;
	reg [31:0] count;
	reg [31:0] new;
	wire  [7:0] y;
	parameter size=6;
	
	topmod uut (
		.clock(clock), 
		.reset(reset), 
		.y(y)
	);
	
	always
	begin
		clock=1'b0;
		#2;
		clock=1'b1;
		#2;
	end

	initial begin
	reset=1'b1;
	#4;

	count=0;
	new=0;
	file=$fopen("outimage.txt","w");
	#30	reset=1'b0;
	#50000 $finish;

	end
	
	always @ (negedge clock)
	begin
		count<=count+1;
		if(count>10 && new<9604)
		begin
			file=$fopen("outimage.txt","a");
			$fwrite(file,"%d \n",y);
			new<=new+1;
		end
	$fclose(file);
   end
endmodule

