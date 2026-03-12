#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/complex_add_mul.sv

# Compile testbench file
vlog -sv  complex_add_mul_tb.sv

# Start simulation
vsim work.complex_add_mul_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all