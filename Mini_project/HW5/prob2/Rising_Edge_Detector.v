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
reg bef; // before signal

// Operation
always @(posedge clk or negedge rstn) begin
	// Initialize for bef and cur.
	if (!rstn) begin
		bef <= 1'b0;
	end

	else begin
		bef <= in_sig;

	end
end

assign out_sig = (~bef & in_sig);

endmodule