// *****************************************************
// ** This mac's input, output bit size controlled by **
// ** parameter 'in_size', 'out_size'                 **
// ** If you want to change size, override it!        **
// *****************************************************

module mac
    #(parameter in_size=8, out_size=16)
    (a, b, c, out);

input [size-1:0] a, b, c;
output [:0] out;



