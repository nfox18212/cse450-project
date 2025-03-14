// testbench to run the adder, make suer its doing things that make sense

module tb;

    // if I can parameterize everything, then i'll be able to instantly scale it to 16 from 4
    parameter N = 4;
    reg [N-1:0] a;
    reg [N-1:0] b;
    reg [N-1:0] ps;
    reg [N-1:0] gs;


    genPG #(.N(N)) pg (.a(a), .b(b), .p(ps), .g(gs));

    initial begin
        
        a <= 'h0;
        b <= 'h0;

        $monitor("a = 0x%0h, b = 0x%0h, ps = 0x%0h, gs = 0x%0h", a, b, ps, gs);

        #10 a <= 'h2;
    		b <= 'h3;
        #20 b <= 'h4;
        #10 a <= 'h5;

    end   


endmodule