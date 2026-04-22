`timescale 1ns / 1ps
module state_register(
    input logic clk,
    input logic rst, 
    input logic [1:0] d,
    output logic [1:0] q
    );
    always_ff @(posedge clk or negedge rst) begin
        if (!rst) q <= 2'b00;
        else          q <= d;
    end
endmodule
