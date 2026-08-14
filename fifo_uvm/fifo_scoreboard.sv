class fifo_scoreboard extends uvm_scoreboard;
  `uvm_component_utils (fifo_scoreboard)
  uvm_tlm_analysis_fifo # (trans) in_mon_fifo;
  uvm_tlm_analysis_fifo # (trans) out_mon_fifo;
  
//  virtual fifo_if.refer vif;
  trans in_mon_sc;
  trans out_mon_sc;
 bit [7:0] temp [$:255];
  bit [7:0] exp ;
	bit valid;
  
  function new ( string name= "fifo_scoreboard", uvm_component parent);
    super.new ( name , parent);
    in_mon_fifo =new (" in_mon_fifo",this);
     // `uvm_info ("reference_model",$sformatf("reference_model: \n %s",in_mon_sc.sprint()),UVM_NONE)
    out_mon_fifo =new ( "out_mon_fifo",this);
  endfunction
  
  task run_phase (uvm_phase phase);
    forever begin
    
    in_mon_fifo.get(in_mon_sc);
	ref_model(in_mon_sc);
     // `uvm_info ("reference_model",$sformatf("reference_model \n%s",in_mon_sc.sprint()),UVM_NONE)
        `uvm_info ("before reference_model",$sformatf("reference_model: wr_sc= %d | wr_en = %d | rd_cs=%d | rd_en =%d | data_in =%d  ",in_mon_sc.wr_cs ,in_mon_sc.wr_en ,in_mon_sc.rd_cs ,in_mon_sc.rd_en , in_mon_sc.data_in ),UVM_NONE);

   //  #10;
    out_mon_fifo.get(out_mon_sc);
	 check_data (out_mon_sc);
       `uvm_info ("output_data",$sformatf("output_data \n",out_mon_sc.sprint()),UVM_NONE)
          
  //  ref_model(in_mon_sc);
     // `uvm_info ("reference_model",$sformatf("reference_model \n%s",in_mon_sc.sprint()),UVM_NONE)
      //  `uvm_info ("before reference_model",$sformatf("reference_model: wr_sc= %d | wr_en = %d | rd_cs=%d | rd_en =%d | data_in =%d  ",in_mon_sc.wr_cs ,in_mon_sc.wr_en ,in_mon_sc.rd_cs ,in_mon_sc.rd_en , in_mon_sc.data_in ),UVM_NONE);

  //  check_data (out_mon_sc);
       //`uvm_info ("output_data",$sformatf("output_data \n",out_mon_sc.sprint()),UVM_NONE)
    end
  endtask
  

  task check_data (trans ch);
//#10;
    begin
      if(in_mon_sc.data_out == ch.data_out)
        $display ("\n data_out is matching : dut data_out =%d ------ ref_data_out=%d | ", ch.data_out ,in_mon_sc.data_out);
      else
        $display ("\n data_out not matching : dut data_out =%d ------ ref_data_out=%d | ", ch.data_out ,in_mon_sc.data_out);
        
      if(in_mon_sc.full == ch.full)
        $display ("\n data_out is matching | dut_full=%d  ----ref_full=%d ",ch.full,in_mon_sc.full);
      else
        $display ("\n data_out not matching  dut_full=%d  ----ref_full=%d ",ch.full,in_mon_sc.full);
  
      if(in_mon_sc.empty == ch.empty)
        $display ("\n data_out is matching dut_empty=%d----ref_empty =%d ",ch.empty , in_mon_sc.empty);
      else
        $display ("\n data_out not matching dut_empty=%d----ref_empty =%d ",ch.empty , in_mon_sc.empty);
    end
  endtask
  
  virtual task ref_model (trans r);
	
    if(r.rst)
    begin
     r.data_out =8'd0;
      r.full =1'b0;
        r.empty =1'b1;
    end

   else 

	//if(valid==1'b1)
         //  r.data_out =exp;
            
	
        if(r.wr_cs && r.wr_en && temp.size()<256 ) begin
	
            temp.push_back (r.data_in);

	end
        
            if (r.rd_cs && r.rd_en && temp.size()>0) begin
		//@(vif.ref_if);
		//r.data_out =temp.pop_front();
              exp= temp.pop_front();
		 r.data_out =exp;

		// r.data_out =exp;
		//valid=1'b1;
		end
		//else
		//valid =1'b0;
		 // end
    
      // if(valid==1'b1)
          // r.data_out =exp;

      begin
       if ( temp.size()==0)  begin
            r.empty =1'b1;
            r.full = 1'b0;
	
 end
      
           
       else if ( temp.size() ==256 ) begin
            r.full =1'b1;
            r.empty=1'b0;
            end
	else begin
            r.full=1'b0;
	     r.empty=1'b0;end
      end
   
   endtask
   
 endclass       
      
          
          
          
          
          
