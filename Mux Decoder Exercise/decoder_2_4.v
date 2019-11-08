`timescale 1ns / 1ns
module decoder_2_4(
	output reg [3:0] Y,
	input [1:0] X
);

always @(*) begin
	Y <= 4'b0000;
	Y[X] <= 1;

end

endmodule

