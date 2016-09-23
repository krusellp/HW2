// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here
  reg address0, address1;	// the two switches
  reg in0, in1, in2, in3;	// the inputs
  wire out;					// the output

  

  structuralMultiplexer multiplexer(out, address0, address1, in0, in1, in2, in3);

  	initial begin
  	$dumpfile("mux.dump");
  	$dumpvars();
	$display(" A0 A1 | I0 I1 I2 I3 | out | expected out");	// set header

	// address (0,0)
	address0=0; address1=0; in0=0; in1=1'bX; in2=1'bX; in3=1'bX; #1000  // init variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 0", address0, address1, in0, in1, in2, in3, out);

	address0=0; address1=0; in0=1; in1=1'bX; in2=1'bX; in3=1'bX; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 1", address0, address1, in0, in1, in2, in3, out);

	// address (1,0)
	address0=1; address1=0; in0=1'bX; in1=0; in2=1'bX; in3=1'bX; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 0", address0, address1, in0, in1, in2, in3, out);

	address0=1; address1=0; in0=1'bX; in1=1; in2=1'bX; in3=1'bX; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 1", address0, address1, in0, in1, in2, in3, out);

	// address (0,1)
	address0=0; address1=1; in0=1'bX; in1=1'bX; in2=0; in3=1'bX; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 0", address0, address1, in0, in1, in2, in3, out);

	address0=0; address1=1; in0=1'bX; in1=1'bX; in2=1; in3=1'bX; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 1", address0, address1, in0, in1, in2, in3, out);

	// address(1,1)
	address0=1 ;address1=1; in0=1'bX; in1=1'bX; in2=1'bX; in3=0; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 0", address0, address1, in0, in1, in2, in3, out);

	address0=1; address1=1; in0=1'bX; in1=1'bX; in2=1'bX; in3=1; #1000 // changing variables
	$display(" %b  %b  | %b  %b  %b  %b  |  %b  | 1", address0, address1, in0, in1, in2, in3, out);
	$dumpoff();
	end

endmodule