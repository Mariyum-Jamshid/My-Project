#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/priority_encoder_8x3.sv

# Compile testbench file
vlog -sv  priority_encoder_8x3_tb.sv

# Start simulation
vsim work.priority_encoder_8x3_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all