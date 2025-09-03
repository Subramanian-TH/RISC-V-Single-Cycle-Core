module PC_Src(
input Zero, Branch, Jump,
output PCSrc
    );
    
    assign PCSrc = (Zero & Branch) | Jump;
    
endmodule
