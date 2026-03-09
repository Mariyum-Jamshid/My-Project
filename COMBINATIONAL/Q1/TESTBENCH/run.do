# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/oddparity_16bit.sv

# Compile testbench file
vlog -sv oddparity_16bit_tb.sv

# Start simulation
vsim work.oddparity_16bit_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all