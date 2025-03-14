// testbench to run the adder, make suer its doing things that make sense

module tb;


    

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