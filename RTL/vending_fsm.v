
`timescale 1ns / 1ps

module vending_fsm(
    input wire clk,
    input wire reset,
    input wire coin_5,
    input wire coin_10,
    input wire coin_20,
    output reg dispense,
    output reg change_5,
    output reg change_10,
    output reg change_15,
    output reg change_20
);
 parameter S0       = 3'b000;
 parameter S5       = 3'b001;
 parameter S10      = 3'b010;
 parameter S15      = 3'b011;
 parameter DISPENSE = 3'b100;
 reg [2:0] current_state, next_state;
 reg [4:0] change_amount, next_change_amount;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
            change_amount <= 5'd0;
        end
        else begin
            current_state <= next_state;
            change_amount <= next_change_amount;
        end
    end


    always @(*) begin
    
        next_state = current_state;
        next_change_amount = change_amount;

        case (current_state)

            S0: begin
                if (coin_5) begin
                    next_state = S5;
                    next_change_amount = 5'd0;
                end
                else if (coin_10) begin
                    next_state = S10;
                    next_change_amount = 5'd0;
                end
                else if (coin_20) begin
                    next_state = DISPENSE;
                    next_change_amount = 5'd5;
                end
            end

            S5: begin
                if (coin_5) begin
                    next_state = S10;
                    next_change_amount = 5'd0;
                end
                else if (coin_10) begin
                    next_state = S15;
                    next_change_amount = 5'd0;
                end
                else if (coin_20) begin
                    next_state = DISPENSE;
                    next_change_amount = 5'd10;
                end
            end

            S10: begin
                if (coin_5) begin
                    next_state = S15;
                    next_change_amount = 5'd0;
                end
                else if (coin_10) begin
                    next_state = DISPENSE;
                    next_change_amount = 5'd5;
                end
                else if (coin_20) begin
                    next_state = DISPENSE;
                    next_change_amount = 5'd15;
                end
            end

          S15: begin
                  next_state = S0;
                  next_change_amount = 5'd0;
                 end
  
            DISPENSE: begin
                next_state = S0;
                next_change_amount = 5'd0;
            end

            default: begin
                next_state = S0;
                next_change_amount = 5'd0;
            end

        endcase
    end

    always @(*) begin
        dispense  = 1'b0;
        change_5  = 1'b0;
        change_10 = 1'b0;
        change_15 = 1'b0;
        change_20 = 1'b0;

        case (current_state)
     
            S15: begin
                dispense = 1'b1;
            end

            DISPENSE: begin
                dispense = 1'b1;

                case (change_amount)
                    5'd5:  change_5  = 1'b1;
                    5'd10: change_10 = 1'b1;
                    5'd15: change_15 = 1'b1;
                    5'd20: change_20 = 1'b1;

                    default: begin
                    end
                endcase
            end

            default: begin
            end

        endcase
    end

endmodule
