// testbench to run everything, make sure that things make sense

    module tb;
    parameter N = 4;
    reg [N-1:0] op_1; // stands for operand 1 and 2 repsectively
    reg [N-1:0] op_2;

    wire [N-1:0] result; // result of the tested operation

    and #(.N(N)) and1 (.a(op_1[N-1:0]), .b(op_2), .c(result));

    initial begin

    #1  op_1 = 'h0xA; // 0b1100
        op_2 = 'h0xB; // 0b1101
        $display("operand 1 is: 0x%0h, operand 2 is: 0x%0h, operation is AND so result is: 0x%0h", op_1, op_2, result);
        

    end   


endmodule