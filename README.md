# Verilog Digital Design and Notes

This repository contains Verilog implementations of various digital design modules, as well as detailed notes to help understand and learn Verilog programming. It serves as a comprehensive resource for digital design enthusiasts and learners.

---

## Repository Overview

### 1. **Modules**
This section contains Verilog implementations of fundamental digital design circuits and a simple in-order processor. Each module is well-documented and tested for correctness.

#### **Included Modules:**
- **[4-bit Adder](./adder.v):** Performs 4-bit addition and outputs the sum and carry-out.
- **[4-bit Equality Comparator](./comparator.v):** Compares two 4-bit inputs for equality.
- **[4-bit Divider](./divider.v):** Divides a 4-bit dividend by a divisor and outputs the quotient and remainder.
- **[4-bit Multiplier](./multiplier.v):** Multiplies two 4-bit numbers and outputs an 8-bit product.
- **[8-bit ALU](./alu.v):** Performs arithmetic and logic operations like ADD, SUB, AND, OR, XOR, and NOR.
- **[In-Order Processor](./processor.v):** Implements a simple processor that integrates the ALU and executes instructions sequentially.

---

### 2. **Notes**
The `Notes` contains detailed learning materials and documentation on Verilog concepts, including:
- Introduction to Verilog.
- Syntax and data types.
- Combinational and sequential circuits.
- Testbenches and simulation.
- Design examples with step-by-step explanations.

#### **File:** [`verilog_notes.pdf`](./verilog_notes.pdf)

---

## Simulation and Testing

- **Tools Used:**  
  - **Icarus Verilog:** For compiling and running simulations.  
  - **GTKWave:** For waveform analysis.

- **To Compile and Simulate:**
  ```bash
  iverilog -o <output_file> <source_files>
  vvp <output_file>
  ```

- **Sample Testbenches:**  
  Testbenches for each module are available in the `Testbenches` directory.


---

## Contribution
Contributions are welcome! Feel free to fork the repository, add your improvements, and create a pull request.

---
