#Clock 
set_property PACKAGE_PIN E3 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -name SysClk -period 13.0 [get_ports {clk}]

#RESET 
set_property PACKAGE_PIN N17 [get_ports {rst}]   
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

#ALU Result
# LEDs (LD0-LD15)
set_property PACKAGE_PIN H17 [get_ports {ALU_Result_Out[0]}]
set_property PACKAGE_PIN K15 [get_ports {ALU_Result_Out[1]}]
set_property PACKAGE_PIN J13 [get_ports {ALU_Result_Out[2]}]
set_property PACKAGE_PIN N14 [get_ports {ALU_Result_Out[3]}]
set_property PACKAGE_PIN R18 [get_ports {ALU_Result_Out[4]}]
set_property PACKAGE_PIN V17 [get_ports {ALU_Result_Out[5]}]
set_property PACKAGE_PIN U17 [get_ports {ALU_Result_Out[6]}]
set_property PACKAGE_PIN U16 [get_ports {ALU_Result_Out[7]}]
set_property PACKAGE_PIN V16 [get_ports {ALU_Result_Out[8]}]
set_property PACKAGE_PIN T15 [get_ports {ALU_Result_Out[9]}]
set_property PACKAGE_PIN U14 [get_ports {ALU_Result_Out[10]}]
set_property PACKAGE_PIN T16 [get_ports {ALU_Result_Out[11]}]
set_property PACKAGE_PIN V15 [get_ports {ALU_Result_Out[12]}]
set_property PACKAGE_PIN V14 [get_ports {ALU_Result_Out[13]}]
set_property PACKAGE_PIN V12 [get_ports {ALU_Result_Out[14]}]
set_property PACKAGE_PIN V11 [get_ports {ALU_Result_Out[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ALU_Result_Out[*]}]





      
      
      
          