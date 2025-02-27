# 4x4 Multiplier with Xilinx CARRY4 Logic

## Overview
A high-performance 4x4 multiplier implementation utilizing Xilinx CARRY4 primitives for efficient multiplication on FPGAs.

## Features
- 4-bit × 4-bit multiplication
- Efficient CARRY4-based addition
- Optimized for Xilinx 7-series FPGAs
- Full testbench suite included

## Architecture
```
                    ┌──────────┐
     A[3:0]  ─────►│          │
                   │   4x2    ├──────┐
     B[1:0]  ─────►│   MULT   │      │   ┌──────────┐
                   └──────────┘      ├───►│          │
                                    │    │  CARRY4   ├───► P[7:0]
                   ┌──────────┐     │    │  ADDER   │
     A[3:0]  ─────►│   4x2    ├────┘    └──────────┘
                   │   MULT   │
     B[3:2]  ─────►│         │
                   └──────────┘
```

## CARRY4 Details
The CARRY4 primitive is a dedicated carry logic block in Xilinx FPGAs providing:
- 4-bit carry chain logic
- Fast carry propagation paths
- Built-in XOR gates for sum generation
- Configurable carry initialization

### CARRY4 Port Interface
| Port   | Width | Direction | Description            |
|--------|--------|-----------|------------------------|
| CI     | 1-bit  | Input     | Carry input           |
| CYINIT | 1-bit  | Input     | Carry initialization  |
| DI     | 4-bit  | Input     | Data inputs           |
| S      | 4-bit  | Input     | Sum select inputs     |
| O      | 4-bit  | Output    | Sum outputs           |
| CO     | 4-bit  | Output    | Carry outputs         |

## Project Structure
```
4x4_Multiplier/
├── rtl/
│   ├── multiplier4x4.v    # Main module
│   └── carry4_adder.v     # CARRY4 adder
├── tb/
│   └── tb_multiplier4x4.v # Testbench
└── README.md
```

## Interface Description
| Signal   | Width | Direction | Description        |
|----------|--------|-----------|-------------------|
| A[3:0]   | 4-bit  | Input     | First operand     |
| B[3:0]   | 4-bit  | Input     | Second operand    |
| P[7:0]   | 8-bit  | Output    | Product          |

## Test Cases
| Test Case | A | B | Expected Product | Description    |
|-----------|---|---|-----------------|----------------|
| 1         | 2 | 3 | 6              | Basic multiply |
| 2         | 5 | 6 | 30             | Mid-range      |
| 3         | 9 | 7 | 63             | Large numbers  |
| 4         | 15| 15| 225            | Maximum values |

## Usage Instructions

### Setup
1. Clone repository:
```bash
git clone https://github.com/sahilmaurya007/4x4-Multiplier.git
cd 4x4-Multiplier
```

2. Create project structure:
```bash
mkdir rtl tb
```

### Vivado Implementation
```tcl
create_project mult_4x4 ./mult_4x4 -part xc7a35tcpg236-1
add_files {./rtl/multiplier4x4.v ./rtl/carry4_adder.v}
add_files -fileset sim_1 ./tb/tb_multiplier4x4.v
set_property top multiplier4x4 [current_fileset]
launch_simulation
```

## Resource Utilization
Target: Xilinx Artix-7 (xc7a35tcpg236-1)
- CARRY4 primitives: 2
- LUTs: [TBD]
- Flip-Flops: [TBD]
- Maximum Frequency: [TBD] MHz

## Author
Sahil Maurya
- GitHub: [sahilmaurya007](https://github.com/sahilmaurya007)
- Repository: [4x4-Multiplier](https://github.com/sahilmaurya007/4x4-Multiplier)

## License
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

## Support
For issues and feature requests, please [open an issue](https://github.com/sahilmaurya007/4x4-Multiplier/issues)

## Version History
- v1.0.0 (2025-02-26): Initial release
