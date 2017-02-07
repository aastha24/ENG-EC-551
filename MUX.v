`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    20:22:54 10/15/2016 
// Design Name: 
// Module Name:    MUX 
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

module MUX (rdata2,imm,datasrc,r3);
input [31:0] rdata2; // Read data 2 input to MUX
input [15:0] imm; // Immediate data to MUX
input datasrc; // Select line to MUX
output reg [31:0] r3; //Output of MUX

always @ (datasrc or rdata2 or imm)
begin
if (datasrc == 0) begin
r3 = rdata2;
end
else
begin
r3 = {16'd0,imm};
end
end
endmodule
