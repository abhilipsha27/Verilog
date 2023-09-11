`timescale 1ns / 1ps

//using jk ff
module master_slave_jk(input J,K,input clk,input reset,output Q,Qbar);
  wire Qm,Qmbar;
  wire J1,K1,clk_n,J2,K2;
  assign J1 = J & Qbar;
  assign K1 = K & Q;
  assign J2 = reset ? 0:J1;
  assign K2 = reset ? 1:K1;
  assign clk_n = ~clk;
  SR_FF master(J2,K2,clk,reset,Qm,Qmbar);
  SR_FF slave(Qm,Qmbar,clk_n,reset,Q,Qbar);
    
endmodule

module SR_FF( S, R, clk,  reset,  Q, Qbar);
    input S,R,clk,reset;
    output Q,Qbar;
    reg Q;
    assign Qbar = ~Q;
    always@(posedge clk) begin;
        if(reset) Q<=0;
        else begin
            case({S,R})
                2'b00:Q<=Q;
                2'b01:Q<=1'b0;
                2'b10:Q<=1'b1;
                2'b11:Q<=1'bx;
            endcase
        end
        
    end

endmodule


