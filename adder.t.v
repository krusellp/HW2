// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"


module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;


    structuralFullAdder adder (sum, carryout, a, b, carryin);

    initial begin
    $dumpfile("adderdump.dump");
    $dumpvars();
        // Your test code here
        $display(" A B Cin | Sum Cout | exp Sum exp Cout");	// header
        // Starting with A
        a=0;b=0;carryin=0; #1000
        $display(" %b %b  %b  |  %b    %b  |    0    0", a, b, carryin, sum, carryout);
        a=0;b=0;carryin=1; #1000
        $display(" %b %b  %b  |  %b    %b  |    1    0", a, b, carryin, sum, carryout); 
        a=0;b=1;carryin=0; #1000
        $display(" %b %b  %b  |  %b    %b  |    1    0", a, b, carryin, sum, carryout);
        a=0;b=1;carryin=1; #1000
        $display(" %b %b  %b  |  %b    %b  |    0    1", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=0; #1000
        $display(" %b %b  %b  |  %b    %b  |    1    0", a, b, carryin, sum, carryout);
        a=1;b=0;carryin=1; #1000
        $display(" %b %b  %b  |  %b    %b  |    0    1", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=0; #1000
        $display(" %b %b  %b  |  %b    %b  |    0    1", a, b, carryin, sum, carryout);
        a=1;b=1;carryin=1; #1000
        $display(" %b %b  %b  |  %b    %b  |    1    1", a, b, carryin, sum, carryout);
        $dumpoff();

    end
endmodule
