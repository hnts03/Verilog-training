`timescale 1ns/1ps
// Verilog Testbench for Sequence Detector using Moore FSM

// module traffic(HR, HY, HG, FR, FY, FG, reset, C, Clk);
module Tb_traffic;

// Inputs
reg C, Clk, reset;

// Outputs
wire HR, HY, HG, FR, FY, FG;

traffic testmodule(
	.HR(HR),
	.HY(HY),
	.HG(HG),
	.FR(FR),
	.FY(FY),
	.FG(FG),
	.reset(reset),
	.C(C),
	.Clk(Clk)
);

initial begin
	Clk = 0;
	forever #1 Clk = ~Clk;
end

initial begin
	// Initialize Inputs
	// {HR, HY, HG, FR, FY, FG} = 6'b000000;
	C = 0;
	reset = 1

	#10;
	reset = 0;

	#20;
	C = 1;

	#20;
	C = 0;

	#30;
	C = 1;

	# 80;
	C = 0;
end

endmodule