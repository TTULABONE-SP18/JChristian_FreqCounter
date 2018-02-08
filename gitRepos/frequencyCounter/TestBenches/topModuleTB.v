`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2018 01:07:53 AM
// Design Name: 
// Module Name: topModuleTB
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


module topModuleTB();

    reg eden, clk;
    wire [3:0] an;
    wire a, b, c, d, e, f, g, dp;
    
frequencyCounter UUT(eden, clk, an, a, b, c, d, e, f, g, dp);

    initial begin
        eden = 0;
        clk = 0;
        #10;
    end
    
    always begin
        #1 clk = ~clk;
    end
    
    always begin
        #8000000 eden = ~eden;
    end
    
endmodule
