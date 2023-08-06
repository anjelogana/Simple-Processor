The VHDL File was created on Fall 2022, and the Verilog File was created on Summer 2023.

Demo: https://youtu.be/xNxF5diaf2k

Creator of these files is Anjelo Gana

For the Verilog File, I have gone through the 3 steps of a build process.
1. Writing the HDL Code
2. Simulate the HDL Code using EDA Playground [Cloud Simulator]
3. Test FPGA on Hardware

The purpose of this project was to create a simple processor by using the 4 distinct components to create a cpu.
1. Register [Used a D-Flip-Flop]
2. Control Unit [Used a Moore FSM & 4x16 Decoder]
3. Arithmetic Logic Unit (ALU)
4. Control Bus

The FPGA used is the LATTICE iCE40HX1K VQ100 nandland.com goboard.

The following files are taken from nandland.com for the place and route of the FPGA
"Go_Board_Clock_Constraint.sdc"
"Go_Board_Constraints.pcf"

Project Summary: