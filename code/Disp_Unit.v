module Disp_Unit (
	input      [2:0] disp_1,
	input      [2:0] disp_2,
	input      [2:0] disp_3,
	input      [2:0] disp_N,
	input            reset ,
	input            clk   ,
	output reg [7:0] sseg  ,
	output reg [3:0] an
);
	localparam   N       = 18;
	reg  [N-1:0] q_reg       ;
	wire [N-1:0] q_next      ;
	reg  [  2:0] disp_in     ;

	always @ ( posedge clk, posedge reset)
		if (reset)
			q_reg <= 0;
		else
			q_reg <= q_next;
	assign q_next = q_reg + 1;

	always @*
		case (q_reg [N-1:N-2])
			2'b00 :
				begin
					an      = 4'b1110;
					disp_in = disp_1;
				end
			2'b01 :
				begin
					an      = 4'b1101;
					disp_in = disp_2;
				end
			2'b10 :
				begin
					an      = 4'b1011;
					disp_in = disp_3;
				end
			default :
				begin
					an      = 4'b0111;
					disp_in = disp_N;
				end
		endcase
		always @*
		begin
			case (disp_in)
				3'b000  : sseg[6:0] = 7'b1000000 ;
				3'b001  : sseg[6:0] = 7'b1111001 ;
				3'b010  : sseg[6:0] = 7'b0100100 ;
				3'b011  : sseg[6:0] = 7'b0110000 ;
				3'b100  : sseg[6:0] = 7'b0011001 ;
				3'b101  : sseg[6:0] = 7'b0010010 ;
				default : sseg[6:0] = 7'b1000000 ;
			endcase
			sseg[7] = 1'b1;
		end
endmodule

