# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/mux4x1_ifelse.sv

# Compile testbench file
vlog -sv mux4x1_ifelse_tb.sv

# Start simulation
vsim work.mux4x1_ifelse_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all