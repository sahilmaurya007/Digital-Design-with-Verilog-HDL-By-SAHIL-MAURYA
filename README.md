# Digital-Design-with-Verilog-HDL-By-SAHIL-MAURYA
Here you can find my Digital Design with Verilog HDL projects
# 4x4 Multiplier with Xilinx CARRY4 Logic

```markdown
# 4x4 Multiplier with Xilinx CARRY4 Logic

## Detailed Technical Documentation

### Overview
This project implements a 4x4 multiplier utilizing Xilinx's CARRY4 primitives for efficient multiplication. The design leverages FPGA-specific carry chain logic for optimized performance.

### CARRY4 Primitive Architecture
The CARRY4 primitive in Xilinx FPGAs:
- 4-bit carry chain logic
- Dedicated fast paths for carry propagation
- Built-in XOR gates for sum generation
- Configurable carry initialization

#### CARRY4 Port Description
| Port   | Width | Direction | Description                    |
|--------|--------|-----------|--------------------------------|
| CI     | 1-bit  | Input     | Carry input                   |
| CYINIT | 1-bit  | Input     | Carry initialization          |
| DI[3:0]| 4-bit  | Input     | Data inputs                   |
| S[3:0] | 4-bit  | Input     | Sum select inputs             |
| O[3:0] | 4-bit  | Output    | Sum outputs                   |
| CO[3:0]| 4-bit  | Output    | Carry outputs                 |

### Multiplier Implementation
#### Key Features
- Input Width: 4 bits × 4 bits
- Output Width: 8 bits
- Uses two CARRY4 primitives
- Partial product generation
- Two-stage addition process

#### Block Diagram
```
A[3:0] ---->[4x2 Mult]---->[CARRY4]
                               |
B[3:0] ---->[4x2 Mult]---->[CARRY4]
                               |
                           P[7:0]
```

### Project Structure
```
4x4_Multiplier/
├── rtl/
│   ├── multiplier4x4.v    # Main multiplier module
│   └── carry4_adder.v     # CARRY4-based adder
├── tb/
│   └── tb_multiplier4x4.v # Testbench
├── docs/
│   ├── block_diagram.png
│   └── timing_diagram.png
└── README.md
```

### Specifications
#### Module Interface
```verilog
module multiplier4x4 (
    input  [3:0] A,   // First operand
    input  [3:0] B,   // Second operand
    output [7:0] P    // Product output
);
```

#### Timing Parameters
- Clock-to-Output: [TBD] ns
- Setup Time: [TBD] ns
- Hold Time: [TBD] ns

### Test Cases
| Test Case | A | B | Expected Product | Description       |
|-----------|---|---|-----------------|-------------------|
| 1         | 2 | 3 | 6              | Basic multiply    |
| 2         | 5 | 6 | 30             | Mid-range values  |
| 3         | 9 | 7 | 63             | Larger numbers    |
| 4         | 15| 15| 225            | Maximum values    |

### Setup and Usage
1. Create project directory:
```bash
mkdir 4x4_Multiplier
cd 4x4_Multiplier
mkdir rtl tb docs
```

2. Clone repository:
```bash
git clone https://github.com/sahilmaurya007/4x4-Multiplier.git
```

3. Vivado commands:
```tcl
create_project mult_4x4 ./mult_4x4 -part xc7a35tcpg236-1
add_files {./rtl/multiplier4x4.v ./rtl/carry4_adder.v}
add_files -fileset sim_1 ./tb/tb_multiplier4x4.v
```

### Synthesis Results
Target Device: Xilinx Artix-7 (xc7a35tcpg236-1)
- LUT Usage: [TBD]
- FF Usage: [TBD]
- CARRY4 Blocks: [TBD]
- Maximum Frequency: [TBD] MHz

### Performance Analysis
#### Resource Utilization
- CARRY4 primitives: 2
- LUTs: [TBD]
- Flip-Flops: [TBD]

#### Critical Path
- Start point: Input registers
- End point: Output registers
- Path delay: [TBD] ns

### Author
Sahil Maurya
- GitHub: [sahilmaurya007](https://github.com/sahilmaurya007)
- Repository: [4x4-Multiplier](https://github.com/sahilmaurya007/4x4-Multiplier)

### License
MIT License

Copyright (c) 2025 Sahil Maurya

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

### Version History
- v1.0.0 (2025-02-26): Initial release
- Future planned updates:
  - Pipelined version
  - Optimized partial product generation
  - Extended test cases

### Support
For technical support and feature requests:
- Open an issue on GitHub
- Contact: [Your contact information]

### References
1. Xilinx 7 Series FPGA Documentation
2. CARRY4 Primitive Guide
3. Digital Arithmetic Implementation Guidelines

### Appendix
A. Timing Diagrams
B. Resource Utilization Reports
C. Test Case Details
```

Similar code found with 3 license types
