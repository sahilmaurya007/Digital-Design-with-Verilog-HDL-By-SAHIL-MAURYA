`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2025 19:16:09
// Design Name: 
// Module Name: multiplier_4x4
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

`timescale 1ns / 1ps

module multiplier4x4 (
    input  [3:0] A,   // 4-bit input A
    input  [3:0] B,   // 4-bit input B
    output [7:0] P    // 8-bit product output
);

    wire [5:0] P_low, P_high; 
    wire [7:0] P_low_ext, P_high_shifted, sum;
    wire carry_out;

    // 4x2 multiplications
    assign P_low  = A * B[1:0];  // A * lower 2 bits of B
    assign P_high = A * B[3:2];  // A * upper 2 bits of B

    // Extend to 8 bits for addition
    assign P_low_ext = {2'b00, P_low};  
    assign P_high_shifted = {P_high, 2'b00}; // Shift and extend

    // Use CARRY4-based fast adder for final sum
    carry4_adder u_adder (
        .A(P_low_ext),
        .B(P_high_shifted),
        .SUM(sum),
        .COUT(carry_out)
    );

    assign P = sum;  // Final product

endmodule


module carry4_adder (
    input  [7:0] A, B,  
    output [7:0] SUM,
    output COUT
);
    wire [3:0] carry;
    
    CARRY4 u_carry4 (
        .CI(1'b0),        
        .CYINIT(1'b0),    
        .CO(carry),       
        .DI(A[3:0]),  // Direct input for carry propagation
        .S(A[3:0] ^ B[3:0]), // XOR for sum
        .O(SUM[3:0])    
    );

    CARRY4 u_carry4_high (
        .CI(carry[3]),    
        .CYINIT(1'b0),   
        .CO(COUT),        
        .DI(A[7:4]),  // Direct input for carry propagation
        .S(A[7:4] ^ B[7:4]),   
        .O(SUM[7:4])      
    );

endmodule


