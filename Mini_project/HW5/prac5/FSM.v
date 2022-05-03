module FSM(HR, HY, HG, FR, FY, FG, ST, TS, TL, C, reset, Clk);

input TS, TL, C, reset, Clk;
output HR, HY, HG, FR, FY, FG, ST;

reg [6:1] state;
reg ST;

parameter highwaygreen   = 6'b001100;
parameter highwayyellow  = 6'b010110;
parameter farmroadgreen  = 6'b100001;
parameter farmroadyellow = 6'b100010;

assign HR = state[6];
assign HY = state[5];
assign HG = state[4];
assign FR = state[3];
assign FY = state[2];
assign FG = state[1];

always @(posedge Clk) begin
	if (reset) begin
		state = highwaygreen;
		ST = 1;
	end

	else begin
		case(state)
		highwaygreen:
			if(TL & C) begin
				state = highwayyellow;
				ST = 1;
			end

		highwayyellow:
			if(TS) begin
				state = farmroadgreen;
				ST = 1;
			end

		farmroadgreen:
			if(TL | !C) begin
				state = farmroadyellow;
				ST = 1;
			end

		farmroadyellow:
			if(TS) begin
				state = highwaygreen;
				ST = 1;
			end
		endcase
	end
end
endmodule