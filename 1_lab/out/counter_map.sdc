# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Tue Sep 30 07:23:00 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Tue Sep 30 08:31:23 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Wed Oct 01 03:02:20 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Wed Oct 01 03:03:28 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 4.0 -waveform {0.0 2.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Sat Oct 04 03:38:19 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Sat Oct 04 23:16:10 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 3.2 -waveform {0.0 1.6} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Sun Oct 05 05:10:19 PKT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 3.2 -waveform {0.0 1.6} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports reset]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {count[0]}]
set_wire_load_mode "segmented"
set_clock_uncertainty -setup 2.0 [get_clocks clk]
set_clock_uncertainty -hold 1.0 [get_clocks clk]
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
