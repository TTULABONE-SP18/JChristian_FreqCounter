`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2018 12:04:31 AM
// Design Name: 
// Module Name: freqDivTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcdCountTB();

    reg clk, reset;
    wire [3:0] out0;
    wire carry;
    
bcdCount UUT(clk, reset, out0, carry);

    initial begin
        clk = 0;
        reset = 0;
        #10;
        clk = 0;
        reset = 1;
        #10;
    end
    
    always begin
        #10 clk = ~clk;
    end
    
    always begin
        #50 reset = ~reset;
    end
    
endmodule