module ALU_Sixteenbit_SUB_tb;
    logic [15:0] A;
    logic [15:0] B;
    logic [15:0] Answer;

    ALU_Submodule_SUB dut (
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