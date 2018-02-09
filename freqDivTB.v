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


module freqDivTB();
    
    reg clock;
    wire divFreq;
    
freqDivider UUT(clock,divFreq);

    initial begin
        clock = 0;
    end
    
    always begin
        #1 clock = ~clock;
    end
endmodule
