module top #(parameter MAX_COUNT = 500_000_000)(
    input  logic clk,
    input  logic rst,
    output logic [2:0] lights
);
    logic [1:0] w_current_state, w_next_state;
    logic w_timer_done;
    
    state_register state_inst (
        .clk(clk),
        .rst(rst),
        .d(w_next_state),
        .q(w_current_state)
    );
    mux2to1 next_state_mux (
        .in0(w_current_state),
        .in1(w_current_state+2'b01),
        .sel(w_timer_done),
        .out0(w_next_state)
    );
    timer_module #( .MAX_COUNT(MAX_COUNT) ) timer_unit(
        .clk(clk),
        .rst(rst),
        .en(1'b1),            
        .timer_done(w_timer_done)    
    );
    always_comb begin
        case (w_current_state)
            2'b00: lights = 3'b001; // Green
            2'b01: lights = 3'b010; // Yellow
            2'b10: lights = 3'b100; // Red
            default: lights = 3'b100;
        endcase
    end
endmodule