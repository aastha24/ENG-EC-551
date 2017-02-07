`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:37 11/03/2016 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
    input clock,
    input trigger,
    output clean
    );
	 
	 reg [3:0] deb;
	 reg clean;
	 
	 always@(posedge clock)
	 begin
	   deb[3:0] <= {deb[2:0],trigger};
	   if(deb[3:0] == 4'b0000)
	   begin
    	   clean <= 1'b0;
      end
      else if(deb[3:0] == 4'b1111)
      begin
         clean <= 1'b1;
      end
      else 
      begin
        clean <= clean;
      end
	 end
	 
endmodule
