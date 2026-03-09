#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/binary_to_gray_4bit.sv
vlog -sv ../DESIGN/gray_to_binary_4bit.sv

# Compile testbench file
vlog -sv  converter_tb.sv

# Start simulation
vsim work.converter_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all