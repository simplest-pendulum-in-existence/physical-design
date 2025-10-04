- Scan Insertion (Scan Chains)

- Scan chains are the most common DFT technique. They add extra logic to the design to allow for easier testing by controlling and observing internal signals of the circuit.

- In Genus, scan insertion happens as part of the DFT insertion step during RTL synthesis or place-and-route. It inserts scan flip-flops and establishes scan paths (chains) for easy shifting of test data through the circuit.

- Scan flip-flops are specialized flip-flops with an extra input (scan input) to allow for test vectors to be shifted in, and the results shifted out.

when is .sdc file used?

An SDC (Synopsys Design Constraints) file is used by electronic design automation (EDA) tools, including synthesis and place-and-route (P&R) tools, to define the timing requirements for a digital circuit. During synthesis, SDC files guide the tool to create an optimized netlist that meets specified clock speeds. In the place-and-route stage, SDC constraints influence the placement of logic gates and the routing of signals to achieve the desired performance.  


what is the unit of area reported by *report_area* command in Genus ? 
it is square micros or more precisely *micrometres*. 10 ^ -6

