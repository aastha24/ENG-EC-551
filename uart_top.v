`timescale 1ns / 1ns


module uart_new(
	input clk,
	input kdata,
	input clk_k,
	input rst,
	//input [7:0] data,	// Connect to RX pin
	input  tx_start,
	output RsTx,
	output tx_ready,	// Connect to TX pin
	output starter,
	output sender
   );
	
	parameter CLK_RATE = 10000000;
	parameter BAUD_RATE = 19200;
	parameter SAMPLE_RATE = 10;

	wire clk_9_6M;
	wire uart_clk;
	wire sample_clk;
	wire sampler_data_out;
	wire [7:0] data;
	
	keyboard k1(.clk(clk_k),
					.data(kdata),
					.led(keyb_out));
	
	wire [7:0]data1,data2;
	
	assign starter = tx_start;
	assign send=(keyb_out==8'h5A)?1'b1:1'b0;
	Message M1(.uart_clk(uart_clk),
							.tx_start(tx_start),
							.tx_ready(tx_ready),
							.data(data1));
	Matrix m1(.uart_clk(uart_clk),
				 .tx_start(tx_start),
				 .tx_ready(tx_ready),
				 .data(data2));
	assign data=sender?data2:data1;
	transmitter tr(														// Transmitter
		.data_in(data),
		.tx_clk(uart_clk),
		.reset(rst),
		.start(tx_start),
		.data_out(RsTx),
		.tx_ready(tx_ready)
		);						
	
	clk_divide																			// Clock generator for TX and RX
	#( .CLK_RATE(CLK_RATE),
		.BAUD_RATE(BAUD_RATE),
		.SAMPLE_RATE(SAMPLE_RATE))
	clk_div(																
		.clk(clk_9_6M),
		.rst(rst),
		.clk_uart(uart_clk),
		.clk_sampling(sample_clk)
		);															
	
	PLL_9_6M PLL(
		.clk_in(clk),
		.clk_out_9_6M(clk_9_6M),
		.rst(rst)
		);

endmodule
