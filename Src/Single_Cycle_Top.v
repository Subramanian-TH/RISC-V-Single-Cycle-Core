module Single_Cycle_Top(
input clk,rst
    );
    
    wire [31:0] PC_Top, RD_Instr, RD1_Top, Imm_Ext_Top, ALUResult, ReadData, PCPlus4, RD2_Top, SrcB, Result, PCTarget, PCNext;
    wire [2:0] ALUcontrol_Top, MemWrite;
    wire RegWrite, ALUSrc,PCSrc, Zero, Branch_wire;
    wire [1:0] ImmSrc, ALUOp_wire, ResultSrc;
     
    Mux Mux_to_PC(
    .a(PCPlus4),
    .b(PCTarget),
    .s(PCSrc),
    .c(PCNext)
    );
     
    PC Program_Counter(
    .clk(clk),
    .rst(rst),
    .PC_NEXT(PCNext),
    .PC(PC_Top)
    );
    
    PC_Adder PC_Adder(
    .a(PC_Top),
    .b(32'd4),
    .s(PCPlus4)
    );
    
    Instr_Mem Instruction_Memory(
    .rst(rst),
    .A(PC_Top),
    .RD(RD_Instr)
    );
    
    Reg_File Register_File(
    .clk(clk),
    .rst(rst),
    .A1(RD_Instr[19:15]),
    .A2(RD_Instr[24:20]),
    .A3(RD_Instr[11:7]),
    .WE3(RegWrite),
    .WD3(Result),
    .RD1(RD1_Top),
    .RD2(RD2_Top)
    );
    
    Sign_Extend Sign_Extend(
    .In(RD_Instr),
    .ImmSrc(ImmSrc),
    .ImmExt(Imm_Ext_Top)
    );
    
    PC_Adder PC_Adder_to_Mux(
    .a(PC_Top),
    .b(Imm_Ext_Top),
    .s(PCTarget)
    );
    
    Mux Mux_RegFile_to_ALU (
    .a(RD2_Top),
    .b(Imm_Ext_Top),
    .s(ALUSrc),
    .c(SrcB)
    );
      
    ALU ALU(
    .A(RD1_Top),
    .B(SrcB),
    .ALUControl(ALUcontrol_Top),
    .Result(ALUResult),
    .Z(Zero),
    .N(),
    .C(),
    .V()
    );
    
    Control_Unit_Top Control_Unit(
    .Zero(Zero),
    .Op(RD_Instr[6:0]), 
    .funct7(RD_Instr[6:0]),
    .funct3(RD_Instr[14:12]),
    .ALUControl(ALUcontrol_Top),
    .ResultSrc(ResultSrc), 
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc), 
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .PCSrc(PCSrc)
    );
    
    Data_Mem Data_Memory(
    .clk(clk),
    .rst(rst),
    .WE(MemWrite),
    .A(ALUResult), 
    .WD(RD2_Top),
    .RD(ReadData)
    );
    
    Mux_3_to_1 Mux_DataMem_to_RegFile(
    .a(ALUResult),
    .b(ALUResult),
    .c(ReadData),
    .d(PCPlus4),
    .s(ResultSrc),
    .r(Result)
    ); 
       
endmodule
