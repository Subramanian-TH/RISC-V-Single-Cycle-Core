module ALU(
input [31:0] A,B,
input [2:0] ALUControl,
output [31:0] Result,
output Z,N,C,V  //flags
    );

 wire [31:0] a_and_b;
 wire [31:0] a_or_b;
 wire [31:0] not_b;
 wire [31:0] mux_1;
 wire [31:0] sum;
 wire [31:0] mux_2; 
 wire cout;
 wire [31:0]slt;
 
 
 assign a_and_b = A & B;
 
 assign a_or_b = A | B;
 
 assign not_b = ~B;
 
 // MUX for selecting B 
 assign mux_1 = (ALUControl[0] == 1'b0) ?  B : not_b;
 
 //Addition or Subtraction
 assign {cout,sum} = A + mux_1 + ALUControl[0]; 
 
 //Set less than operation
 assign slt = {31'b0000000000000000000000000000000,sum[31]}; //checks if A<B 
  
 //Final ALU output
 assign mux_2 = (ALUControl[2:0] == 3'b000) ? sum : 
                (ALUControl[2:0] == 3'b001) ? sum : 
                (ALUControl[2:0] == 3'b010) ? a_and_b : 
                (ALUControl[2:0] == 3'b011) ? a_or_b :
                (ALUControl[2:0] == 3'b101) ? slt : 32'h00000000; //1bit binary = 4bit hex
                
                
 assign Result = mux_2;
  
 //Flags
 assign Z = &(~Result);
 
 assign N = Result[31];
 
 assign C = (~ALUControl[1]) & cout;
 
 assign V = (~ALUControl[1]) & (A[31] ^ sum[31]) & (~(A[31] ^ B[31] ^ ALUControl[0]));
 
endmodule
