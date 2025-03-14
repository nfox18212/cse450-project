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

 module calculatePG(a, b, p, g);

    input reg a;
    input reg b;
    output wire p;
    output wire g;

   assign g = a & b;
   assign p = a ^ b;

 endmodule

 module genPG
 #(parameter N = 4)
 (input reg [N-1:0] a, b, output wire [N-1:0] p, g);

   // generates 4 modules to calculate one propogate bit or generate
   // bit for each a and b
   // gonna do 4 bits then try to scale to 16
   genvar i;
   generate
      for (i=0; i < N; i++) begin

        calculatePG pg (.a(a[i]), .b(b[i]), .p(p[i]), .g(g[i]));
        
      end
   endgenerate


 endmodule