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

    assign g = a and b;
    assign p = a xor b;

 endmodule

 module genPG(input [3:0] a, b, output [3:0] p, g);

   // generates 4 modules to calculate one propogate bit or generate
   // bit for each a and b
   // gonna do 4 bits then try to scale to 16
   genvar i;
   generate
      for (i=0; i < 3; i++) begin

         calculatePG pg0 (a[i], b[i], ps[i], gs[i]);

      end
   endgenerate


 endmodule