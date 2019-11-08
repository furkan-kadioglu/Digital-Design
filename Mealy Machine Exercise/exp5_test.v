`timescale 1ns / 1ns

module TestBench();

	// Inputs
	reg x;
	reg clk;

	// Outputs
	wire [1:0] y;
	
	
	//Variables
	reg [31:0]arr [4:0];
	integer i = 0;
	integer j = 0;

	mealy my_machine(y,x,clk);

	always begin
		clk <= 1; 
		#10;
		clk <= 0; 
		#10;
	end
	
	initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, clk, x, y);
	
	arr[0] <= 32'b01100110110110111101111101111111;
	arr[1] <= 32'b01010101011011111101011101000001;
	arr[2] <= 32'b01010100110001010010101101000101;
	arr[3] <= 32'b10111110001010001010111111010100;
	arr[4] <= 32'b01010000010111101010001010001011;
	
	while (i<5)
	begin
		@(posedge clk); 
		while (j<32)
		begin
			x <= arr[i][j];
			@(posedge clk);
			
			j = j + 1;
		end
		j = 0;
		i = i + 1;
	end

	$finish;
end
      
endmodule

