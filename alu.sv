module and
#(parameter N)
(input wire [N-1:0] a, input wire [N-1:0] b, output wire [N-1:0] c);
    assign c = a & b;
endmodule