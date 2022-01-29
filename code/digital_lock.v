module digital_lock (
	input  wire       clk   ,
	input  wire       reset ,
	input  wire       d1    ,
	input  wire       d2    ,
	input  wire       d3    ,
	input  wire       d4    ,
	input  wire       d5    ,
	output wire       unlock,
	output wire       lock  ,
	output wire [3:0] an    ,
	output wire [7:0] sseg
);
	wire [2:0] disp_1_wire ;
	wire [2:0] disp_2_wire ;
	wire [2:0] disp_3_wire ;
	wire [2:0] disp_N_wire ;
	wire       new_clk_wire;
	Cntr_Unit Cntr (.clk(clk), .reset(reset), .new_clk(new_clk_wire));
	FSM_lock_Unit FSM_lock (
		.clk   (new_clk_wire),
		.lock  (lock        ),
		.unlock(unlock      ),
		.disp_1(disp_1_wire ),
		.disp_2(disp_2_wire ),
		.disp_3(disp_3_wire ),
		.disp_N(disp_N_wire ),
		.reset (reset       ),
		.d1    (d1          ),
		.d2    (d2          ),
		.d3    (d3          ),
		.d4    (d4          ),
		.d5    (d5          )
	);
	Disp_Unit Disp (
		.clk   (clk        ),
		.reset (reset      ),
		.disp_1(disp_1_wire),
		.disp_2(disp_2_wire),
		.disp_3(disp_3_wire),
		.disp_N(disp_N_wire),
		.sseg  (sseg       ),
		.an    (an         )
	);
endmodule
