`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 12:30:08 AM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );

reg reset;
reg        clk          ;
	always begin 
		#5 clk=!clk;
	end 

// input  wire       clk   ,
// 	input  wire       reset ,
reg       d1  ;
reg       d2  ;
reg       d3  ;
reg       d4  ;
reg       d5  ;
// 	output wire       unlock,
// 	output wire       lock  ,
// 	output wire [3:0] an    ,
// 	output wire [7:0] sseg

 digital_lock UUT(
	.clk(clk)   ,
	.reset(reset) ,
	.d1(d1)    ,
	.d2(d2)    ,
	.d3(d3)    ,
	.d4(d4)    ,
	.d5(d5)    ,
	.unlock(),
	.lock()  ,
	.an()    ,
	.sseg()
);

	initial begin
	clk 		<= 1'b1;
	reset      	<= 1'b1;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
	#100; 
	reset      	<= 1'b0;
#10000;
d1 <= 0;
d2 <= 1;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 1;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 1;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
#10000;
d1 <= 0;
d2 <= 1;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 1;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 1;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
d1 <= 0;
d2 <= 0;
d3 <= 0;
d4 <= 0;
d5 <= 0;
#10000;
	end 
endmodule
