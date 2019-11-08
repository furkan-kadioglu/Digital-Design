`timescale 1 ns/1 ns

module fsm(o, b, Clk, Rst);

input b;
output reg [2:0] o;
reg [3:0] slook[9:0][1:0];
reg [2:0] olook[9:0][1:0];
reg [3:0] s;
input Clk, Rst;
initial begin
//s lookup table
slook[0][0] = 4'b0000;
slook[0][1] = 4'b0001;
slook[1][0] = 4'b0010;
slook[1][1] = 4'b0001;
slook[2][0] = 4'b0011;
slook[2][1] = 4'b0110;
slook[3][0] = 4'b0100;
slook[3][1] = 4'b0111;
slook[4][0] = 4'b0101;
slook[4][1] = 4'b1000;
slook[5][0] = 4'b0101;
slook[5][1] = 4'b1001;
slook[6][0] = 4'b0000;
slook[6][1] = 4'b0001;
slook[7][0] = 4'b0000;
slook[7][1] = 4'b0001;
slook[8][0] = 4'b0000;
slook[8][1] = 4'b0001;
slook[9][0] = 4'b0000;
slook[9][1] = 4'b0001;

//o lookup table
olook[0][0] = 3'b000;
olook[0][1] = 3'b000;
olook[1][0] = 3'b000;
olook[1][1] = 3'b000;
olook[2][0] = 3'b000;
olook[2][1] = 3'b000;
olook[3][0] = 3'b000;
olook[3][1] = 3'b000;
olook[4][0] = 3'b000;
olook[4][1] = 3'b000;
olook[5][0] = 3'b000;
olook[5][1] = 3'b000;
olook[6][0] = 3'b001;
olook[6][1] = 3'b001;
olook[7][0] = 3'b010;
olook[7][1] = 3'b010;
olook[8][0] = 3'b011;
olook[8][1] = 3'b011;
olook[9][0] = 3'b111;
olook[9][1] = 3'b111;
end

always @(posedge Clk) begin
	if (Rst) begin
		s = 0;
	end
	else begin
		s = slook[s][b];
		o = olook[s][b];
	end
end

endmodule