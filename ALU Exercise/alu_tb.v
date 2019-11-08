`timescale 1 ns/1 ns
module tb_alu;

    // Inputs
    reg [4:0] A;
    reg [4:0] B;
    reg [1:0] Op;
    reg Cin ; 
    // Outputs
    wire [4:0] R;
    wire C ; 

    // Instantiate the Unit Under Test (UUT)
    ALU uut (A, B, Cin, Op, R, C);
    
    initial begin
        $dumpfile("TimingDiagram.vcd");
        $dumpvars(0,A,B, Cin, Op,R,C);
        // Apply inputs.
        A = 5'b10000; 
        B = 5'b01100;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b11101; 
        B = 5'b01100;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b00110; //6
        B = 5'b00111; //7
        Cin = 1 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b01101; 
        B = 5'b01100;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b10101; 
        B = 5'b01010;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b01110;
        B = 5'b00101;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b01110;
        B = 5'b01011;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b10000;
        B = 5'b01111;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
        A = 5'b00010;
        B = 5'b01101;
        Cin = 0 ; 
        Op = 0; #10;
        Op = 1; #10;
        Op = 2; #10;
        Op = 3; #10;
    end
      
endmodule