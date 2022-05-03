module traffic(HR, HY, HG, FR, FY, FG, reset, C, Clk);

input reset, C, Clk;
output HR, HY, HG, FR, FY, FG;

wire TS, TL;

Timer part1(TS, TL, ST, Clk);
FSM   part2(HR, HY, HG, FR, FY, FG, ST, TS, TL, C, reset, Clk);

endmodule