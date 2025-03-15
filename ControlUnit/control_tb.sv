module Control_tb;

    reg [5:0] opcode;

    wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;

    Control uut (
        .opcode(opcode),
        .RegDst(RegDst),
        .Jump(Jump),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

    initial begin
        opcode = 6'b000000; #10;
        assert(RegWrite);
        opcode = 6'b100011; #10;
        assert(RegWrite && MemRead);
        $display("Simple Control test done.");
        $finish;
    end
endmodule