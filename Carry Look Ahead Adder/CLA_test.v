module CLA_test;
  reg [3:0]A, B; 
  reg Cin;
  wire [3:0] S;
  wire Cout;
  wire[4:0] add; 
  CLA dut(A, B, Cin, S, Cout);  
  assign add = {Cout, S};
  initial begin
    A = 4'b0000; B = 4'b0001; Cin = 1'b0; 
    #10;
    A = 4'b0010; B = 4'b0101; Cin = 1'b1; 
    #10;
    A = 4'b1011; B = 4'b0110; Cin = 1'b0; 
    #10;
    A = 4'b0101; B = 4'b0111; Cin = 1'b1;
    #10;
  end

endmodule                 
