`timescale 1ns / 1ns

module mux_8_1(
	output reg Y,
	input [7:0] X,
	input [2:0] S
);

always @(*) begin
	
	Y <= X[S];
	
end

endmodule
