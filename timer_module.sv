module timer_module #(parameter MAX_COUNT = 500_000_000) (
    input  logic clk,
    input  logic rst,
    input  logic en,
    output logic timer_done  
);
    integer count;

    always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 0;
            timer_done <= 0;
        end else if (en) begin
            if (count >= MAX_COUNT) begin
                count <= 0;
                timer_done <= 1;
            end else begin
                count <= count + 1;
                timer_done <= 0;
            end
        end
    end
endmodule