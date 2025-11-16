`timescale 1ns/1ps


module tb;
	
	//reg  [7:0] I;
	//wire [2:0] Y;
	//wire [7:0] OD;
	//coder cod_uut (.I(I), .Y(Y));
	//decoder dec_uut (.Y(Y), .I(OD));
	//integer i;
	//initial begin
	//	$dumpfile("out.vcd");
	//	$dumpvars(0, tb);

	//	$display("Time\tI\t\tY\tOD");
	//	$monitor("%0t\t%b\t%b\t%b", $time, I, Y, OD);

	//	for (i = 0; i < 8; i = i + 1) begin
	//		I = 0;
	//		I[i] = 1'b1; #10;
	//	end
		
	//	$finish;
	//end
	
	//reg  [7:0] In;
	//reg  [2:0] Sel;
	//wire Out;
	//multiplex uut (
	//	.In(In),
	//	.Sel(Sel),
	//	.Out(Out)
	//);
	//integer i;
	//reg expected;

	//initial begin
	//	$dumpfile("out.vcd");
	//	$dumpvars(0, tb);
		
	//	In = 8'b1010_1101; // пример значений на входах

	//	$display("Inp\t\tSel\tOut\tExpected");

	//	// Перебор всех вариантов выбора
	//	for (i = 0; i < 8; i = i + 1) begin
	//		Sel = i;
	//		#1;                  // небольшая задержка для распространения сигнала
	//		expected = In[Sel];  // вычисляем ожидаемый результат
	//		$display("%b\t%b\t%b\t%b", In, Sel, Out, expected);
	//		#9;                  // оставляем общее время 10 нс на шаг
	//	end

	//	$finish;
	//end

	reg  A, B, C;
	wire Out;
	integer i;
	func uut (
		.A(A),
		.B(B),
		.C(C),
		.Out(Out)
	);

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);

		$display("A\tB\tC\tOut");

		for (i = 0; i < 8; i = i + 1) begin
			A = i[0];
			B = i[1];
			C = i[2];
			#1;
			$display("%b\t%b\t%b\t%b", A, B, C, Out);
			#9;
		end

		$finish;
	end

endmodule