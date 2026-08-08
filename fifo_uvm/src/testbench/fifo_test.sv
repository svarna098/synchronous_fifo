class fifo_test extends uvm_test;
  `uvm_component_utils (fifo_test)
  
  fifo_environment env;
  fifo_config cfg;
  
  function new ( string name="fifo_test", uvm_component parent);
    super.new ( name , parent);
  endfunction
  
  function void build_phase ( uvm_phase phase);
    super.build_phase(phase);
    
    cfg= fifo_config::type_id::create("cfg");
    
    if(!uvm_config_db #(virtual fifo_if )::get (this,"" , "fifo_if", cfg.vif))
     `uvm_fatal (get_type_name(),"can't connect interface")
     
    cfg.input_agent_is_active =UVM_ACTIVE;
     cfg.output_agent_is_active =UVM_PASSIVE;
     
     uvm_config_db #(fifo_config ):: set(this ,"*","fifo_config",cfg);
     
     env=fifo_environment :: type_id :: create ("env", this);
     
   endfunction

   function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
   uvm_top.print_topology();
endfunction
   
 endclass
 
 class test1 extends fifo_test;
  `uvm_component_utils (test1);
  
  fifo_sequence s;
  fifo_sequence1 s1;
  fifo_sequence2 s2;
  fifo_sequence3 s3;
  fifo_sequence4 s4;
   fifo_sequence5 s5;
  fifo_sequence6 s6;
   fifo_sequence7 s7;
    fifo_sequence8 s8;
  
  function new (string name="test1", uvm_component parent);
    super.new ( name , parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase ( phase);
  endfunction
  
  task run_phase ( uvm_phase phase);
    phase.raise_objection (this);
     s=fifo_sequence ::type_id::create ("s");
     s1=fifo_sequence1 ::type_id::create ("s1");
     s2=fifo_sequence2 ::type_id::create ("s2");
     s3=fifo_sequence3 ::type_id::create ("s3");
     s4=fifo_sequence4 ::type_id::create ("s4");
   s5=fifo_sequence5 ::type_id::create ("s5");
    s6=fifo_sequence6 ::type_id::create ("s6");
    s7=fifo_sequence7 ::type_id::create ("s7");
    s8=fifo_sequence8 ::type_id::create ("s8");
    fork
      begin
        s.start (env.in_agnt.seq);
	s1.start (env.in_agnt.seq);
	s2.start (env.in_agnt.seq);
	s3.start (env.in_agnt.seq);
	s4.start (env.in_agnt.seq);
       s5.start (env.in_agnt.seq);
        s6.start (env.in_agnt.seq);
	  s7.start (env.in_agnt.seq);
          s8.start (env.in_agnt.seq);
      end
    join
   #50;
   phase.drop_objection(this);
  endtask
 endclass
 
