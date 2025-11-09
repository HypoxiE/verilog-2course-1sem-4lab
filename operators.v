`timescale 1ns/1ps

module and_(
	input wire a,
	input wire b,
	output wire c
);
	assign #1 c = a & b; // симулируем задержку 1нс
endmodule

module or_(
	input wire a,
	input wire b,
	output wire c
);
	assign #1 c = a | b; // симулируем задержку 1нс
endmodule

module not_(
	input wire a,
	output wire b
);
	assign #10 b = ~a; // симулируем задержку 10нс
endmodule

module nand_(
	input wire a,
	input wire b,
	output wire c
);
	assign #1 c = ~(a & b); // симулируем задержку 1нс
endmodule