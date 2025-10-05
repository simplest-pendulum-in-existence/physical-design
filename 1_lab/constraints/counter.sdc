####################################################################################################
## Clock Definition
####################################################################################################

# Create primary clock on input port "clk"
# - Name: clk
# - Period: 10 ns (100 MHz frequency)
# - Waveform: rising at 0 ns, falling at 5 ns (50% duty cycle)

# iteration 1 
# create_clock -name clk -period 10 -waveform {0 5} [get_ports "clk"] 

# TIP: let's not run iteration randomly but come up with an explanatory expedition 
# towards understanding the core concepts and then try systematically and confindently!

# iteration 2
create_clock -name clk -period 3.2 -waveform {0 1.6} [get_ports "clk"] 

## Clock Uncertainty (Jitter/Skew)

# Setup uncertainty (added during setup analysis for safety margin)
set_clock_uncertainty -setup 2 [get_clocks "clk"]

# Hold uncertainty (added during hold analysis for safety margin)
set_clock_uncertainty -hold 1 [get_clocks "clk"]

# Override with very small uncertainty for clk port (fine-tuned)
set_clock_uncertainty 0.01 [get_ports "clk"]


## Clock Transition (Slew)

# Specify input transition times for the clock signal
set_clock_transition -rise 0.1 [get_clocks "clk"]   ;# Rise time = 0.1 ns
set_clock_transition -fall 0.1 [get_clocks "clk"]   ;# Fall time = 0.1 ns


## Input Constraints
set_input_delay -max 1.0 [get_ports "reset"] -clock [get_clocks "clk"]


## Output Constraints
set_output_delay -max 1.0 [get_ports "count"] -clock [get_clocks "clk"]
