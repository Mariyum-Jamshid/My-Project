# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/mux4x1_case.sv

# Compile testbench file
vlog -sv mux4x1_case_tb.sv

# Start simulation
vsim work.mux4x1_case_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all