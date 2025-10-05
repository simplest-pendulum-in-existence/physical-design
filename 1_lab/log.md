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

    -   iteration 2 =>  812



##### Understanding script.tcl
- uses v2001
- set path to project root
- search and accumulate .lib files provided in said path

In design settings: 
    set design top module name (counter).
    set the synthesis (generic) and mapping effort to "high" 
        this means that Genus would try to spend more time 
        and compute power to come up with highly optimized design
        mapping of standard cells from generalized netlist/module.

elaborating design:
    - read the *.v file (v2001 verilog version)
    - read 

##### Understanding constraints.sdc






# learning about the idea of ATPG 

Test vector generation stuck at a fault means the Automatic Test Pattern Generation (ATPG) process cannot find the necessary test vectors to detect all the stuck-at faults in a circuit, often because the circuit is large or complex, specific faults are hard to detect, or a combination of ATPG algorithms and other techniques (like fault simulation or branch-and-bound) are required to cover more faults or complete the process efficiently. 

Reasons for Stuck Vector Generation

Inadequate ATPG Algorithms: While some ATPG algorithms like D-algorithm, PODEM, and FAN are efficient, they are not sufficient for complex circuits and must be combined with fault grading mechanisms and other advanced techniques to cover all faults, according to a report on Springer. 

Stuck-Open Faults in CMOS: The standard stuck-at fault model is not fully effective for CMOS logic, as stuck-open faults can occur and are not reliably detected by a single test vector, necessitating sequential application of two vectors, notes the Wikipedia page on Stuck-at Fault. 

Bridging Faults: The stuck-at fault model also fails to detect bridging faults, where adjacent signal lines are shorted together, which is another common type of defect in digital circuits. 

Solutions to Address the Issue

Advanced ATPG Algorithms: Employing advanced ATPG techniques that utilize the Boolean difference theory, or combining algorithms with genetic algorithms, can help find minimal sets of test vectors, says this paper on ResearchGate. 

Fault Collapsing: Grouping equivalent faults into a single representative fault to reduce the number of faults that need to be detected can simplify the test generation process, explains a YouTube video on VLSI testing. 

Design for Testability (DFT): Incorporating testability features into the circuit design itself can make it easier to detect faults, for example, by adding specific scan chains to improve test vector generation and coverage, notes this paper on ResearchGate. 


# this is the end!
The idea of infinite regress ?

so if we assume the underlying system that churns out more complexity that it contains within, then does it not lead us to a system which consistently has lesser compute power then the system it produces.  If it is so, then it should lead to equally terrifying scenario where everything comes out of nothing. Infinite regress in both directions is a horrifying idea or at least paradoxical.


xrun -timescale 1ns/10ps counter_map.v counter_tb.v -v /home/cc/Desktop/PD/PDK_files/tcbn65lp.v -access +rwc -define SDF_TEST -mess – gui