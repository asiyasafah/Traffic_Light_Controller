 Traffic Light Controller using Verilog HDL
 Project Overview
This project implements a Traffic Light Controller using Verilog HDL. The controller uses a Finite State Machine (FSM) with timer-based state transitions to control traffic lights for two roads. The design demonstrates digital logic concepts such as sequential circuits, state machines, counters, and traffic signal control.

 Features
Traffic light control for two roads
 Finite State Machine (FSM)
 Timer-based state transitions
 Verilog HDL implementation
 Simulation using Icarus Verilog
 Waveform analysis using GTKWave

 Software Used
  Icarus Verilog
  GTKWave
  MSYS2 (MinGW64)

 Project Files
  traffics_light.v – Main Verilog source code
  traffics_light_tb.v – Testbench
  traffic.vcd – Simulation waveform
  README.md – Project documentation

How to Run

Compile
```bash
iverilog -o traffic traffics_light.v traffics_light_tb.v
```

Run Simulation
```bash
vvp traffic
```

Open Waveform
```bash
gtkwave traffic.vcd
```

Applications
 Digital Electronics
 VLSI Design
 FPGA Learning
 Traffic Signal Automation

Author
Asiya Safa

Internship
Developed as part of a VLSI Internship Project.