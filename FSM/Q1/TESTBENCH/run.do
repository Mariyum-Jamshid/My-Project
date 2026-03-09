#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/fsm_moore_ovrlapping_1001.sv

# Compile testbench file
vlog -sv  fsm_moore_ovrlapping_1001_tb.sv

# Start simulation
vsim work.fsm_moore_ovrlapping_1001_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all