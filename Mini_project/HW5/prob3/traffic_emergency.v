// ************************************
// *********** Timer module ***********
// ************************************
module Timer(TS, TL, ST, Emergency, Clk);

input ST, Clk Emergency;
output TS, TL;

integer value;

assign TS = Emergency ? (value >= 1) : (value >= 4);  // time short. 5 cycles after reset
assign TL = Emergency ? 1'b1 : (value >= 14); // time long. 15cycles after reset

always @(posedge ST)  value = 0; 			// async reset
always @(posedge Clk) value = value + 1;	// counter operation

endmodule



// ************************************
// ************ FSM module ************
// ************************************
module FSM(HR, HY, HG, FR, FY, FG, ST, TS, TL, C, Emergency, reset, Clk);

input TS, TL, C, Emergency, reset, Clk;
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
		state <= highwaygreen;
		ST <= 1;
	end

	else begin
		ST <= 0;

		case(state)
		highwaygreen:
			if((TL & C) | Emergency) begin
				state <= highwayyellow;
				ST <= 1;
			end

		highwayyellow:
			if(TS) begin
				state <= farmroadgreen;
				ST <= 1;
			end

		farmroadgreen:
			if(TL | !C) begin
				state <= farmroadyellow;
				ST <= 1;
			end

		farmroadyellow:
			if(TS) begin
				state <= highwaygreen;
				ST <= 1;
			end
		endcase
	end
end
endmodule



// ************************************
// ********** traffic module **********
// ************************************ 
module traffic_emergency(HR, HY, HG, FR, FY, FG, reset, C, Clk);

input reset, Clk;
input C, Emergency; 
output HR, HY, HG, FR, FY, FG;

wire TS, TL;

Timer part1(.TS(TS), .TL(TL), .ST(ST), .Emergency(Emergency), .Clk(Clk));
FSM   part2(
	.HR(HR), .HY(HY), .HG(HG), 
	.FR(FR), .FY(FY), .FG(FG), 
	.ST(ST), .TS(TS), .TL(TL), 
	.C(C), .Emergency(Emergency), 
	.reset(reset), .Clk(Clk)
);

endmodule