`timescale 1ns/1ps


module tb;
	
	//// Задание 1
	reg inp; // Регистор входа
	wire t_1; // Последовательные соединения инверторов
	wire clock; // тактовый вход
	wire Q, Q_inv; // выходы

	not_ u_not_1 (.a(inp), .b(t_1));
	nand_ u_nand (.a(t_1), .b(inp), .c(clock));
	t_trigger u_t (.Clock(clock), .Q(Q), .Q_inv(Q_inv));

	initial begin
		inp = 0;
		forever #500000 inp = ~inp; // цикл: каждые 500 ms inp меняется
	end

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, tb);

		#10000000 $finish; // ожидаем 1s и завершаем программу
	end

	// Задание 2
	//reg inp;
	//wire C;
	//wire Q;

	//not_ u_not (.a(inp), .b(C));
	//d_trigger u_t (.Clock(C), .D(inp), .Q(Q));

	//initial begin
	//	inp = 0;
	//	forever #500000 inp = ~inp; // генерируем тактовые импульcы 1000Hz/50%
	//end

	//initial begin
	//	$dumpfile("out.vcd");
	//	$dumpvars(0, tb);
	//	#10000000 $finish;
	//end
	
endmodule