module Timer(TS, TL, ST, Clk);

input ST, Clk;
output TS, TL;

integer value;

assign TS = (value >= 4);  // time short. 5 cycles after reset
assign TL = (value >= 14); // time long. 15cycles after reset

always @(posedge ST)  value = 0; 			// async reset
always @(posedge Clk) value = value + 1;	// counter operation

endmodule