// decoder2x4.v, 2x4 decoder, gate synthesis
//
// how to compile: ~changw/ivl/bin/iverilog decoder1x2.v
// how to run: ./a.out

module DecoderMod(s1, s2, o0, o1, o2, o3); // module definition
   input s1, s2;
   output o0, o1, o2, o3;

   wire s1_inv, s0_inv;

   not(s1_inv, s1);
   not(s0_inv, s0);
   and(o0, s0_inv, s1_inv);
   and(o1, s0, s1_inv);
   and(o2, s1, s0_inv);
   and(o3, s1, s0);
   
endmodule

module TestMod; 
   reg s1, s2;
   wire o0, o1, o2, o3;       

   DecoderMod my_decoder(s1, s2, o0, o1, o2, o3); // create instance

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s2, o0, o1, o2, o3);
      $display("Time\ts1\ts2\to0\to1\to2\to3");
      $display("--------------------------");
   end

   initial begin
      s1 = 0; s2= 0;          // initially 00
      #1;
      s1 = 0; s2= 1;          // initially 01
      #1;
      s1 = 1; s2= 0;          // initially 10
      #1;
      s1 = 1; s2= 1;          // initially 11
      #1;
   end
endmodule
