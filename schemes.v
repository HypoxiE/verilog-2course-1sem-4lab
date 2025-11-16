module coder (
	input  wire [7:0] I,
	output wire  [2:0] Y
);

	assign Y[0] = I[1] | I[3] | I[5] | I[7];
	assign Y[1] = I[2] | I[3] | I[6] | I[7];
	assign Y[2] = I[4] | I[5] | I[6] | I[7];
	
endmodule

module decoder (
	input wire  [2:0] Y,
	output  wire [7:0] I
);

	genvar i;
	generate
		for (i = 0; i < 8; i = i + 1) begin
			assign I[i] = 
					((i[0] ? Y[0] : ~Y[0]) &
					(i[1] ? Y[1] : ~Y[1]) &
					(i[2] ? Y[2] : ~Y[2]));
		end
	endgenerate
	
endmodule

module demultiplex (
	input wire  [2:0] Y,
	input wire InpSignal,
	output wire [7:0] Out
);

	wire [7:0] DecoderOut;

	decoder dec_multiplex (
		.Y(Y),
		.I(DecoderOut)
	);

	genvar i;
	generate
		for (i = 0; i < 8; i = i + 1) begin : gen_loop
			assign Out[i] = DecoderOut[i] & InpSignal;
		end
	endgenerate
endmodule

module multiplex (
	input  wire [7:0] In,
	input  wire [2:0] Sel,
	output wire Out
);

	assign Out = In[Sel];
endmodule