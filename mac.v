`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:33 11/23/2016 
// Design Name: 
// Module Name:    mac 
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
module mc(
input wire signed [8:0] din, //the input data value(pixel)
input wire signed [8:0] wt, //The window or weight value
input wire signed [17:0] sumin,
output reg signed [17:0] sumout,
output reg signed [8:0] x,
input wire clock,
input wire reset
);

wire signed [17:0] sum;
reg signed [8:0] temp1=8'd0;

assign sum=(din*wt)+sumin; //Multiplication and accumulation

always@(posedge clock)
begin
    if(reset)
    begin
        sumout<=18'b0;
        temp1<=9'b0;
        x<=9'b0;
    end
    else
    begin
        temp1<=din;
        x<=temp1;
        sumout<=sum;
    end

end

endmodule
