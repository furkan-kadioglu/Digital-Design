`timescale 1ns / 1ns

module mealy(y,x,clk);

input x,clk;
output reg [1:0] y;
reg [1:0] n;
reg [1:0] d;
initial d = 0;


always @(x,n) begin
	y[1] <= (~n[0])|(~n[1])|(~x);
	y[0] <= (n[0]&n[1])|~((~x)|(x&n[1]));
	d[1] <= (~x)|(x&n[1]);
	d[0] <= x&n[1];
end

always @(posedge clk) begin
	n = d;
end

endmodule
