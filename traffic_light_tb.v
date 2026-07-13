`timescale 1ns/1ps

module traffic_light_controller_tb;

reg clk;
reg reset;
reg sensor;

wire R1;
wire Y1;
wire G1;
wire R2;
wire Y2;
wire G2;
traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .sensor(sensor),
    .R1(R1),
    .Y1(Y1),
    .G1(G1),
    .R2(R2),
    .Y2(Y2),
    .G2(G2)
);
always #5 clk = ~clk;
initial
begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, traffic_light_controller_tb);
    clk = 0;
    reset = 1;
    sensor = 0;

    // Release reset
    #20;
    reset = 0;

    // No vehicle detected
    #100;

    // Vehicle detected
    sensor = 1;
    #100;

    // Vehicle leaves
    sensor = 0;
    #100;

    $finish;
end

endmodule