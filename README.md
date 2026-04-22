# Traffic Light Controller (SystemVerilog)

A modular implementation of a Traffic Light Controller designed for FPGA applications. This project demonstrates the use of Finite State Machines (FSM), modular design patterns, and simulation-based verification using SystemVerilog.

## Project Structure

The design is split into several functional modules to ensure scalability and readability:

* **`state_register`**: A sequential logic block that stores the current state of the traffic light, featuring asynchronous active-low reset.
* **`mux2to1`**: A combinational module used to determine the next state based on the timer's status.
* **`timer_module`**: A parameterizable counter that controls the duration of each traffic phase. By adjusting the `MAX_COUNT` parameter, the timing can be adapted for high-frequency FPGA clocks or short-duration simulations.
* **`top`**: The top-level module that integrates the FSM components and decodes states into Green, Yellow, and Red light outputs.

## State Machine Logic

The controller cycles through the following states:
1.  **Green** (`2'b00`)
2.  **Yellow** (`2'b01`)
3.  **Red** (`2'b10`)

## Verification & Simulation

A comprehensive Testbench (`tb.v`) is included to validate the logic without the need for physical hardware. The simulation verifies:
* **Initial Power-on/Reset**: Ensures the system starts in the Green state.
* **State Transitions**: Confirms the correct sequence (Green -> Yellow -> Red) triggered by the timer.
* **Mid-operation Reset**: Tests system stability when the reset signal is toggled during active cycles.

Outputs are logged to the console with timestamps to track signal changes in real-time.

## How to Run

1.  Clone the repository.
2.  Load the source files into your preferred simulator (e.g., Vivado, ModelSim, or EDA Playground).
3.  Run the `tb` module to view the simulation results in the console or waveform viewer.

## Future Improvements
* [ ] Hardware validation on an FPGA development board (e.g., Basys 3 or Nexys A7).
* [ ] Adding a pedestrian crossing button input.
* [ ] Implementing variable timing for different light phases.

![Schematic](schematic_traffic_light.pdf)
