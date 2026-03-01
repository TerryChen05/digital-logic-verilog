## Verilog Practice

A collection of Verilog modules written for practice, done in VSCode, simulated with Icarus Verilog.

## Structure
```
gates/           — Basic logic gates (AND, OR, XOR, NOR, NAND, MUX implementations)
comb_logic/      — Combinational circuits (adders, MUX, decoder, encoder, comparator, BCD converter, etc)
seq_logic/       — Sequential circuits (flip-flops, latches, counters, shift registers, etc)
```
The testbench files (`_tb.v`) are included alongside each module in their corresponding directory.

## Simulation
The testbenches can be compiled and ran with [Icarus Verilog](https://github.com/steveicarus/iverilog):
```bash
iverilog path/to/source.v -o path/to/executable.vvp
vvp path/to/executable.vvp
```
The waveforms can be viewed with [GTKWave](https://gtkwave.sourceforge.net/):
```bash
gtkwave path/to/testbench.vcd
```
