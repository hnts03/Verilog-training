module multiplier 
#(
    parameter size = 8,
    parameter psize=16) 
(
    multiplier,
    multiplicand,
    prod
);

// Port declaration
input [size-1:0] multiplier, multiplicand;
output [psize-1:0] prod;

// Internal signal declaration
reg [size-1:0] sh_n; // work as low bits memory
reg [size:0] pp;     // work as high bits memory
integer i;

// Operation
assign prod = {pp[size-1:0], sh_n};

always @(*) begin
    sh_n = n; // carry shift register
    pp = 0;   // partial multiply initialize

    for (i = 0; i<size; i++) begin
        if (sh_n[0]) pp = pp + m;       // partial multiply
        sh_n = {pp[0], sh_n[size-1:1]}; // right shift, save LSB of partial mult.
        pp = {1'b0, pp[size:1]};        // circulation for right
    end
end
endmodule