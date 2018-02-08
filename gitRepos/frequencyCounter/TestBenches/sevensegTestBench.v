`timescale 1 ns / 1 ps

module sevensegTB();

	reg clock, reset;
	reg [3:0] in0, in1, in2, in3;
	wire a, b, c, d, e, f, g, dp;
	wire [3:0] an;
	
sevenseg UUT(clock,reset,in0,in1,in2,in3,a,b,c,d,e,f,g,dp,an);

	initial begin
	   clock = 0;
	   reset = 0;
		in0 = 4'b0001;
		in1 = 4'b0010;
		in2 = 4'b1000;
		in3 = 4'b1001;
		#500;
	end

	always begin
		#5 clock = ~clock;
	end
	
endmodule