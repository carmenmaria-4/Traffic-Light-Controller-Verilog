`timescale 1ns / 1ps
module tb();

logic clk;
logic rst;
logic [2:0] lights;
top #(.MAX_COUNT(10)) top_0(.*);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    always @(lights) begin
        case (lights)
            3'b001: $display("[%0t ns] Semnal: VERDE", $time);
            3'b010: $display("[%0t ns] Semnal: GALBEN", $time);
            3'b100: $display("[%0t ns] Semnal: ROSU", $time);
            default: $display("[%0t ns] Semnal: INVALID", $time);
        endcase
    end
    
    initial begin
        rst = 0; 
        #25 
        if (lights !== 3'b001) 
            $display("EROARE: Reset-ul nu a trimis semaforul pe VERDE!");
        else
            $display("SUCCES: Reset-ul functioneaza corect.");
        rst = 1; 
        // (5 bătăi de ceas per culoare * 3 culori * 3 cicluri * 10ns per ceas)
        #600;

        $display("Testam Reset-ul in timpul functionarii...");
        #7;
        rst = 0;
        #20;
        rst = 1;

        #100;
        $stop();
    end

endmodule
