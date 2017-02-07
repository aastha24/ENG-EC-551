`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:47 11/24/2016 
// Design Name: 
// Module Name:    convol_top 
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
module topmod
(
input wire clock,
input wire reset,
output wire [7:0] y
);

wire signed [17:0] m1_y0,m2_y1,m3_y2,m4_y0,m5_y1,m6_y2,m7_y0,m8_y1,m9_y2;
wire signed [8:0] w [8:0];
wire signed [8:0] m2_x2,m3_x3,m5_x2,m6_x3,m8_x2,m8_x3;

wire signed [8:0] x1,x2,x3;
wire [7:0] x1_t,x2_t,x3_t;
reg signed [17:0] y_t;

assign x1={1'b0,x1_t};
assign x2={1'b0,x2_t};
assign x3={1'b0,x3_t};


//window inputs - change for different kernels
assign w[0]={1'b1,8'hFF};
assign w[1]={1'b1,8'hFF};
assign w[2]={1'b1,8'hFF};
assign w[3]={1'b1,8'hFF};
assign w[4]={1'b0,8'h08};
assign w[5]={1'b1,8'hFF};
assign w[6]={1'b1,8'hFF};
assign w[7]={1'b1,8'hFF};
assign w[8]={1'b1,8'hFF};

mc m1(.din(x1),.wt(w[0]),.sumin(18'b0),.sumout(m1_y0),.x(m2_x2),.clock(clock),.reset(reset));
mc m2(.din(m2_x2),.wt(w[1]),.sumin(m1_y0),.sumout(m2_y1),.x(m3_x3),.clock(clock),.reset(reset));
mc m3(.din(m3_x3),.wt(w[2]),.sumin(m2_y1),.sumout(m3_y2),.x(),.clock(clock),.reset(reset));
mc m4(.din(x2),.wt(w[3]),.sumin(18'b0),.sumout(m4_y0),.x(m5_x2),.clock(clock),.reset(reset));
mc m5(.din(m5_x2),.wt(w[4]),.sumin(m4_y0),.sumout(m5_y1),.x(m6_x3),.clock(clock),.reset(reset));
mc m6(.din(m6_x3),.wt(w[5]),.sumin(m5_y1),.sumout(m6_y2),.x(),.clock(clock),.reset(reset));
mc m7(.din(x3),.wt(w[6]),.sumin(18'b0),.sumout(m7_y0),.x(m8_x2),.clock(clock),.reset(reset));
mc m8(.din(m8_x2),.wt(w[7]),.sumin(m7_y0),.sumout(m8_y1),.x(m8_x3),.clock(clock),.reset(reset));
mc m9(.din(m8_x3),.wt(w[8]),.sumin(m8_y1),.sumout(m9_y2),.x(),.clock(clock),.reset(reset));
memory_ram mr(.clock(clock),.reset(reset),.x1(x1_t),.x2(x2_t),.x3(x3_t));

always@(posedge clock)
begin
    if(reset)
    begin
        y_t=18'b0;
    end
    else
    begin
        if((m9_y2+m6_y2+m3_y2)<0)
		  begin
				y_t=18'b0;
		  end
		  else if(((m9_y2+m6_y2+m3_y2)>255))
		  begin
				y_t=8'b11111111;
		  end
		  else
		  begin
				y_t=m9_y2+m6_y2+m3_y2;
		  end
    end
end

assign y=y_t;

endmodule
