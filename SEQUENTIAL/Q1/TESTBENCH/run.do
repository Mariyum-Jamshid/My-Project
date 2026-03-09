#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/One_pulse_after_every_100ns_time.sv
vlog -sv ../DESIGN/negative_edge_1bit.sv
vlog -sv ../DESIGN/any_change_in_32bit.sv
vlog -sv ../DESIGN/positive_edge_1bit.sv
vlog -sv ../DESIGN/delay_32bit.sv

# Compile testbench file
vlog -sv  All_Q1_sequential_ckts_tb.sv

# Start simulation
vsim work.All_Q1_sequential_ckts_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all