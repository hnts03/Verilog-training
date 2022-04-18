module HalfAdder(X, Y, Cout, S);
input X, Y;
output Cout, S;

// Using AND gate
assign Cout = A && B;

// Using XOR gate
assign S = A ^ B;

endmodule