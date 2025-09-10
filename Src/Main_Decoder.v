module Main_Decoder( 
input [6:0] op,
output ALUSrc, RegWrite, MemWrite,
output [1:0] ImmSrc, ALUOp, ResultSrc,
output Branch, Jump
    );
    
    assign RegWrite = ((op == 7'b0000011) | (op == 7'b0110011) | (op == 7'b0010011) | (op == 7'b1101111)) ? 1'b1 : 1'b0;
    
    assign MemWrite = (op == 7'b0100011) ? 1'b1 : 1'b0;
    
    assign ALUSrc = ((op == 7'b0000011) | (op == 7'b0100011) | (op == 7'b0010011)) ? 1'b1 : 1'b0;
    
    assign ResultSrc = (op == 7'b0000011) ? 2'b10 :
                       (op == 7'b0110011) ? 2'b01 :           
                       (op == 7'b0010011) ? 2'b01 :      
                       (op == 7'b1101111) ? 2'b11 : 2'b00;     
                                                  
    
    assign Branch = (op == 7'b1100011) ? 1'b1 : 1'b0;
    
    assign Jump = (op == 7'b1101111) ? 1'b1 : 1'b0;
    
    assign ImmSrc = (op == 7'b0100011) ? 2'b01 :  
                    (op == 7'b1100011) ? 2'b10 : 
                    (op == 7'b1101111) ? 2'b11 : 2'b00;
                    
    assign ALUOp = (op == 7'b1100011) ? 2'b01 : 
                   (op == 7'b0110011) ? 2'b10 : 2'b00;
    
    
    
endmodule
