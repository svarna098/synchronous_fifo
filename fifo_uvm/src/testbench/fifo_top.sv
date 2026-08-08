//`include "fifo_package.sv"
//`include "interface.sv"
//`include "fifo_dut.v"
//`include "ram_dp_ar_aw.v"
module fifo_top ();
  import uvm_pkg ::*;
  import fifo_package ::*;
   bit clk;
   fifo_if inf (clk);

// instantiate dut
   syn_fifo dut ( .clk(clk) , .rst(inf.rst), .wr_cs (inf.wr_cs),. rd_cs (inf.rd_cs) ,.data_in (inf.data_in),.rd_en (inf.rd_en) ,. wr_en (inf.wr_en),.data_out (inf.data_out),.empty(inf.empty),.full (inf.full));

   initial begin
      uvm_config_db # (virtual fifo_if) :: set (null,"*","fifo_if",inf);
       run_test ("test1");
   end


   initial begin
       clk=1'b0;
       
         forever
 #5 clk=~clk;
   end

endmodule
