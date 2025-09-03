# RISC-V Single Cycle Core

## Overview
This project implements a **32-bit RISC-V single-cycle processor** in Verilog.  
The design supports a subset of RISC-V instructions and executes each instruction in **one clock cycle**, making it suitable for FPGA implementation and processor architecture experiments.

---

## Features
- 32-bit **single-cycle RISC-V processor**.
- Supports **RV32I instruction set** (subset):
  - Arithmetic: `ADD`, `SUB`, `ADDI`
  - Load/Store: `LW`, `SW`
  - Branch: `BEQ`, `BNE`
  - Jump: `JAL`, `JALR`
  - Logical: `AND`, `OR`, `XOR`, `ANDI`, `ORI`, `XORI`
- **Register File** with 32 registers.
- Instruction and Data Memory modules.
- Fully synthesizable for FPGA implementation.
- Written in **Verilog HDL**.

---

## Top Architecture

<img width="1024" height="545" alt="RISC-V_Single_Cycle_Processor" src="https://github.com/user-attachments/assets/b5c362c6-e05c-4562-99c5-8a5c1f628d00" />

---


---

## Getting Started

### Prerequisites
- [Vivado 2024.2](https://www.xilinx.com/products/design-tools/vivado.html) or compatible FPGA design tool.
- Basic knowledge of **Verilog HDL** and **RISC-V ISA**.

### How to Run
1. Open Vivado and create a project or run the Tcl script in `scripts/create_project.tcl`.
2. Add all files from `Src/` to the project.
3. Simulate using `Single_Cycle_Top_Tb.v` in `Src/`.
4. Synthesize and implement for your FPGA board (e.g., Zybo Z7-10, Nexys 4 DDR).

---

## Test Instructions
- Use the provided **testbench** to verify the RISC-V core functionality.
- Modify instructions in "memfile.hex" for custom tests.
- Ensure that each instruction uses separate registers to prevent conflicts during simulation.

---
## References

1. Sarah L. Harris and David Money Harris, *Digital Design and Computer Architecture: RISC-V Edition*, Morgan Kaufmann, 2021.  

2. Sarah Harris, *RISC-V David Harris and Sarah Harris Microarchitecture* [YouTube Playlist].  
   Available: [YouTube – Sarah Harris](https://www.youtube.com/watch?v=lrN-uBKooRY&list=PLhA3DoZr6boVQy9Pz-aPZLH-rA6DvUidB&index=1)
---

## License
This project is **open-source** and available under the [MIT License](LICENSE).

---

## Author
**Subramanian T H**  
ECE Student (Final year) - Sri Venkateswaraa College of Technology | VLSI Enthusiast
- LinkedIn: linkedin.com/in/subramanian-t-h/  
- Email: subramanith.ece@gmail.com




