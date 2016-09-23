// Decoder circuit
// define gates with delays

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Your decoder code here
    wire nA0;
    wire nA1;

    `NOT U0(nA0, address0);
    `NOT U1(nA1, address1);

    `AND U2(out0, nA0, nA1, enable);
    `AND U3(out1, address0, nA1, enable);
    `AND U4(out2, nA0, address1, enable);
    `AND U5(out3, address0, address1, enable);
endmodule

