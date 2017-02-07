`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aastha Anand & Runal Nair
//
// Create Date:   19:29:17 11/12/2016
// Design Name:   lfscounter
// Module Name:   X:/EC551/Lab2/lfsr_counter/main_text.v
// Project Name:  lfsr_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfscounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_test;

    // Inputs
    reg clock;
    reg reset;
    reg trigger;
    reg toggle;

    // Outputs
    wire [7:0] z;
    wire [3:0] an;
    wire led1;
    wire led2;

    // Instantiate the Unit Under Test (UUT)
    lfscounter uut (
        .clock(clock),
        .reset(reset),
        .trigger(trigger), 
        .toggle(toggle),
        .z(z), 
        .an(an),
        .led1(led1), 
        .led2(led2)
    );

    always #5 clock =~clock;
    initial begin
        // Initialize Inputs
        clock = 0;
        reset = 0;
        trigger = 0;
        toggle = 0;
        
        #10 reset = 1;
        #15 reset = 0;
        #20 trigger = 1;
        #25 trigger = 0;
        #30 toggle = 1;
        #35 toggle = 0;
        #40 trigger = 1;

        // Wait 100 ns for global reset to finish
        #100;

    end

endmodule

