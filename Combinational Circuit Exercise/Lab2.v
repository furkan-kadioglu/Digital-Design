module exp_1 (out,r,c,g,p);
    output out;
    input r,c,p,g;
    wire w1,w2,w2_1,w2_2,w2_2_1;

    //breadth-first
    or o1(out,w1,w2);
    
    and a1(w1,c,g);
    and a2(w2,w2_1,w2_2);
    
    or o2(w2_1,c,g);
    and a3(w2_2,w2_2_1,r);
    
    not n1(w2_2_1,p);

endmodule  