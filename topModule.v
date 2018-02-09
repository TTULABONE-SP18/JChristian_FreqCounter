`timescale 1 ns / 1 ps

module frequencyCounter(
	input eden, clk,  	//eden = physical input, clk is internal clock at 50MHz
	output [3:0] an,
	output a, b, c, d, e, f, g, dp
);

wire carry0;	//carry from bcd0 to bcd1
wire carry1;	//carry from bcd1 to bcd2	
wire carry2;	//carry from bcd2 to bcd3
wire [3:0]res0;	//value to send to input0 on 7segment
wire [3:0]res1;	//value to send to input1 on 7segment
wire [3:0]res2;	//value to send to input2 on 7segment
wire [3:0]res3;	//value to send to input3 on 7segment
wire reset;	    //pulse to reset system or advance buffer every 1 second
wire gnd = 0;   //ground wire for unused ports

freqDivider u0(clk,reset);  //divide frequency to 1 sec and send to â€œresetâ€? wire

bcdCount u1(eden, reset, res0, carry0);	//bcd counter 0, output sent to input0

bcdCount u2(carry0, reset, res1, carry1);	//bcd counter 1, output sent to input1

bcdCount u3(carry1, reset, res2, carry2);	//bcd counter 2, output sent to input2

bcdCount u4(carry2, reset, res3, gnd);	//bcd counter 3, output sent to input3

sevenseg disp(clk, res0, res1, res2, res3, a, b, c, d, e, f, g, dp, an);		//7segment receives all bcd outputs and displays freq of input

endmodule