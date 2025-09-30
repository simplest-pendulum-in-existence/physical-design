- Scan Insertion (Scan Chains)

- Scan chains are the most common DFT technique. They add extra logic to the design to allow for easier testing by controlling and observing internal signals of the circuit.

- In Genus, scan insertion happens as part of the DFT insertion step during RTL synthesis or place-and-route. It inserts scan flip-flops and establishes scan paths (chains) for easy shifting of test data through the circuit.

- Scan flip-flops are specialized flip-flops with an extra input (scan input) to allow for test vectors to be shifted in, and the results shifted out.