// Multiplexer circuit
// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Your multiplexer code here

    // the switch portion of the circuit
    wire nA0;   // calling addresses by A0 and A1 for simplicity
    wire nA1;
    wire nA0nA1;    // wires from first and gates to circuit
    wire nA0A1;
    wire A0nA1;
    wire A0A1;
    `NOT A0inv(nA0, address0); // inverting the first switch
    `NOT A1inv(nA1, address1); // inverting second switch
    // making the and gates for the switch part
    `AND nA0andnA1(nA0nA1, nA0, nA1); // nA0 and nA1
    `AND nA0andA1(nA0A1, nA0, address1); // nA0 and A1
    `AND A0andnA1(A0nA1, address0, nA1); // Address0 and nA1
    `AND A0andA1(A0A1, address0, address1); // address0 and address1

    wire in0; wire in1; wire in2; wire in3;
    wire I0A; // wires connecting and gates to or gates
    wire I1A;
    wire I2A;
    wire I3A;
    wire I0I1;
    wire I2I3;
    //wire out;

    `AND I0andA(I0A, nA0nA1, in0);
    `AND I1andA(I1A, A0nA1, in1);
    `AND I2andA(I2A, nA0A1, in2);
    `AND I3andA(I3A, A0A1, in3);

    `OR I0orI1(I0I1, I0A, I1A);
    `OR I2orI3(I2I3, I2A, I3A);

    `OR final(out, I0I1, I2I3);

endmodule

