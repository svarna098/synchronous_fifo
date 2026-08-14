class fifo_input_monitor extends uvm_monitor;
  `uvm_component_utils (fifo_input_monitor)
  
  uvm_analysis_port #(trans) in_mon_port;
  
  virtual fifo_if.in_mon vif;
  fifo_config cfg;
  trans drv2mon;
  
  function new (string name="fifo_input_monitor", uvm_component parent);
    super.new (name , parent );
	 in_mon_port = new ("in_mon_port",this);
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase (phase);
    if (!uvm_config_db #(fifo_config) ::get (this , "","fifo_config", cfg))
    `uvm_fatal (get_type_name(),"input monitor fail")

 
  endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect_phase ( phase);
    vif=cfg.vif;
  endfunction
  
  task run_phase (uvm_phase phase);
   // drv2mon = trans::type_id::create ("drv2mon");
    forever begin
	 drv2mon = trans::type_id::create ("drv2mon");
       collect_in_mon ();
      `uvm_info ("input_monitor", $sformatf("input_monitor : wr_cs=%d | wr_en =%d | rd_cs=%d | rd_en=%d | data_in =%d ",drv2mon.wr_cs ,drv2mon.wr_en , drv2mon.rd_cs , drv2mon.rd_en , drv2mon.data_in),UVM_NONE)
   end
endtask
   
   virtual task collect_in_mon ;
   
      begin
        //repeat (1)
          @(vif.in_mon_if);
          
        drv2mon.wr_cs = vif.in_mon_if.wr_cs;
        drv2mon.rd_cs = vif.in_mon_if.rd_cs;
        drv2mon.wr_en = vif.in_mon_if.wr_en;
        drv2mon.rd_en = vif.in_mon_if.rd_en;
        drv2mon.data_in =vif.in_mon_if.data_in;
        
        in_mon_port.write (drv2mon);
      end
  endtask
  
 endclass



