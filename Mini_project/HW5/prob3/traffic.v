module traffic(HR, HY, HG, FR, FY, FG, reset, C, Clk);

input reset, Clk;
input C, Emergency; 
output HR, HY, HG, FR, FY, FG;

wire TS, TL;

Timer part1(.TS(TS), .TL(TL), .ST(ST), .Emergency(Emergency), .Clk(Clk));
FSM   part2(.HR(HR), .HY(HY), .HG(HG), .FR(FR), .FY(FY), .FG(FG), .ST(ST), .TS(TS), .TL(TL), .C(C), .Emergency(Emergency), .reset(reset), .Clk(Clk));

endmodule