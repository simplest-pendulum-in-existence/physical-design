`timescale 1ns/1ps  

module counter_tb;

    reg clk;         
    reg reset;      
    reg SE;          
    reg scan_in;     
    wire [3:0] count;  
    wire scan_out;   


    // DUT
    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count),
        .SE(SE),
        .scan_in(scan_in),
        .scan_out(scan_out)
    );

    // Optional SDF
    `ifdef SDF_TEST
    initial begin
        $sdf_annotate("/home/cc/hamza_mateen/6_module/1_lab/counter.sdf", uut);
    end
    `endif

  
    // Clock
    always #5 clk = ~clk;  

    // Test Sequence
    initial begin
        clk = 0;
        reset = 0;
        SE = 0;
        scan_in = 0;

        // Reset
        reset = 1; #10; reset = 0;

        // -------- Functional Mode --------
        SE = 0;
        #50; // let counter count for a while

        // -------- Scan Mode Test --------
        SE = 1;
        // Shift in pattern "1010" (LSB first -> goes into count[0])
        scan_in = 1; #10; // first bit
        scan_in = 0; #10; // second bit
        scan_in = 1; #10; // third bit
        scan_in = 0; #10; // fourth bit

        // Hold for one clock to stabilize
        #10;

        // Back to functional mode
        SE = 0;
        #50;

        $finish;
    end

    // Monitor
    initial begin
        $monitor("At %0t ns: reset=%b SE=%b count=%b scan_in=%b scan_out=%b", 
                 $time, reset, SE, count, scan_in, scan_out);
    end

endmodule
