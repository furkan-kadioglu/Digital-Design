`timescale 1 ns/1 ns

module TestBench();
reg rt, ct, gt, pt;
wire out_test;

exp_1 compToTest(out_test, rt, ct, pt, gt);

initial 
    begin

    $dumpfile("test.vcd");
    $dumpvars(0,out_test, rt, ct, pt, gt);


    rt <= 0; ct <= 0; gt <= 0; pt <= 0; #10 //0 should be 0
    rt <= 0; ct <= 0; gt <= 0; pt <= 1; #10 //1 should be 0
    rt <= 0; ct <= 0; gt <= 1; pt <= 0; #10 //2 should be 0
    rt <= 0; ct <= 0; gt <= 1; pt <= 1; #10 //3 should be 0

    rt <= 0; ct <= 1; gt <= 0; pt <= 0; #10 //4 should be 0
    rt <= 0; ct <= 1; gt <= 0; pt <= 1; #10 //5 should be 0
    rt <= 0; ct <= 1; gt <= 1; pt <= 0; #10 //6 should be 1
    rt <= 0; ct <= 1; gt <= 1; pt <= 1; #10 //7 should be 1

    rt <= 1; ct <= 0; gt <= 0; pt <= 0; #10 //8 should be 0
    rt <= 1; ct <= 0; gt <= 0; pt <= 1; #10 //9 should be 0
    rt <= 1; ct <= 0; gt <= 1; pt <= 0; #10 //10 should be 1
    rt <= 1; ct <= 0; gt <= 1; pt <= 1; #10 //11 should be 0

    rt <= 1; ct <= 1; gt <= 0; pt <= 0; #10 //12 should be 1
    rt <= 1; ct <= 1; gt <= 0; pt <= 1; #10 //13 should be 0
    rt <= 1; ct <= 1; gt <= 1; pt <= 0; #10 //14 should be 1
    rt <= 1; ct <= 1; gt <= 1; pt <= 1; #10 //15 should be 1

    $finish;
    end

endmodule