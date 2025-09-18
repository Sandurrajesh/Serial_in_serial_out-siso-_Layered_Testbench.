# Serial_in_serial_out-siso-_Layered_Testbench.
SISO Layered Testbench in SystemVerilog
This repository contains a SystemVerilog layered testbench for a Serial-In Serial-Out (SISO) Design Under Test (DUT). The testbench is composed of the following components:

Components- Transaction: Defines the data structure for transactions.
- Generator: Generates random transactions.
- Driver: Drives the input signals to the DUT.
- Monitor: Observes the input and output signals of the DUT.
- Agent: Manages the generator, driver, and monitor.
- Scoreboard: Compares the actual output with the expected output.
- Environment: Manages the agent and scoreboard.
- Test: Runs the environment.
- Top module: Instantiates the DUT and interface.

Running the TestbenchTo run the testbench, use Cadence's irun simulator. Follow these steps:

1. Clone the repository.
2. Navigate to the repository directory.
3. Run the testbench using irun.

This testbench provides a structured and modular approach to verifying the SISO DUT. Each component plays a crucial role in ensuring the thorough testing of the design.
