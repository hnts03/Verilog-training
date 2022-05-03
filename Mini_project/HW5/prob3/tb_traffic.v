`timescale 1ns/1ps
// Verilog Testbench for Sequence Detector using Moore FSM

// module traffic(HR, HY, HG, FR, FY, FG, reset, C, Clk);
module Tb_traffic_emergency;

// Inputs
reg C, Emergency, Clk, reset;

// Outputs
wire HR, HY, HG, FR, FY, FG;

traffic_emergency testmodule(
	.HR(HR),
	.HY(HY),
	.HG(HG),
	.FR(FR),
	.FY(FY),
	.FG(FG),
	.reset(reset),
	.C(C),
	.Emergency(Emergency),
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
	Emergency = 0;
	reset = 1

	#10;
	reset = 0;

	#20;
	C = 1;

	#20;
	C = 0;

	#30;
	C = 1;

	//# 80;
	//C = 0;

	#70; // 150ns from start time.
	#50; // 50ns passed
	Emergency = 1; // C = 1, Emergency = 1

	#20;
	C = 0 		   // C = 0, Emergency = 1

	#20;
	Emergency = 0; // C = 0, Emergency = 0


end

endmodule