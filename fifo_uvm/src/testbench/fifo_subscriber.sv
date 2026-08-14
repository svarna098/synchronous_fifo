class fifo_sub extends uvm_subscriber # (trans);
 `uvm_component_utils (fifo_sub)

  trans sub;
  
 logic wr_cs;
  logic rd_cs;
  logic wr_en;
  logic rd_en;
  logic [7:0] data_in;

  covergroup cg ;
    a:coverpoint sub.data_in ;
    b:coverpoint sub.wr_cs ;
    c:coverpoint sub.wr_en;
    d:coverpoint sub.rd_en;
    e:coverpoint sub.rd_cs ;
   cross b,c;
   cross d,e;
  endgroup
 
 function new(string name="fifo_sub",uvm_component parent);
super.new(name,parent);
 cg=new();
`uvm_info(get_name,"[MONITOR]:INPUT RECIEVED",UVM_HIGH)
endfunction
 
function void report_phase(uvm_phase phase);
super.report_phase(phase);
    `uvm_info(get_name,$sformatf(" COVERAGE = %0f",cg.get_coverage()),UVM_NONE);
endfunction
 
function void write(trans t);
sub=t;
cg.sample();
endfunction
endclass


