module ALU_Sixteenbit_SLL (
    input  logic [15:0] A,
    input  logic [3:0] Shift,
  output logic [15:0] Answer
);
    always_comb begin
        Answer = A << Shift;
    end
endmodule