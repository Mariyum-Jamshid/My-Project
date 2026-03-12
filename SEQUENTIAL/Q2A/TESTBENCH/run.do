#Stops previous simulation
quit -sim

#Deletes all compiled modules in work library
#vdel -all -lib work

# Create work library
vlib work
vmap work work

# Compile design file
vlog -sv ../DESIGN/Parallel_In_Serial_Out_16_bit_circuit.sv

# Compile testbench file
vlog -sv  Parallel_In_Serial_Out_16_bit_circuit_tb.sv

# Start simulation
vsim work.Parallel_In_Serial_Out_16_bit_circuit_tb

# Add all signals to waveform
add wave *

# Run simulation
run -all