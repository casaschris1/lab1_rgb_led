\## ECE 520 Lab 1 - RGB LED Controller 



This project implements led controller for the Zybo\_Z7 using VHDL and Vivado. This design uses three switches to select the color, (red, green, and blue). The selected switch blinks using the blinking LED module made from Part 1 of the lab.



\## Inputs

'sys\_clk' -- 125MHz system clock is implemented

'rst' -- resets the input

'sw\[2:0]' -- three switches are selected to output different colors



\## Output

'rgb\_out' -- RGB LED output



\## Switches

'001' -- Red

'010' -- Green

'100' -- Blue

All other combinations -- LED is off



\## Project Files

'src/blinking\_led.vhd' -- Blinking LED module

'src/rgb\_led\_top.vhd' -- Top-Level RGB LED controller

'sim/tb\_rgb\_led\_top.vhd' -- Testbench

'constraints/zybo\_z7.xdc' -- Zybo Z7 pin constraints

'screenshots/' -- Simulation results



\## Simulation

Five test cases were implemented in Vivado



\## Test Case 1 (Reset)

The reset signal was implemented

!\[Test Case 1](screenshots/ECE520\_Lab1\_Part\_2\_Test\_Case\_1.png)



\## Test Case 2 (Red)

'001' selects blinking red LED

!\[Test Case 2](screenshots/ECE520\_Lab1\_Part\_2\_Test\_Case\_2.png)



\## Test Case 3 (Green)

'010' selects blinking green LED

!\[Test Case 3](screenshots/ECE520\_Lab1\_Part\_2\_Test\_Case\_3.png)



\## Test Case 4 (Blue)

'100' selects blinking blue LED

!\[Test Case 4](screenshots/ECE520\_Lab1\_Part\_2\_Test\_Case\_4.png)



\## Test Case 5 (off)

Any other switch combination results in LED off

!\[Test Case 5](screenshots/ECE520\_Lab1\_Part\_2\_Test\_Case\_5.png)



\## Hardware

Digilent Zybo\_Z7-10

Xilinx Zynq-7000

Vivado 2023.1



\## Sources 

ChatGPT



\## Results

The design was successful! 

