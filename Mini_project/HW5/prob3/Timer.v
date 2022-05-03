module Timer(TS, TL, ST, Emergency, Clk);

input ST, Clk Emergency;
output TS, TL;

integer value;

assign TS = Emergency ? (value >= 1) : (value >= 4);  // time short. 5 cycles after reset
assign TL = Emergency ? 1'b1 : (value >= 14); // time long. 15cycles after reset

always @(posedge ST)  value = 0; 			// async reset
always @(posedge Clk) value = value + 1;	// counter operation

endmodule