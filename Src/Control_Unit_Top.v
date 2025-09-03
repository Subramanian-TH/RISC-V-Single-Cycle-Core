module Control_Unit_Top(
input Zero,
input [6:0] Op, funct7,
input [2:0] funct3,
output [2:0] ALUControl,
output PCSrc, MemWrite, ALUSrc, RegWrite,
output [1:0] ImmSrc, ALUOp, ResultSrc
    );
    
    wire [1:0] ALUOp_wire;
    wire Branch_wire, Jump_wire;
    
    Main_Decoder Main_Decoder(
      .op(Op),
      .ResultSrc(ResultSrc),
      .MemWrite(MemWrite),
      .ALUSrc(ALUSrc),
      .ImmSrc(ImmSrc),
      .RegWrite(RegWrite),
      .ALUOp(ALUOp_wire),
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
     .op(Op),
     .funct3(funct3),
     .ALUOp(ALUOp_wire),
     .ALUControl(ALUControl)
     );
    
    
endmodule
