`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/08/2020 12:27:27 AM
// Design Name:
// Module Name: FSM_lock_Unit
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


module FSM_lock_Unit (
	input            clk   ,
	input            d1    ,
	input            d2    ,
	input            d3    ,
	input            d4    ,
	input            d5    ,
	output reg       lock  ,
	output reg       unlock,
	output reg [2:0] disp_1,
	output reg [2:0] disp_2,
	output reg [2:0] disp_3,
	output reg [2:0] disp_N,
	input            reset
);
	parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011,E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;

	reg [2:0] N         ;
	reg [2:0] N_r       ;
	reg [2:0] state_next;
	reg [2:0] state_reg ;

	reg [2:0] disp_1_r;
	reg [2:0] disp_2_r;
	reg [2:0] disp_3_r;
	reg [2:0] disp_N_r;
	reg lock_r;
	reg unlock_r;
	// assign disp_N = 3'b000;
	reg d1_r;
	reg d2_r;
	reg d3_r;
	reg d4_r;
	reg d5_r;

	wire d1_flag;
	wire d2_flag;
	wire d3_flag;
	wire d4_flag;
	wire d5_flag;
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			d1_r <= 0;
			d2_r <= 0;
			d3_r <= 0;
			d4_r <= 0;
			d5_r <= 0;
		end else begin
			d1_r <= d1;
			d2_r <= d2;
			d3_r <= d3;
			d4_r <= d4;
			d5_r <= d5;
		end
	end
	assign d1_flag = ~d1_r & d1;
	assign d2_flag = ~d2_r & d2;
	assign d3_flag = ~d3_r & d3;
	assign d4_flag = ~d4_r & d4;
	assign d5_flag = ~d5_r & d5;





	always @ ( posedge clk or posedge reset)
		if (reset)
			state_reg <= A;
		else
			state_reg <= state_next;

	always @ ( posedge clk  or posedge reset)
		if (reset) begin
			N_r      <= 2;
			disp_1_r <= 0;
			disp_2_r <= 0;
			disp_3_r <= 0;
			disp_N_r <= 2;
			unlock_r <= 0;
			lock_r   <= 0;

		end else begin
			N_r      <= N;
			disp_1_r <= disp_1;
			disp_2_r <= disp_2;
			disp_3_r <= disp_3;
			disp_N_r <= disp_N;
			unlock_r <= unlock;
			lock_r   <= lock;
		end

	always @(state_reg, d1_flag, d2_flag, d3_flag, d4_flag, d5_flag) begin
		disp_1     = disp_1_r;
		disp_2     = disp_2_r;
		disp_3     = disp_3_r;
		disp_N     = disp_N_r;
		unlock     = unlock_r;
		lock       = lock_r;
		N          = N_r;
		state_next = state_reg;
		case (state_reg)
			A :
				begin
					disp_1 = 3'b000;
					disp_2 = 3'b000;
					disp_3 = 3'b000;
					if (d2_flag)
						begin
							disp_1     = 3'b010;
							state_next = B;
						end
					else
						begin
							if (d1_flag) begin
								disp_1     = 3'b001;
								state_next = E;
							end else if (d3_flag) begin
								disp_1     = 3'b011;
								state_next = E;
							end else if (d4_flag) begin
								disp_1     = 3'b100;
								state_next = E;
							end else if (d5_flag) begin
								disp_1     = 3'b101;
								state_next = E;
							end
						end
				end
			B :
				begin
					if (d4_flag)
						begin
							disp_2     = 3'b100;
							state_next = C;
						end
					else
						begin
							if (d1_flag) begin
								disp_2     = 3'b001;
								state_next = F;
							end else if (d2_flag) begin
								disp_2     = 3'b010;
								state_next = F;
							end else if (d3_flag) begin
								disp_2     = 3'b011;
								state_next = F;
							end else if (d5_flag) begin
								disp_2     = 3'b101;
								state_next = F;
							end
						end
				end
			C :
				begin
					if (d1_flag)
						begin
							disp_3     = 3'b001;
							state_next = D;
						end
					else
						begin
							if (d4_flag) begin
								disp_3     = 3'b100;
								state_next = G;
							end else if (d2_flag) begin
								disp_3     = 3'b010;
								state_next = G;
							end else if (d3_flag) begin
								disp_3     = 3'b011;
								state_next = G;
							end else if (d5_flag) begin
								disp_3     = 3'b101;
								state_next = G;
							end
						end
				end
			D :
				begin
					unlock = 1;
					lock   = 0;
				end
			E :
				begin
					if (d1_flag) begin
						disp_2     = 3'b001;
						state_next = F;
					end else if (d4_flag) begin
						disp_2     = 3'b100;
						state_next = F;
					end else if (d2_flag) begin
						disp_2     = 3'b010;
						state_next = F;
					end else if (d3_flag) begin
						disp_2     = 3'b011;
						state_next = F;
					end else if (d5_flag) begin
						disp_2     = 3'b101;
						state_next = F;
					end
				end
			F :
				begin
					if (d1_flag) begin
						disp_3     = 3'b001;
						state_next = G;
					end else if (d4_flag) begin
						disp_3     = 3'b100;
						state_next = G;
					end else if (d2_flag) begin
						disp_3     = 3'b010;
						state_next = G;
					end else if (d3_flag) begin
						disp_3     = 3'b011;
						state_next = G;
					end else if (d5_flag) begin
						disp_3     = 3'b101;
						state_next = G;
					end
				end
			G :
				begin
					N      = N_r - 1;
					disp_N = N_r - 1;
					if (N_r > 1)
						state_next = A;
					else
						begin
							state_next = H;
							unlock = 0;
							lock   = 1;
						end
				end
			H :
				begin
					unlock = 0;
					lock   = 1;
				end
		endcase
	end
endmodule
