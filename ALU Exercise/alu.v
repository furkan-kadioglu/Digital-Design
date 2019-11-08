//Verilog module for an ALU
module ALU(
    A,
    B,
    Cin,
    Op,
    R, 
    C );
    
    //inputs,outputs and internal variables declared here
    input [4:0] A,B;
    input [1:0] Op;
    input Cin; 
    output [4:0] R;
    output reg C ;
    reg [5:0] Reg1,Reg2;
    reg [5:0] Reg3;
    reg [4:0]temp ; 
    initial Reg3 = 0;
    
    //Assign A and B to internal variables for doing operations

    
    //Assign the output 
    assign R = Reg3[4:0];

    //Always block with inputs in the sensitivity list.
    always @(Op or Reg1 or Reg2)
    begin
        case (Op)
         0 :begin 
         	if (A <= B)begin
         	C = 1 ;
         	Reg3 = 0 ;
         	end 
         	if(A > B)begin
         	C = 0 ; 
         	Reg3 = 0 ; 
         	end
         end	


         1 : begin
         	if(A[4] == 0 & B[2] == 0) begin
                Reg1 = A; 
                Reg2 = 0 ; 
                Reg2[1:0] = B[2:1];
                Reg3[5:0] = Reg1*Reg2 ;
                C = 0 ; 
            end
            if(A[4] == 0 & B[2] == 1) begin
                Reg1 = A ; 
                Reg2 = 0 ; 
                temp[2:0] = (~B[2:0] + 1) ;
                Reg2[1:0] = temp[2:1] ; 
                Reg3[5:0] = Reg1 * Reg2 ;  //////////Changed + [5.0]
                Reg3 = ~Reg3 + 1 ;
                C = 0 ;
            end
            if(A[4] == 1 & B[2] == 0) begin
                Reg1 = ~A + 1 ; 
                Reg2 = 0 ; 
                Reg2[1:0] = B[2:1] ; 
                Reg3[5:0] = Reg1 * Reg2 ;/////
                Reg3 = ~Reg3 + 1 ;
                C = 0 ;
            end
            if(A[4] == 1 & B[2] == 1) begin
                Reg1 = ~A + 1 ; 
                Reg2 = 0 ; 
                temp = (~B[2:0] + 1) ;
                Reg2[1:0] = temp[2:1] ; 
                Reg3[5:0] = Reg1 * Reg2 ; /////
                C = 0 ;
            end
         end
         2 : begin
            Reg3 = 0 ; 
         	Reg3 = A[4:2] * B[2:0];
         	C = 0;
         end
         3 :begin
               /* temp <= 0  ; 
                if(A[4] == 1 )
                    temp[5] <= 1 ;
                if(A[4] == 0 )
                    temp[5] <= 0 ; 
                if(B[4] == 1 )
                    Reg2[5] <= 1 ;
                if(B[4] == 0 )
                    Reg2[5] <= 0 ;    
                temp <= A ; 
                Reg2 <= B ;
                Reg1 <= (~Reg2 + 1) ; 
                Reg3 <= Reg1[4:0] + temp[4:0] + Cin ; 
                C <= Reg3[5] ;  */
                Reg3 = A-B+Cin ;
                C = 0 ; 
                 //if atarak calisan calismayan caseleri handellax"
         	end
        endcase 
    end
    
endmodule