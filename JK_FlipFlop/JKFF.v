module JKFF(Set, Reset, J, K, Clk, Q, QN);

// Port Declaration
input Set, Reset, J, K, Clk;
output Q, QN;

// Internal signal Declaration
reg Qint; // Qint means saved data in FF

// Operation
// J-K FF works
// This code assume that not occur that Set == Reset == 0 at same time
always@ (posedge Clk or Reset or Set)
begin
    // if Reset == 0
    if (~Reset) 
        #8 Qint <= 0;
    
    // if Set == 0
    else if (~Set) 
        #8 Qint <= 1;

    // if Reset == 1 && Set == 1
    // FF operation
    else
        Qint <= #10 ((J && ~Qint) || (~K && Qint));
end

assign Q = Qint;
assign QN = ~Qint;

endmodule