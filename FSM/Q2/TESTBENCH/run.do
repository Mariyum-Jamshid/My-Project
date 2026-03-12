#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/fsm_divisible_by_5.sv

# Compile testbench file
vlog -sv  fsm_divisible_by_5_tb.sv

# Start simulation
vsim work.fsm_divisible_by_5_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all