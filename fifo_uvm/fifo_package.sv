package fifo_package;
	 `include "uvm_macros.svh"
  import uvm_pkg ::*;
       
	`include "fifo_sequence_item.sv"
	`include "fifo_config.sv"
	`include "fifo_driver.sv"
	`include "fifo_in_monitor.sv"
	`include "fifo_sequencer.sv"
	`include "fifo_in_agent.sv"
	`include "fifo_output_monitor.sv"
	`include "fifo_out_agent.sv"
	`include "fifo_scoreboard.sv"
        `include "fifo_subscriber.sv"
	`include "fifo_environment.sv"
	`include "fifo_sequence.sv"
	`include "fifo_test.sv"

endpackage
