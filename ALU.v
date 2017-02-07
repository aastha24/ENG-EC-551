`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand
// 
// Create Date:    20:04:02 10/15/2016 
// Design Name: 
// Module Name:    ALU 
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

module ALU(r2, r3, aop, r1);
input [31:0] r2; // 32 bit input to ALU
input [31:0] r3; // 32 bit input to ALU
input [2:0] aop; // ALU Operation
output reg[31:0] r1; //ALU Output
always @ (aop or r2 or r3) // Enter the block if either of the inputs are provided
begin
case (aop) //type of ALU operation required
0: r1 = r2; //MOV operation
1: r1 = ~r2; // NOT operation
2: r1 = r2+r3; //ADD operation
3: r1 = r2-r3; //SUB operation
4: r1 = r2|r3; //OR operation
5: r1 = r2&r3; // AND operation
6: r1 = r2^r3; // XOR operation
7: r1 = (r2<r3) ? 1:0; //SLT Operation
endcase
end
endmodule

