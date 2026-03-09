# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/decoder_3x8_case.sv

# Compile testbench file
vlog -sv decoder_3x8_case_tb.sv

# Start simulation
vsim work.decoder_3x8_case_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all