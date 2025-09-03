module Data_Mem(
input clk, rst, WE, 
input [31:0] A, WD,
output [31:0] RD
    );
    
    
reg [31:0] data_mem [1023:0];

//Read operation
assign RD = (rst == 1'b0) ? data_mem[A] : 32'h00000000;
    
//Write Operation
always@(posedge clk)
begin 

if (WE)
begin   
data_mem[A] <= WD;
end 

end   

initial begin
data_mem[40] = 32'h00000016;

end   
    
endmodule
