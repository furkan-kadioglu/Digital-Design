`timescale 1ns / 1ns
module e3_test();

reg [4:0] x;
wire y;

e3 my_e3(y, x);

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0,y,x);

	x = 0;
	repeat(32) begin
		#10;
		x = x + 1;
	end
	
	$finish;
end

endmodule
