// general 4bit adder needs 7 cycles for calculation.
// This method needs only 4 cycles
// But more complex

module 4bit_cla(a, b, ci, co, s);

input [3:0] a,b;
input ci;

output wire co;
output wire [3:0] s;

reg [3:0] carrychain;
integer = i;

wire [3:0] p = a ^ b;   // propagation stage
wire [3:0] g = a & b;   // generation stage
wire [4:0] shiftcarry = {carrychain, ci};
wire [3:0] s = p ^ shiftcarry[3:0];     // sum
wire co = shiftcarry[4];    // final carry

always @(a or b or ci or g or p) begin
    carrychain[0] = g[0] + (p[0] & ci);
    for (i=1; i<=3; i++) carrychain[i] = g[i] + (p[i] & carrychain[i-1]);
end
endmodule