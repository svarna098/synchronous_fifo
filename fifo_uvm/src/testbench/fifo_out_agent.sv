class fifo_out_agent extends uvm_agent;
  `uvm_component_utils (fifo_out_agent)
  
  fifo_out_monitor out_mon;
  fifo_config cfg;
  
  function new ( string name = "fifo_out_monitor", uvm_component parent );
    super.new (name , parent );
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase (phase);
    if(!uvm_config_db # (fifo_config) :: get (this , "" , "fifo_config" , cfg))
      `uvm_fatal ( get_type_name()," output_monitor fail")
      
    if (cfg.output_agent_is_active ==UVM_PASSIVE)
     // begin
        out_mon=fifo_out_monitor :: type_id :: create("out_mon",this);
   //  end
   endfunction
   
 endclass
 
 
  
