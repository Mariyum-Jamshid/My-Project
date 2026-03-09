#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/delay_32bit.sv

# Compile testbench file
vlog -sv  delay_32bit_tb.sv

# Start simulation
vsim work.delay_32bit_tb

# Add all signals to waveform
do wave.do

# Run simulation
run -all