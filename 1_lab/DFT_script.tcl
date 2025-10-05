####################################################################################################
## Environment Setup
####################################################################################################

# Print CPU information (for logging/debugging system environment)
if {[file exists /proc/cpuinfo]} {
    sh grep "model name" /proc/cpuinfo
    sh grep "cpu MHz"    /proc/cpuinfo
}

# Print hostname for traceability in reports
puts "Hostname : report timing [info hostname]"

set base_path "/home/cc/hamza_mateen/6_module/1_lab"

# Setup library search path
# IMPORTANT: update this to point to your standard cell library directory
# set_db / .init_lib_search_path /home/cc/HIRA_PD_cadence/COHORT3/Frontend/65_lp_libs
set_db / .init_lib_search_path [file join $base_path "65_lp_libs"]

# Read technology library (timing/power/area characterization)
read_libs {./65_lp_libs/tcbn65lptc.lib}


####################################################################################################
## Design Setup
####################################################################################################

# Define design and tool effort parameters
set DESIGN       counter     ;# Top-level module name
set GEN_EFF      high        ;# Generic synthesis effort: high | medium | low
set MAP_OPT_EFF  high        ;# Mapping effort: high | medium | low


####################################################################################################
## Read and Elaborate RTL
####################################################################################################

# Read RTL Verilog source files
read_hdl -v2001 [file join $base_path "RTL/counter.v"]

# Elaborate top-level module
elaborate $DESIGN 

# Check design for unresolved modules/references
check_design -unresolved

# Read timing constraints (SDC file: clocks, I/O delays, etc.)
# read_sdc /home/cc/HIRA_PD_cadence/COHORT3/Frontend/constraints/counter.sdc
read_sdc [file join $base_path "constraints/counter.sdc"]

## DFT (Design-for-Test) Setup

set_db dft_scan_style muxed_scan

set_db dft_prefix dft_

# Define scan enable (SE) signal, active-high, and create port
define_shift_enable -name SE -active high -create_port SE

# Check for DFT rule compliance (initial check before synthesis)
check_dft_rules


####################################################################################################
## Synthesis Flow
####################################################################################################

# Step 1: Generic Synthesis (RTL → generic gates)
set_db / .syn_generic_effort $GEN_EFF
syn_generic

# Step 2: Mapping (generic gates → technology-mapped cells)
set_db / .syn_map_effort $MAP_OPT_EFF
syn_map

# Step 3: Optimization (timing/power/area improvements)
set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt


## DFT Scan Chain Insertion

check_dft_rules

set_db design:counter .dft_min_number_of_scan_chains 1

define_scan_chain -name top_chain -sdi scan_in -sdo scan_out -create_ports

connect_scan_chains -auto_create_chains

syn_opt -incr


####################################################################################################
## Write Netlist and DFT Outputs
####################################################################################################

# Write mapped Verilog netlist
write_hdl $DESIGN -mapped >> ./Netlist/${DESIGN}_map.v

# Report scan chain configuration
report_scan_chains

# Write ATPG (Automatic Test Pattern Generation) DFT data
# write_dft_atpg -library {/home/cc/HIRA_PD_cadence/COHORT3/Frontend/65_lp_libs/tcbn65lptc.lib}

write_dft_atpg -library [file join $base_path "65_lp_libs/tcbn65lptc.lib"]

# Write DFT-inserted netlist
write_hdl > outputs/counter_netlist_dft.v

# Write updated SDC constraints (with scan)
write_sdc > outputs/counter_sdc_dft.sdc

# Write delay annotation file for simulation
write_sdf -nonegchecks -edges check_edge -timescale ns -recrem split -setuphold split > outputs/dft_delays.sdf

# Write scan DEF (for place & route tool usage)
write_scandef > outputs/counter_scanDEF.scandef


####################################################################################################
## Write Standard Outputs
####################################################################################################

# Generate Innovus constraints
write_sdc $DESIGN >> ./out/${DESIGN}_map.sdc

# Generate ModelSim delay file
write_sdf -design $DESIGN >> ./out/${DESIGN}_map.sdf

# Generate overall synthesis report (HTML)
report_metric -format html -file synthesis_report.html


####################################################################################################
## Reports
####################################################################################################

# Timing analysis report
report timing -full_pin_names >> ./RPT/${DESIGN}_timing.rpt

# Area utilization report
report area >> ./RPT/${DESIGN}_area.rpt

# Gates breakdown report
report gates >> ./RPT/${DESIGN}_gates.rpt

# Power estimation report
report power >> ./RPT/${DESIGN}_power.rpt

# Quality of Results report
report qor -levels_of_logic >> ./RPT/${DESIGN}_qor.rpt


####################################################################################################
## GUI (Optional)
####################################################################################################

# Launch GUI for interactive analysis
gui_show

# Exit tool after script completion (uncomment in batch mode)
## quit
