module tb_D;

wire OUT;
reg A, B, C;

// something in here
D D1(OUT, A, B, C);

initial begin
	# 0  A=1'b0; B=1'b0; C=1'b0;
	# 10 A=1'b1; B=1'b1; C=1'b1;
	# 10 A=1'b1; B=1'b0; C=1'b0;
	# 20 $finish;
end

endmodule