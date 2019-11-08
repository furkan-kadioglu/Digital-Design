`timescale 1ns / 1ns

module TestBench();

	// Inputs
	reg b;
	reg clk;
	reg rst;

	// Outputs
	wire [2:0] y;
	
	//Variables
	reg [31:0]arr [4:0];
	integer i = 0;
	integer j = 0;
	
fsm my_fsm(y, b, clk, rst);

always begin
	clk <= 0;
	#10;
	clk <= 1;
	#10;
end

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, clk, rst, b, y);
	
	arr[0] <= 32'b10010011101010100101011101001110;
	arr[1] <= 32'b01010101011011111101011101000001;
	arr[2] <= 32'b01010100110001010010101101000101;
	arr[3] <= 32'b10111110001010001010111111010100;
	arr[4] <= 32'b01010000010111101010001010001011;
	
	while (i<5)
	begin
		rst <= 1;
		@(posedge clk); #5;
		rst <= 0;
		while (j<32)
		begin
			b <= arr[i][j];
			@(posedge clk); #5;
			j = j + 1;
		end
		j = 0;
		i = i + 1;
	end

	$finish;
end
      
endmodule

