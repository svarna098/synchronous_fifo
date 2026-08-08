class fifo_environment extends uvm_env;
  `uvm_component_utils (fifo_environment)
  
  fifo_in_agent in_agnt;
  fifo_out_agent out_agnt;
  fifo_scoreboard scb;
  fifo_config cfg;
  
  function new ( string name ="fifo_environment",uvm_component parent);
    super.new ( name, parent);
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase (phase);
    if(!uvm_config_db #(fifo_config) :: get (this , "", "fifo_config",cfg))
      `uvm_fatal (get_type_name(),"environment fail")
    
    in_agnt = fifo_in_agent :: type_id :: create ( "in_agnt", this);
    out_agnt = fifo_out_agent :: type_id :: create ("out_agnt", this);
    scb = fifo_scoreboard :: type_id :: create ("scb" , this);
  endfunction
  
  function void connect_phase ( uvm_phase phase);
    super.connect_phase(phase);
    in_agnt.in_mon.in_mon_port.connect (scb.in_mon_fifo.analysis_export);
    out_agnt.out_mon.out_mon_port.connect(scb.out_mon_fifo.analysis_export);
  endfunction
  
 endclass
    
