`timescale 1ns/1ps


module tb;
	
	reg  [7:0] I;
    wire [2:0] Y;
	wire [7:0] OD;

	coder cod_uut (
		.I(I),
		.Y(Y)
	);

	decoder dec_uut (
		.Y(Y),
		.I(OD)
	);

	integer i;

	initial begin
		$display("Time\tI\t\tY\tOD");
		$monitor("%0t\t%b\t%b\t%b", $time, I, Y, OD);

		for (i = 0; i < 8; i = i + 1) begin
			I = 0;
			I[i] = 1'b1; #10;
		end
		
		$finish;
	end
	
endmodule