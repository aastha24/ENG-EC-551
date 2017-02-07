`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    13:36:38 11/14/2016
// Design Name:
// Module Name:    lfscounter
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
module lfscounter(
    input clock,
    input reset,
    input trigger,
    input toggle,
     input switchbit,
    output reg [7:0] z,
    output reg [3:0] an,
    output reg led1,
    output reg led2
    );

     reg [3:0] an_shift;
      reg [3:0] var;
      reg status_check;
     reg [23:0] clk;
     reg [15:0] res1;
      reg [3:0] res;

     wire a;
     wire b;
     wire c;
      wire fb = res[0] ^ res[3];
     assign a = res1[15] ^ res1[13];
     assign b = a ^ res1[12];
     assign c = b ^ res1[10];

     //debounce db(clock,trigger,clean);

     always@(posedge clock,posedge reset) begin
          if(reset) clk <= 24'd0;
            else clk <= clk + 1;
     end

      //debounce db(clk[18],trigger,clean);


     always@(posedge clk[23],posedge reset)
     begin
      if(switchbit)begin
       if(reset) begin
           res <= 4'b0000;
           status_check <= 1'b0;
           led1 <= 1'b0;
           led2 <= 1'b0;
      end
      else begin
      if (trigger) begin
        if (!status_check)begin
           res <= res + 4'b0001;
           led1 <= 1'b1;  // counter led
           led2 <= 1'b0;  // lfsr led
        end
        else begin
          res <= {res[2],res[1],fb,res[3]};
          led1 <= 1'b0;
          led2 <= 1'b1;
        end
      end
      if (toggle) begin
         if (!status_check)begin
           res <= {res[2],res[1],fb,res[3]};
           led1 <= 1'b0;
           led2 <= 1'b1;
           status_check <= 1;
         end
         else begin
           res <= res + 4'b0001;
           led1 <= 1'b1;
           led2 <= 1'b0;
           status_check <= 0;
        end
     end
      end
      end
      else begin
       if(reset) begin
           res1 <= 16'b0000000000000000;
           status_check <= 1'b0;
           led1 <= 1'b0;
           led2 <= 1'b0;
       end
       else begin
       if (trigger) begin
         if (!status_check)begin
            res1 <= res1 + 16'b0000000000000001;
             led1 <= 1'b1;  // counter led
             led2 <= 1'b0;  // lfsr led
          end
        else begin
          res1 <= {res1[14:0],c};
          led1 <= 1'b0;
             led2 <= 1'b1;
        end
      end
      if (toggle) begin
         if (!status_check)begin
           res1 <= {res1[14:0],c};
           led1 <= 1'b0;
           led2 <= 1'b1;
           status_check <= 1;
         end
         else begin
           res1 <= res1 + 16'b0000000000000001;
              led1 <= 1'b1;
              led2 <= 1'b0;
              status_check <= 0;
         end
      end
      end
        end
        end


   always @(posedge clk[23])
    begin
    if (reset)begin
    an_shift <= 4'b1110;
    end
    else begin
    an_shift <= {an_shift[2:0],an_shift[3]};
    end
    end

    always @(*)
    begin
    if(switchbit)begin
    case(an_shift)
    4'b1110: var <=res1[3:0];
    4'b1101: var <=res1[7:4];
    4'b1011: var <=res1[11:8];
    4'b0111: var <=res1[15:12];
    endcase


    case(var)
    4'b0000 :z = 8'b00000011; //Hex 0
    4'b0001 :z = 8'b10011111; //Hex 1
    4'b0010 :z = 8'b00100101; //Hex 2
    4'b0011 :z = 8'b00001101; //Hex 3
    4'b0100 :z = 8'b10011001; //Hex 4
    4'b0101 :z = 8'b01001001; //Hex 5
    4'b0110 :z = 8'b01000001; //Hex 6
    4'b0111 :z = 8'b00011111; //Hex 7
    4'b1000 :z = 8'b00000001; //Hex 8
    4'b1001 :z = 8'b00001001; //Hex 9
    4'b1010 :z = 8'b00010001; //Hex A
    4'b1011 :z = 8'b11000001; //Hex B
    4'b1100 :z = 8'b01100011; //Hex C
    4'b1101 :z = 8'b10000101; //Hex D
    4'b1110 :z = 8'b01100001; //Hex E
    4'b1111 :z = 8'b01110001; //Hex F
    endcase
     end
     else begin
     an <= 4'b1110;
     case(res)
    4'b0000 :z = 8'b00000011; //Hex 0
    4'b0001 :z = 8'b10011111; //Hex 1
    4'b0010 :z = 8'b00100101; //Hex 2
    4'b0011 :z = 8'b00001101; //Hex 3
    4'b0100 :z = 8'b10011001; //Hex 4
    4'b0101 :z = 8'b01001001; //Hex 5
    4'b0110 :z = 8'b01000001; //Hex 6
    4'b0111 :z = 8'b00011111; //Hex 7
    4'b1000 :z = 8'b00000001; //Hex 8
    4'b1001 :z = 8'b00001001; //Hex 9
    4'b1010 :z = 8'b00010001; //Hex A
    4'b1011 :z = 8'b11000001; //Hex B
    4'b1100 :z = 8'b01100011; //Hex C
    4'b1101 :z = 8'b10000101; //Hex D
    4'b1110 :z = 8'b01100001; //Hex E
    4'b1111 :z = 8'b01110001; //Hex F
     default: z = 8'b00000000;
    endcase
     end
     end
endmodule








