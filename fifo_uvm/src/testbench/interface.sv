interface fifo_if (input bit clk );
   bit rst;
  logic wr_cs;
  logic rd_cs;
  logic wr_en;
  logic rd_en;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic full;
  logic empty;
  
  clocking out_mon_if @(posedge clk);
    default input #0 output #0;
    input data_out;
    input full;
    input empty;
  endclocking 
  
  clocking in_mon_if @ (posedge clk);
    default input #0 output #0;
    input rst;
    input wr_cs;
    input rd_cs;
    input wr_en;
    input rd_en;
    input data_in;
   endclocking 
   
   
  clocking drv_if @ (posedge clk);
    default input #0 output #0;
    output rst;
    output wr_cs;
    output rd_cs;
    output wr_en;
    output rd_en;
    output data_in;
   endclocking 
   
 
   
   
  modport drv ( clocking drv_if);
  modport out_mon (clocking out_mon_if);
  modport in_mon (clocking in_mon_if );
 // modport refer (clocking ref_if);  

endinterface
