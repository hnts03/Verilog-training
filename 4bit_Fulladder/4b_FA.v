module 4bit_FA(X, Y, Cin, Cout, Sum);

// Port Declaration
input [3:0] X, Y;
input Cin;
output Cout;
output [3:0] Sum;

// internal signal declaration
wire [2:0]C;        // array of C is internal carry out of each 1bit FA

// Instance declaration
// Port design of FA : FullAdder(X, Y, Cin, Cout, S);
Fulladder FA0 (.X(X[0]), .Y(Y[0]), Cin, C[0], S[0]);
Fulladder FA1 (.X(X[1]), .Y(Y[1]), C[0], C[1], S[1]);
Fulladder FA2 (.X(X[2]), .Y(Y[2]), C[1], C[2], S[2]);
Fulladder FA3 (.X(X[3]), .Y(Y[3]), C[2], Cout, S[3]);


endmodule