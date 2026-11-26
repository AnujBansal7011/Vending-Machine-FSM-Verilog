# Vending Machine FSM using Verilog HDL

## 1. Project Overview

This project implements a **Vending Machine Controller** using Verilog HDL and a Finite State Machine (FSM).

The vending machine has a fixed product price of **₹15** and accepts three denominations: ₹5, ₹10, and ₹20.

The controller checks the inserted amount and generates the appropriate dispense and change signals.

## 2. Features

- FSM-based vending machine controller.
- Fixed product price of ₹15.
- Accepts ₹5, ₹10, and ₹20 coins.
- Supports exact payment and overpayment.
- Automatically generates the dispense signal.
- Generates appropriate change signals.
- Active-high asynchronous reset.
- Designed and simulated using Xilinx Vivado.

## 3. Inputs and Outputs

### Inputs

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `reset` | Active-high asynchronous reset |
| `coin_5` | ₹5 coin input |
| `coin_10` | ₹10 coin input |
| `coin_20` | ₹20 coin input |

### Outputs

| Signal | Description |
|---|---|
| `dispense` | Activates product dispensing |
| `change_5` | Indicates ₹5 change |
| `change_10` | Indicates ₹10 change |
| `change_15` | Indicates ₹15 change |
| `change_20` | Indicates ₹20 change |

## 4. FSM State Description

| State | Binary Code | Description |
|---|---|---|
| S0 | 000 | Initial state (₹0) |
| S5 | 001 | ₹5 received |
| S10 | 010 | ₹10 received |
| S15 | 011 | Exact amount received |
| DISPENSE | 100 | Overpayment and change handling |

## 5. Working Principle

1. Initially, the vending machine remains in state S0.
2. When a ₹5 coin is inserted, the FSM moves to S5.
3. When a ₹10 coin is inserted, the FSM moves to S10.
4. When the accumulated amount reaches ₹15, the machine activates `dispense`.
5. If the inserted amount exceeds ₹15, the machine activates `dispense` along with the appropriate change output.
6. After dispensing, the FSM automatically returns to its initial state.

**Note:** Each coin input is intended to be applied as a one-clock-cycle pulse. Only one coin input should be HIGH at a time.

## 6. Manual Verification

The design was manually verified using Xilinx Vivado Behavioral Simulation.

The following cases were checked:

| Test Case | Coin Combination | Expected Result |
|---|---|---|
| TC1 | ₹5 + ₹10 | Dispense, no change |
| TC2 | ₹10 + ₹5 | Dispense, no change |
| TC3 | ₹20 | Dispense + ₹5 change |
| TC4 | ₹5 + ₹20 | Dispense + ₹10 change |
| TC5 | ₹10 + ₹10 | Dispense + ₹5 change |
| TC6 | ₹10 + ₹20 | Dispense + ₹15 change |

All listed cases were checked through manual simulation, and the observed outputs matched the expected results.

## 7. Tools Used

- Verilog HDL
- Xilinx Vivado
- Behavioral Simulation

## 8. Project Structure

```text
Vending_machine/
│
├── RTL/
│   └── vending_fsm.v
│
├── Manual Testing/
│   └── Simulation waveform screenshots
│
└── README.md
```

## 9. Learning Outcomes

- Understanding Finite State Machines.
- Implementing sequential logic using Verilog HDL.
- Understanding state transitions and output logic.
- Working with clock and reset signals.
- Performing manual verification using Vivado simulation.

---

**Project:** Vending Machine FSM  
**HDL:** Verilog  
**Tool:** Xilinx Vivado