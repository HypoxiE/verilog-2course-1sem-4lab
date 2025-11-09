//a
module rs_trigger(
	input wire R,
	input wire S,
	output reg Q,
	output wire Q_inv
);
	assign Q_inv = ~Q;

	always @(*) begin
		if (R && S)
			Q = 1'bx;
		else if (S)
			Q = 1'b1;
		else if (R)
			Q = 1'b0;
	end
endmodule

//b
module d_trigger(
	input wire D,
	input wire Clock,   // тактовый вход
	output reg Q,
	output wire Q_inv
);
	parameter DELAY = 2;

	assign Q_inv = ~Q;

	always @(posedge Clock) begin
		Q <= #DELAY D;
	end
endmodule

//c
module jk_trigger (
	input  wire J,
	input  wire K,
	input  wire Clock,   // тактовый вход
	output reg  Q,
	output wire Q_inv
);
	assign Q_inv = ~Q;

	always @(posedge Clock) begin
		case ({J,K})
			2'b00: Q <= Q;        // hold
			2'b01: Q <= 1'b0;     // reset
			2'b10: Q <= 1'b1;     // set
			2'b11: Q <= ~Q;       // toggle
		endcase
	end
endmodule

//d
module jk_trigger_d (
	input  wire JK,
	input  wire Clock,   // тактовый вход
	output wire J,
	output wire K,
	output reg  Q,
	output wire Q_inv
);
	assign Q_inv = ~Q;

	assign J = JK;
	assign K = ~JK;

	always @(posedge Clock) begin
		case ({J,K})
			2'b01: Q <= 1'b0;
			2'b10: Q <= 1'b1;
		endcase
	end
endmodule

//e
module t_trigger (
    input  wire Clock,    // тактовый вход
    output reg  Q,
    output wire Q_inv
);
    assign Q_inv = ~Q;

	initial Q = 0;

    always @(posedge Clock) begin
    	Q <= Q_inv;
    end
endmodule


//f
module jk_s_trigger (
	input  wire JK,
	input  wire Clock,
	output wire J,
	output wire K,
	output reg  Q,
	output wire Q_inv
);
	assign Q_inv = ~Q;

	assign J = JK;
	assign K = JK;

	initial Q = 0;

	always @(posedge Clock) begin
		case ({J, K})
			2'b00: Q <= Q;
			2'b11: Q <= Q_inv;
		endcase
	end
endmodule
