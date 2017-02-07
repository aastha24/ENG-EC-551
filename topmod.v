`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:02 11/11/2016 
// Design Name: 
// Module Name:    topmod 
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
module topmod(input wire clk,input wire clk_k,reset,
input trigger, 
output wire hsync,vsync,
input wire data,
output [2:0] red, // three bit signal to drive color red
output [2:0] green, // three bit signal to drive color green
output [1:0] blue, // two bit signal to drive color blue (human eye is less sensitive to color blue)
output video_on,
output wire [7:0] z,
output [3:0] an,
output wire led1,
output wire led2);

reg toggle;
reg [7:0] out;
wire [7:0] led;
reg [3:0] count;


always @(posedge clk or posedge reset)
begin
if (reset)
count <= 4'b0;
else begin
count <= count + 1;
end 
end

keyboardtest k1(clk_k,data,led); 
vga_sq v1(count,reset,led,hsync,vsync,red,green,blue,video_on);

always @(posedge clk)
begin
out <= led;
if ((out == led) && (( out == 8'h6B) || (out == 8'h72)))
begin
toggle <= 1'b0;
end
else
begin
toggle <= 1'b1;
end
end

lfscounter l1(count,reset,trigger,toggle,z,an,led1,led2);
endmodule
