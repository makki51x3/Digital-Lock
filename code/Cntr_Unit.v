
module Cntr_Unit (
	input      clk    ,
	input      reset  ,
	output reg new_clk
);
	reg [31:0] r_reg;
	always @ (posedge clk, posedge reset)begin
		if (reset) begin
			r_reg   <= 0;
			new_clk <= 0;
		end else begin
			if (r_reg == 50000000) begin //10000000
				new_clk <= ~new_clk;
				r_reg   <= 0;
			end else begin
				new_clk <= new_clk;
				r_reg   <= r_reg + 1;
			end
		end
	end
endmodule
