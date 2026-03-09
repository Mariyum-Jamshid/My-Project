#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/negative_edge_1bit.sv

# Compile testbench file
vlog -sv  negative_edge_1bit_tb.sv

# Start simulation
vsim work.negative_edge_1bit_tb

# Add all signals to waveform
add wave*
#do wave.do

# Run simulation
run -all