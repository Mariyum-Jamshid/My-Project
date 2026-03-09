#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/any_change_in_32bit.sv

# Compile testbench file
vlog -sv  any_change_in_32bit_tb.sv

# Start simulation
vsim work.any_change_in_32bit_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all