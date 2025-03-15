module and
#(parameter N)
(input logic [N-1:0] a, input logic [N-1:0] b, output logic [N-1:0] c);
    assign c = a & b;
endmodule

// generate a ton of full-adders to make a N bit ripple-carry
module adder 
#(parameter N)
(input logic [N-1:0] num_1, num_2, output logic [N-1:0] sum );

    logic init_carry, discarded_carry; // discarded carry is intentionally not an output, that value will get discarded
    assign init_carry = 0;
    logic [N-1:1] carries;

    genvar i;
    generate // i'll validate that this generate works later
        for (i = 0; i < N; i++0) begin
            if (i == 0) begin
                fadder f0 (.a(num_1[i]), .b(num_2[i]), .c_in(init_carry), .sum(sum[i]), .c_out(carries[i]) );
            else if (i == N-1) begin
                fadder fN (.a(num_1[i]), .b(num_2[i]), .c_in(carries[i-1]), .sum(sum[i]), .c_out(discarded_carry) );
            end 
            else begin
                fadder fi (.a(num_1[i]), .b(num_2[i]), .c_in(carries[i-1]), .sum(sum[i]), .c_out(carries[i]))'
            end
        end
    endgenerate


endmodule

module fadder(input logic a, b, c_in, output logic sum, carry_out);

    // simple fulladder implementation
    assign c_out = (a & b) + c_in & (a ^ b);
    assign sum = a ^ b ^ c_in;

endmodule