module FullAdder(X, Y, Cin, Cout, S);

input X, Y, Cin;
output Cout, S;

assign Cout = (X && Y) || (Y && Cin) || (X && Cin);
assign S = X ^ Y ^ Cin;

endmodule