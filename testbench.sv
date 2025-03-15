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

module Sixteenbit_SLL_tb;
    logic [15:0] A;
  logic [7:0] Shift;
    logic [15:0] Answer;

    Sixteenbit_SLL dut (
        .A(A),
        .Shift(Shift),
        .Answer(Answer)
    );

    initial begin
        A = 16'd15; Shift = 8'd2;
        #10;
      $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        A = 16'd10; Shift = 8'd0;
        #10;
        $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        A = 16'd1; Shift = 8'd15;
        #10;
        $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        $stop;
    end
endmodule

module Sixteenbit_SUB_tb;
    logic [15:0] A;
    logic [15:0] B;
    logic [15:0] Answer;

    Sixteenbit_SUB dut (
        .A(A),
        .B(B),
        .Answer(Answer)
    );

    initial begin
        A = 16'd15; B = 16'd10;
        #10;
        $display("test case: A=%d, B=%d, Result=%d", A, B, Answer);

        A = 16'd13; B = 16'd13;
        #10;
        $display("test case: A=%d, B=%d, Result=%d", A, B, Answer);

        A = 16'd5; B = 16'd8;
        #10;
        $display("test case: A=%d, B=%d, Result=%d", A, B, Answer);

        $stop;
    end
endmodule

module Sixteenbit_LW_tb;
    logic [15:0] Base;
  logic [7:0] Offset;
    logic [15:0] Data;
    logic [15:0] Answer;

    Sixteenbit_LW dut (
        .Base(Base),
        .Offset(Offset),
        .Data(Data),
        .Answer(Answer)
    );

    initial begin
        Base = 16'd20; Offset = 8'd2; Data = 16'h1234;
        #10;
        $display("test case: Base=%d, Offset=%d, Data=0x%h, Result=0x%h", Base, Offset, Data, Answer);

        Base = 16'd10; Offset = -8'd2; Data = 16'h5678;
        #10;
        $display("test case: Base=%d, Offset=%d, Data=0x%h, Result=0x%h", Base, Offset, Data, Answer);

        Base = 16'd12345; Offset = 8'd5; Data = 16'h9ABC;
        #10;
        $display("test case: Base=%d, Offset=%d, Data=0x%h, Result=0x%h", Base, Offset, Data, Answer);

        $stop;
    end
endmodule

module Sixteenbit_ADDI_tb;
    logic [15:0] A;
  logic [7:0] Immediate;
    logic [15:0] Answer;

    Sixteenbit_ADDI dut (
        .A(A),
        .Immediate(Immediate),
        .Answer(Answer)
    );

    initial begin
        A = 16'd1; Immediate = 8'd1;
        #10;
        $display("test case: A=%d, Imm=%d, Result=%d", A, Immediate, Answer);

        A = 16'd19; Immediate = -8'd1;
        #10;
        $display("test case: A=%d, Imm=%d, Result=%d", A, Immediate, Answer);

        A = 16'd1; Immediate = 8'd0;
        #10;
      $display("test case: A=%d, Imm=%d, Result=%d", A, Immediate, Answer);

        $stop;
    end
endmodule
