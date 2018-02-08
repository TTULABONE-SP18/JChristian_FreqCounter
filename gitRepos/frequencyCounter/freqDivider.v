`timescale 1 ns / 1 ps

module freqDivider(
	input clk,			//clk input
	output divFreq			//output lower frequency (1Hz here)
);

reg [31:0] intCount = 0;			//register to count to 1 second
reg outFreq = 0;

always @(posedge clk) begin
	if (intCount <= 50000000)		//before 50MHz counted
        intCount <= intCount + 1;   //increment counter by 1
	else					         //when 50MHz counted
		begin
		intCount <= 0;			     //reset clock
		outFreq <= ~outFreq;		 //invert output, should change once every half sec
        end			
    end
assign divFreq = outFreq;

endmodule