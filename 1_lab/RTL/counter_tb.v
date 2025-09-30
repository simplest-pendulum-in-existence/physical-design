`timescale 1ns/1ps  

module counter_tb;

    reg clk;         
    reg reset;      
    wire [3:0] count;  


    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

`ifdef SDF_TEST
initial
begin
$sdf_annotate("/home/cc/hamza_mateen/6_module/1_lab");
end
`endif


  
    always #5 clk = ~clk;  

    initial begin
        
        clk = 0;
        reset = 0;

        
        reset = 1;
        #10;
        reset = 0;

     
        #100;

       
        
    end

    
    initial begin
        $monitor("At time %t, reset = %b, count = %b", $time, reset, count);
    end

endmodule

