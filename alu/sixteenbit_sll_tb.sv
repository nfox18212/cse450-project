module ALU_Sixteenbit_SLL_tb;
    logic [15:0] A;
    logic [3:0] Shift;
    logic [15:0] Answer;

    ALU_Submodule_SLL dut (
        .A(A),
        .Shift(Shift),
        .Answer(Answer)
    );

    initial begin
        A = 16'd15; Shift = 4'd2;
        #10;
      $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        A = 16'd10; Shift = 4'd0;
        #10;
        $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        A = 16'd1; Shift = 4'd15;
        #10;
        $display("test case: A=%d, Shift=%d, Result=%d", A, Shift, Answer);

        $stop;
    end
endmodule
