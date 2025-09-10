module Instr_Mem(
input [31:0] A,
input rst,
output [31:0] RD
    );
    
    
reg [31:0] mem [1023:0];

assign RD = (rst == 1'b1) ? 32'h00000000 : mem[A[31:2]] ;

initial begin
$readmemh("memfile.hex", mem);
$display("Successfully read...");
end 

/*initial begin
//mem[0] = 32'hFFC4A303;
//mem[1] = 32'h00842383;
//mem[0] = 32'h0064A423;
//mem[1] = 32'h00B62423;
mem[0] = 32'h0062E233;
end */
  
endmodule
