`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:03 11/14/2016 
// Design Name: 
// Module Name:    Wake_Up_Aditya 
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
module Message(input uart_clk,
							 input tx_start,
							 input tx_ready,
							 output reg [7:0] data
							);
							
	reg [3:0] count;
	reg first,second;
	always @(posedge uart_clk) begin
		if (~tx_start) count<=4'd0;
		if (tx_start && count==4'd0 && ~tx_ready)begin
			data<=8'd87;
			if (data==8'd87 && count==4'd0 && ~tx_ready)	
				data<=8'd97;
			if (data==8'd97 && count==4'd0 && ~tx_ready)
				data<=8'd107;
			if (data==8'd107 && count==4'd0 && ~tx_ready)
				data<=8'd101;
			if (data==8'd101 && count==4'd0 && ~tx_ready)begin
				data<=8'd32;
				first<=1'b1;
			end
			if (data==8'd32 && count==4'd0 && first && ~tx_ready)begin
				data<=8'd85;
				first<=0;
			end
			if (data==8'd85 && count==4'd0 && ~tx_ready)
				data<=8'd112;
			if (data==8'd112 && count==4'd0 && ~tx_ready)begin
				data<=8'd32;
				second<=1'b1;
			end
			if (data==8'd32 && count==4'd0 && second && ~tx_ready)begin
				data<=8'd65;			
				second<=1'b0;
			end
			if (data==8'd65 && count==4'd0 && ~tx_ready)
				data<=8'd97;
			if (data==8'd97 && count==4'd0 && ~tx_ready)
				data<=8'd115;
			if (data==8'd115 && count==4'd0 && ~tx_ready)
				data<=8'd116;
			if (data==8'd116 && count==4'd0 && ~tx_ready)
				data<=8'd104;
			if (data==8'd104 && count==4'd0 && ~tx_ready)
				data<=8'd97;
				
			count<=count+4'd1;
			if(count==4'd11) count<=4'd0;
		end
	end
	
	

endmodule
