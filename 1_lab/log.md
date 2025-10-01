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

7. After new mapping is done to *_map file, the testbench must be updated to get 
   updated DFT based design simulation in Xcelium.
8. The slack for this design is: ~6819. check in [file](./RPT/counter_timing.rpt)
9. Now, to reduce this slack, i have to manipulate the timining parameters provided
   in [file](./constraints/counter.sdc)

   - iteration 1 => slack : 6819
10. reading [this article on STA constructs in order to improve my guesses](https://medium.com/@Dhruvkumar_Vyas_VLSI/slack-skew-and-slew-in-vlsi-6025bc928941)

    -   if the data traverses the datapath in less than the *Required Arrival Time (RAT)*
        then it is safe and can capture the next clock edge. This time at which it 
        completely traverses the path, it is called *Actual Arrival Time (AAT)*.

        slack then is: slack = RAT - AAT  (if +ve, the data is safely driven)

    -   from this, i can already see that our critical datapath is way shorter
        then we have allocated the clock time for it; which implies that to reduce
        the *slack*, i simply need to reduce the clock duration.
   
    -   small side note: the value 6819 is given in picoseconds which amounts to
        roughly ~6.8ns, this means I need to reduce my clock cycle by a good factor 
        because this much time through a cycle is being internally wasted waiting for 
        next clock edge only. let's see!

    -   iteration 2 =>  