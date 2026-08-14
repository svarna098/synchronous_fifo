class fifo_driver extends uvm_driver #(trans);

  `uvm_component_utils (fifo_driver)
  
  virtual fifo_if.drv vif;
  
  fifo_config cfg;
  
  
  function new ( string name = " fifo_driver" , uvm_component parent );
    super.new ( name , parent);
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase (phase);
    if (!uvm_config_db #(fifo_config) :: get (this,"","fifo_config",cfg))
     `uvm_fatal (get_type_name(),"input_driver failed")
  endfunction
  
  function void connect_phase ( uvm_phase phase);
    super.connect_phase (phase);
    vif =cfg.vif;
  endfunction
  
  task run_phase (uvm_phase phase);
    begin
    
     @(vif.drv_if);
       vif.drv_if.rst <=1'b1;
       
     @(vif.drv_if);
      vif.drv_if.rst <=1'b0;
      
    forever 
      begin
        seq_item_port.get_next_item (req);
        drive (req);
        seq_item_port.item_done();
	
      
    end
   end 
  endtask
  
  task drive (trans drv2dut);
    begin
     //repeat(1)
 @(vif.drv_if);
//@(vif.drv_if);
      
        vif.drv_if.wr_cs <= drv2dut.wr_cs;
        vif.drv_if.rd_cs <= drv2dut.rd_cs;
        vif.drv_if.wr_en <= drv2dut.wr_en;
        vif.drv_if.rd_en <= drv2dut.rd_en;
        vif.drv_if.data_in <= drv2dut.data_in;
 `uvm_info ("input_monitor", $sformatf("input_monitor : wr_cs=%d | wr_en =%d | rd_cs=%d | rd_en=%d | data_in =%d ",drv2dut.wr_cs ,drv2dut.wr_en , drv2dut.rd_cs , drv2dut.rd_en , drv2dut.data_in),UVM_NONE)
        
    end
  endtask
  
 endclass
  
  
   
