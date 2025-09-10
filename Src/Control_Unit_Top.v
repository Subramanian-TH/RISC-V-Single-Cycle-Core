module Control_Unit_Top(
input Zero, funct7,
input [6:0] Op, 
input [2:0] funct3,
output [2:0] ALUControl,
output PCSrc, MemWrite, ALUSrc, RegWrite,
output [1:0] ImmSrc, ALUOp, ResultSrc
    );
   
    wire Branch_wire, Jump_wire;
    
    Main_Decoder Main_Decoder(
      .op(Op),
      .ResultSrc(ResultSrc),
      .MemWrite(MemWrite),
      .ALUSrc(ALUSrc),
      .ImmSrc(ImmSrc),
      .RegWrite(RegWrite),
      .ALUOp(ALUOp),
      .Branch(Branch_wire),
      .Jump(Jump_wire)
      );
      
      PC_Src PC_Source(
      .Zero(Zero), 
      .Branch(Branch_wire),
      .Jump(Jump_wire),
      .PCSrc(PCSrc)
      );
      
     ALU_Decoder ALU_Decoder(
     .funct7(funct7),
     .op(Op[5]),
     .funct3(funct3),
     .ALUOp(ALUOp),
     .ALUControl(ALUControl)
     );
    
    
endmodule
