class fifo_in_agent extends uvm_agent;

  `uvm_component_utils ( fifo_in_agent)
  
  fifo_driver drv;
  fifo_input_monitor in_mon;
  fifo_sequencer seq;
  fifo_config cfg;
  
  function new (string name = "fifo_in_agent", uvm_component parent);
    super.new (name , parent );
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase ( phase);
    if (!uvm_config_db # (fifo_config) :: get(this, " " ,"fifo_config" , cfg))

      `uvm_fatal ( get_type_name(),"in_agent_fail")
      

    in_mon=fifo_input_monitor :: type_id :: create ("in_mon" , this);
    
    if( cfg.input_agent_is_active == UVM_ACTIVE)
     begin
      drv= fifo_driver :: type_id :: create( "drv", this);
      seq= fifo_sequencer :: type_id :: create ("seq", this);
     end
   endfunction
   
   function void connect_phase ( uvm_phase phase);
super.connect_phase(phase);
    if (cfg.input_agent_is_active ==UVM_ACTIVE)
       begin
          drv.seq_item_port.connect ( seq.seq_item_export);
       end
   endfunction
   
endclass
 
 
