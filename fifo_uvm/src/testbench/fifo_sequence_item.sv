class trans extends uvm_sequence_item;
  `uvm_object_utils(trans)
  rand bit rst;
  rand bit [7:0] data_in;
  rand bit wr_cs ;
  rand bit wr_en;
  rand bit rd_cs;
  rand bit rd_en;
  bit [7:0] data_out;
  bit full;
  bit empty;
  
  constraint c { soft (wr_cs ==wr_en);}
  constraint c1 { soft(rd_cs == rd_en);}
  constraint c2 { soft(wr_cs && wr_en) != (rd_cs && rd_en);}
  
  function new (string name="trans");
    super.new (name);
  endfunction
  
endclass
