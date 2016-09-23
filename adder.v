// Adder circuit

// define gates with delays

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here

    wire axorb;
    wire carry1;
    wire carry2;

    `XOR U0(axorb, a, b);
    `AND U1(carry1, a, b);
    `AND U2(carry2, axorb, carryin);
    `XOR U3(sum, axorb, carryin);
    `OR U4(carryout, carry1, carry2);

endmodule