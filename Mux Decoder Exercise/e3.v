`timescale 1ns / 1ns
module e3(out,in);

	output out;
	input [4:0] in;
	
	
	//DECODER
	wire [3:0] out_decoder;
	
	decoder_2_4 decoder(out_decoder,in[1:0]);
	
	//NOT
	wire not_d,not_0_1,not_1_0;
	not(not_d,in[1]);
	not(not_0_1,out_decoder[1]);
	not(not_1_0,out_decoder[2]);
	
	
	//MUX
	wire [7:0] mux_in;
	assign mux_in[0] = in[1];
	assign mux_in[1] = out_decoder[2];
	assign mux_in[2] = out_decoder[1];
	assign mux_in[3] = out_decoder[1];
	assign mux_in[4] = not_0_1;
	assign mux_in[5] = out_decoder[1];;
	assign mux_in[6] = not_d;
	assign mux_in[7] = not_1_0;
	
	mux_8_1 mux(out, mux_in,in[4:2]);

endmodule


