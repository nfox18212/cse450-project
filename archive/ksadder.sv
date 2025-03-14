/* 
    This is just the kogge-stone adder written for VLSI ported to system verilog
 */

// parameterized
 module calculateCarry  
   #(parameter N)
   (input reg [N-1:0] a, b, output [N-1:0] carry);

   wire [N-1:0] propogates, generates;

   genPG #(.N(N)) pg (.a(a), .b(b), .p(propogates), .g(generates));

   /* 
   * this for loop paired with an array variant of carry, combined with how all the Ps and Gs DON'T depend on carry,
   * SHOULD allow me to create a faux recursion loop to calcuate the next carry from the first one.  I'm not doing ACTUAL
   * recursion because that is too much of a headache and I can't figure out how to make it happen in verilog.
   * If I actually had proper functions, maybe.  - Nate
   */
   genvar i;
   generate
   for (i = 0; i < N; i++) begin
      
      if (i == 0) begin

         // 0th carry is ALWAYS the generate bit
         assign carry[i] = generates[i];

      end

      /*
      * This is still serial, not parallel.  Can rework to make 16 half-adders
      */

   end
   endgenerate
 endmodule;

   

 module calculatePG(a, b, p, g);

    input reg a;
    input reg b;
    output wire p;
    output wire g;

   assign g = a & b;
   assign p = a ^ b;

 endmodule


 module genPG(input reg a, b, output wire p, g);
   // returns an array of all of the generate and propogate bits

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

 module q(             //carry propagation and generation module
      input a,b,g,f,
      output s,c
      );
  assign s=a&b;
  assign c=g|(b&f);
endmodule