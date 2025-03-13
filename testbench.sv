// testbench to run the adder, make suer its doing things that make sense

module tb;

    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] ps;
    reg [3:0] gs;


    initial begin
        
        a = 'ha;
        b = 'hb;

        $display ("a = 0b%0b, b = 0b%0b", a, b);

    end   


endmodule