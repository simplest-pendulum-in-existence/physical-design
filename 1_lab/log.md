### The log

1. change the path in *script.tcl* via modular tcl commands
2. read and understand the *script.tcl* file and its purpose
3. TODO gotta read the [output](./extras/out_1.txt) from the "genus -f script.tcl" file
4. TODO understand the content and comment on .out/.*.sdf file.
5. change the path in *counter_tb.v* file to get _sdf annotations
6. *xrun -timescale 1ns/10ps counter_map.v counter_tb.v -v tcbn65lp.v -access +rwc -define SDF_TEST -mess -gui*
    - Explanation
    as much as I understand, with this, we actually are 
    testing the pre-mapped(via std::cells) design using the existing 
    testbench but the updated or calculated SDF file values. This way
    our design would be tested against desired golden reference.

