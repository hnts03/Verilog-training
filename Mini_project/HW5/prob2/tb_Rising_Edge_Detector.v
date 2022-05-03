`timescale 1ns/1ps

module tb_Rising_Edge_Detector;

reg in_sig;
reg out_sig;
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


	#(10) rstn   = 1'b1;
	#(10) in_sig = 1'b1;
	#(10) in_sig = 1'b0;
	#(15) in_sig = 1'b1;
	#( 5) in_sig = 1'b0;
	#(30) in_sig = 1'b1;
	#(10) $finish
end

initial begin
	#(0);
	clk = 1'b0;
	forever #(1) clk = ~clk;
end

endmodule