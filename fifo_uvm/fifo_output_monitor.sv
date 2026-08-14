class fifo_out_monitor extends uvm_monitor ;
    
  `uvm_component_utils ( fifo_out_monitor)
  
  uvm_analysis_port #(trans) out_mon_port;
  
  virtual fifo_if .out_mon vif;
  fifo_config cfg;
  trans data_get;
  
  function new ( string name = " fifo_out_monitor", uvm_component parent);
    super.new( name , parent);
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase ( phase);
    if( !uvm_config_db #( fifo_config) :: get (this , "", "fifo_config", cfg))
      `uvm_fatal ( get_type_name()," out_monitor fail " )
      
    out_mon_port = new ("out_mon_port", this);
  endfunction
  
  function void connect_phase ( uvm_phase phase);
    super.connect_phase ( phase);
    vif=cfg.vif;
  endfunction
  
  task run_phase (uvm_phase phase);
   // data_get = trans::type_id::create ("data_get");
    forever  begin
data_get = trans::type_id::create ("data_get");
      collect_data();
	
     `uvm_info ("fifo_out_monitor " , $sformatf("fifo_out_monitor : data_out=%d | full=%d | empty =%d ",data_get.data_out , data_get.full , data_get.empty),UVM_NONE)
    end
  endtask
  
  virtual task collect_data();
   // begin
 //   repeat (2)
    @(vif.out_mon_if);
     // @(vif.out_mon_if);

      begin
        data_get.data_out = vif.out_mon_if.data_out;
        data_get.full = vif.out_mon_if.full;
        data_get.empty = vif.out_mon_if.empty;
     end
       out_mon_port.write (data_get);
    // end
  endtask
  
endclass
    
   
