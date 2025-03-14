module ALU_Sixteenbit_SUB (
    input  logic [15:0] A,
    input  logic [15:0] B,
    output logic [15:0] Answer
);

    assign Answer = A - B;


endmodule