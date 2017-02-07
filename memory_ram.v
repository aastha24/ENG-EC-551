`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:41 11/25/2016 
// Design Name: 
// Module Name:    memory_ram 
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
module memory_ram
(
input wire clock,
input wire reset,
output wire [7:0] x1,
output wire [7:0] x2,
output wire [7:0] x3
);

reg [7:0] memory [9999:0];

initial
begin
	$readmemb("input.txt",memory);
end

reg [31:0] location;
reg [6:0] count;

always@(posedge clock)
begin
	if(reset)
	begin
		location=10'b0;
		count=7'b0;
	end
	else
	begin
		if(location==9799)
		begin
			location=10'b0;
		end
		else
		begin
			if(count>97)
			begin
				location=location+3;
				count=7'b0;
			end
			else
			begin
				location=location+1'b1;
				count=count+1'b1;	
			end
		end
	end

end

assign x1=memory[location];
assign x2=memory[location+8'h64];
assign x3=memory[location+8'hC8];


endmodule
