`timescale 1 ns / 1 ps

module sevenseg(		//Multiplexer for the 7 segment display
	input clock, reset,
	input [3:0] in0, in1, in2, in3, 	//4 bit inputs for displays
	output a, b, c, d, e, f, g, dp, 	//segments of the 7 segment displays
	output [3:0] an   		// the 4 bit anode enable
);

localparam N = 18;

reg [N-1:0]count = 0;	//the 18 bit counter, multiplex at ~1000 Hz

always @ (posedge clock or posedge reset)		//code for counter
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0]sseg = 0; 		//the 7 bit register to hold the data to output
reg [3:0]an_temp = 0; 	//register for 4 bit anode enable

always @ (*)
 begin
  case(count[N-1:N-2]) 	//using only the 2 MSBs of the counter 
   
   2'b00 :  			//When the MSBs are 00, enable the fourth display
    begin
     sseg = in0;
     an_temp = 4'b1110;
    end
   
   2'b01:  			//When the MSBs are 01, enable the third display
    begin
     sseg = in1;
     an_temp = 4'b1101;
    end
   
   2'b10:  			//When the MSBs are 10, enable the second display
    begin
     sseg = in2;
     an_temp = 4'b1011;
    end
    
   2'b11:  			//When the MSBs are 11, enable the first display
    begin
     sseg = in3;
     an_temp = 4'b0111;
    end
  endcase
 end
assign an = an_temp;

reg [6:0] sseg_temp = 0; 		// 7 bit register to hold the binary value

always @ (*)
 begin
  case(sseg)
   4'd0 : sseg_temp = 7'b1000000; 		//display 0
   4'd1 : sseg_temp = 7'b1111001; 		//display 1
   4'd2 : sseg_temp = 7'b0100100; 		//display 2
   4'd3 : sseg_temp = 7'b0110000; 		//display 3
   4'd4 : sseg_temp = 7'b0011001;		//display 4
   4'd5 : sseg_temp = 7'b0010010; 		//display 5
   4'd6 : sseg_temp = 7'b0000010; 		//display 6
   4'd7 : sseg_temp = 7'b1111000; 		//display 7
   4'd8 : sseg_temp = 7'b0000000; 		//display 8
   4'd9 : sseg_temp = 7'b0010000;		//display 9
   default : sseg_temp = 7'b1000000; 	//default is display 0000
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 	//concatenate the outputs to the register
assign dp = 1'b1;				 //turn off all 4 decimal points

endmodule