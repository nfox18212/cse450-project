module and(in 1, )


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
  
  assign Answer = A + {{12{Immediate[7]}}, Immediate};

endmodule