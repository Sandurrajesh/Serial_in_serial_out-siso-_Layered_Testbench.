# SISO 4-Bit Shift Register UVM Verification Project.

## 🚀 Project Overview

This repository contains the **UVM-based verification environment** for a **4-bit Serial-In Serial-Out (SISO) Shift Register**.
The objective is to verify:

* Correct shifting behavior
* Accurate propagation of `din` to `dout` after 4 clock cycles
* Functional coverage for all din/dout combinations
* Scoreboard reference model correctness
* Randomized and directed test scenarios

This project demonstrates a complete UVM testbench including:
✔ Driver
✔ Sequencer
✔ Monitor
✔ Scoreboard
✔ Subscriber-based Coverage
✔ Agent
✔ Environment
✔ Test
✔ Interface
✔ DUT

---

## 🧩 **Design Under Test (DUT)**

The DUT is a **4-bit SISO shift register**:

```
ref_model = {ref_model[2:0], din};
dout = ref_model[3];   // MSB output after 4 shifts
```

Behavior:

* Each clock cycle shifts the register left.
* New input bit enters LSB.
* Output `dout` = MSB after 4 cycles of latency.

   

## 🧪 **Verification Plan Summary**

### ✔ **Testcases**

| Sl.No | Testcase Name    | Description           | Expected Result             |
| ----- | ---------------- | --------------------- | --------------------------- |
| 1     | directed_zeros   | din = 0 for 20 cycles | dout = 0 always             |
| 2     | directed_ones    | din = 1 for 20 cycles | dout = 1 after 4 cycles     |
| 3     | alternating_bits | 101010…               | output should shift pattern |
| 4     | random_sequence  | fully randomized din  | matches scoreboard          |
| 5     | reset_test       | reset during shifts   | register cleared            |

---

## 📊 **Functional Coverage**

Coverage model contains:

```
covergroup cg_siso @(posedge vif.clk);
  cp_din   : coverpoint pkt.din;
  cp_dout  : coverpoint pkt.dout;
  cross_din_dout : cross cp_din, cp_dout;
endgroup
```

Coverage Targets:

* All din values → 0,1
* All dout values → 0,1
* All cross combinations
* Minimum coverage goal: **95%**

---

## 🎯 **Scoreboard Reference Model**

```
ref_model = {ref_model[2:0], pkt.din};
expected = ref_model[3];

if(pkt.dout != expected)
   UVM_ERROR("SCB", $sformatf("Expected=%0b Got=%0b", expected, pkt.dout));
```

---

## ▶️ How to Run

### **Compile**

```
irun -f run/run.f -uvm
```

### **Run Simulation**

```
irun -R -covoverwrite
```

### **View Coverage**

```
imc &
```

---

## ✨ **Highlights**

* Fully UVM-compliant TB
* Works on Cadence Xcelium / Incisive
* Includes functional coverage and scoreboard
* Clean layering, reusable components
* Random + Directed tests

---

## 📜 License

MIT License

---

## 👤 Author

**Rajesh S**
UVM Verification Engineer

---

If you want, I can also generate:

✔ `vplan.pdf`
✔ `testcase_matrix.xlsx`
✔ Block diagram PNG
✔ GitHub tags + version numbering

Just say **"generate now"**.
