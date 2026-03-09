#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/One_pulse_after_every_100ns_time.sv

# Compile testbench file
vlog -sv  One_pulse_after_every_100ns_time_tb.sv

# Start simulation
vsim work.One_pulse_after_every_100ns_time_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all