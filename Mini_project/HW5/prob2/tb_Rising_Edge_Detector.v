`timescale 1ns/1ps

module tb_Rising_Edge_Detector;

parameter CLK_CYCLE=2;

reg in_sig;
wire out_sig;
reg clk;
reg rstn;

Rising_Edge_Detector p1(
	.in_sig(in_sig), 
	.out_sig(out_sig),
	.clk(clk),
	.rstn(rstn)
);

initial begin
	rstn = 1'b0;
	in_sig = 1'b0;

	#(4 * CLK_CYCLE) rstn   = 1'b1;
	#(5 * CLK_CYCLE) in_sig = 1'b1;
	#(5 * CLK_CYCLE) in_sig = 1'b0;
	#(5 * CLK_CYCLE) in_sig = 1'b1;
	#(5 * CLK_CYCLE) in_sig = 1'b0;
	#(5 * CLK_CYCLE) in_sig = 1'b1;
	#(5 * CLK_CYCLE) in_sig = 1'b0;
	#(5 * CLK_CYCLE) in_sig = 1'b1;
	#(5 * CLK_CYCLE) in_sig = 1'b0;
end

initial begin
	#(0);
	clk = 1'b0;
	forever #(1) clk = ~clk;
end

endmodule