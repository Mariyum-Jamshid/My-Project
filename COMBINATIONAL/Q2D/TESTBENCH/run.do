# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/encoder_8x3_case.sv

# Compile testbench file
vlog -sv encoder_8x3_case_tb.sv

# Start simulation
vsim work.encoder_8x3_case_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all