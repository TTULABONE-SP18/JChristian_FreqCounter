`timescale 1 ns / 1 ps

module bcdCount( 		//bcd counter with built in buffer
	input clk, reset,	//clock and reset inputs
	output [3:0] out0,	//4 bit output
	output carry		//carry to next bcd counter
);

reg [3:0] finState = 0;
reg hold = 0;
reg [3:0] state = 0;	//register for counter value, will increment and change to output
                            //when reset signal is enabled
always @(posedge reset) begin
            finState <= state;			     //set buffer current value
            hold <= 1'b0;                  //set carry to 0
            state <= 4'd0;                        //set current value back to 0
end

always @(posedge clk) begin 
    if(state == 4'd9)		//if output reaches 9
    begin
		state <= 4'b0000;		//set output to 0000
		hold <= 1'b1;			//carry set to 1
	end
	else if (state == 4'b0000)
	begin
	   state <= 4'b0001;
	   hold <= 1'b0;
	end
	else					//if clock pulses and reset is not active
		state <= state + 1;		//output increases by 1
end

assign out0 = finState;
assign carry = hold;

endmodule