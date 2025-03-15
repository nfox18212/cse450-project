module Sixteenbit_SUB (
    input  logic [15:0] A,
    input  logic [15:0] B,
    output logic [15:0] Answer
);
    assign Answer = A - B;
endmodule

module Sixteenbit_SLL (
    input  logic [15:0] A,
  input  logic [7:0] Shift,
  output logic [15:0] Answer
);
        
    assign Answer = A << Shift;
    
endmodule

module Sixteenbit_LW (
    input  logic [15:0] Base,
  input  logic [7:0] Offset,
    input  logic [15:0] Data,
    output logic [15:0] Answer
);
    logic [15:0] NewAdd;

  assign NewAdd = Base + {{12{Offset[7]}}, Offset};
        assign Answer = Data;

endmodule

module Sixteenbit_ADDI (
  input  logic [15:0] A,
  input  logic [7:0] Immediate,
  output logic [15:0] Answer
);
  // i feel like this is a stupid way of going about this.  Can't we
  assign Answer = A + {{12{Immediate[7]}}, Immediate};
endmodule

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
    assign c_out = (a & b) | c_in & (a ^ b);
    assign sum = a ^ b ^ c_in;
endmodule