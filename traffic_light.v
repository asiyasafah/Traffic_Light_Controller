module traffic_light_controller(
    input clk,
    input reset,
    input sensor,

    output reg R1,
    output reg Y1,
    output reg G1,

    output reg R2,
    output reg Y2,
    output reg G2
);

// State
parameter S0 = 3'b000;   // Road A Green
parameter S1 = 3'b001;   // Road A Yellow
parameter S2 = 3'b010;   // All Red
parameter S3 = 3'b011;   // Road B Green
parameter S4 = 3'b100;   // Road B Yellow
parameter S5 = 3'b101;   // All Red
reg [2:0] state;
reg [4:0] count;
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= S0;
        count <= 0;
    end
    else
    begin
        count <= count + 1;

        case(state)

        // Road A Green
        S0:
        begin
            if((count >= 10 && sensor) || count >= 15)
            begin
                state <= S1;
                count <= 0;
            end
        end

        // Road A Yellow
        S1:
        begin
            if(count >= 3)
            begin
                state <= S2;
                count <= 0;
            end
        end

        // All Red
        S2:
        begin
            if(count >= 2)
            begin
                state <= S3;
                count <= 0;
            end
        end

        // Road B Green
        S3:
        begin
            if(count >= 15)
            begin
                state <= S4;
                count <= 0;
            end
        end

        // Road B Yellow
        S4:
        begin
            if(count >= 3)
            begin
                state <= S5;
                count <= 0;
            end
        end

        // All Red
        S5:
        begin
            if(count >= 2)
            begin
                state <= S0;
                count <= 0;
            end
        end

        default:
        begin
            state <= S0;
            count <= 0;
        end

        endcase
    end
end

// Output logic
always @(*)
begin

    R1 = 0; Y1 = 0; G1 = 0;
    R2 = 0; Y2 = 0; G2 = 0;

    case(state)

    S0:
    begin
        G1 = 1;
        R2 = 1;
    end

    S1:
    begin
        Y1 = 1;
        R2 = 1;
    end

    S2:
    begin
        R1 = 1;
        R2 = 1;
    end

    S3:
    begin
        R1 = 1;
        G2 = 1;
    end

    S4:
    begin
        R1 = 1;
        Y2 = 1;
    end

    S5:
    begin
        R1 = 1;
        R2 = 1;
    end

    endcase

end

endmodule