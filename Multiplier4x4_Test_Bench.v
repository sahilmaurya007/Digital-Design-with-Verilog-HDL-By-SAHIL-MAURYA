`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2025 19:16:51
// Design Name: 
// Module Name: multiplier_4x4_tb
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


module tb_multiplier4x4;
    reg [3:0] A, B;
    wire [7:0] P;
    
    // Instantiate the multiplier
    multiplier4x4 uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        // Initialize signals to avoid "xx"
        A = 4'b0000; B = 4'b0000;
        #10;
        
        // Test cases
        A = 4'b0001; B = 4'b0001; #10; // 1 * 1 = 1
        A = 4'b0010; B = 4'b0011; #10; // 2 * 3 = 6
        A = 4'b0101; B = 4'b0110; #10; // 5 * 6 = 30
        A = 4'b1001; B = 4'b0111; #10; // 9 * 7 = 63
        A = 4'b1111; B = 4'b1111; #10; // 15 * 15 = 225

        // End simulation
        $stop;
    end

    initial begin
        $monitor("Time=%0t | A=%b B=%b | P=%b", $time, A, B, P);
    end
endmodule
