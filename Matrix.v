`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:43 11/14/2016 
// Design Name: 
// Module Name:    Matrix 
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
module Matrix(input uart_clk,
				  input tx_start,
				  input tx_ready,
				  output reg [7:0] data
							);
							
	reg [3:0] count;
	reg first,second;
	always @(posedge uart_clk) begin
		if (~tx_start) count<=4'd0;
		if (tx_start && count==4'd0 && ~tx_ready)begin
			data<=8'd77;
			if (data==8'd77 && count==4'd0 && ~tx_ready)	
				data<=8'd97;
			if (data==8'd97 && count==4'd0 && ~tx_ready)
				data<=8'd116;
			if (data==8'd116 && count==4'd0 && ~tx_ready)
				data<=8'd114;
			if (data==8'd114 && count==4'd0 && ~tx_ready)
				data<=8'd105;
			if (data==8'd105 && count==4'd0 && ~tx_ready)
				data<=8'd120;
			count<=count+4'd1;
			if(count==4'd11) count<=4'd0;
		end
	end
	
	/*reg hold;
	reg [3:0]state;
	
	always @ (posedge uart_clk) begin
		hold<=tx_start;
		if (!tx_start) state<=4'b0000;
		if (hold!=tx_start && tx_start==1)begin
			state<=4'b0001;
		end
		count<=count+4'd1;
		if(count==4'd11) count<=4'd0;
		if (hold && count==4'd0)begin
			if (state==4'b0001)begin
				data<=8'd87;
				state<=4'd2;
			end
			else if(state==4'd2 && count==4'd0)begin
				data<=8'd97;
				state<=4'd3;
			end
			else if(state==4'd3 && count==4'd0)begin
				data<=8'd107;
				state<=4'd4;
			end
			else if(state==4'd4 && count==4'd0)begin
				data<=8'd101;
				state<=4'd0;
			end
		end
	end

*/

endmodule
