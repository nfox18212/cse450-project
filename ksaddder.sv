/* 
    This is just the kogge-stone adder written for VLSI ported to system verilog
 */

// starting with 4 bits
 module calculateCarryOut(a, b, cin, cout);

    input  reg  a;
    input  reg  b;
    input  reg  cin;
    output wire cout; 


 endmodule;

 module sum(a, b, sum, cout);

    input reg [3:0]  a;
    input reg [3:0]  b;


 endmodule

 module calculatePG(a, b, p, g);

    input reg a;
    input reg b;
    output wire p;
    output wire g;

    assign g = a and b;
    assign p = a xor b;

 endmodule