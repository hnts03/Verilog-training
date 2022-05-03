// input signal is sequence of 0 or 1.
// if input signal goes '0' to '1', output changes to '1'
// else, output is '0'



module Rising_Edge_Detector(in_sig, out_sig, clk, rstn);

// Port Declaration
input in_sig;
input clk;
input rstn;  // rstn is reset signal. Reset when rstn = 0
output out_sig;

// Internal Signal Declaration
reg cur, bef; // current signal, before signal

// Operation
always @(posedge clk or negedge rstn) begin
	// Initialize for bef and cur.
	if (!rstn) begin
		bef <= 1'b0;
		cur <= 1'b0;
		out_sig <= 1'b0;
	end

	else begin
		bef <= cur;
		cur <= in_sig;

		if(~bef & cur) out_sig <= 1'b1;
		else out_sig <= 1'b0;
	end
end

endmodule