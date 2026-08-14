class fifo_sequence extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence)

   function new ( string name="fifo_sequence");
	super.new (name);
   endfunction

   task body ();
	repeat(10) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize());
	finish_item(req);
end
     end
`uvm_info(get_type_name(), "--------------Sequence  completed---------------", UVM_LOW)
   endtask

endclass

class fifo_sequence1 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence1)

   function new ( string name="fifo_sequence1");
	super.new (name);
   endfunction

   task body ();
	repeat(2) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b0 ; wr_en==1'b0 ;rd_cs==1'b1 ; rd_en==1'b1;});
	finish_item(req);
     end
     end
`uvm_info(get_type_name(), "---------------Sequence 1 completed------------------", UVM_LOW)
   endtask

endclass
 
class fifo_sequence2 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence2)

   function new ( string name="fifo_sequence2");
	super.new (name);
   endfunction

   task body ();
	repeat(5) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b1 ; wr_en==1'b1 ;rd_cs==1'b1 ; rd_en==1'b1;});
	finish_item(req);
end
     end
    `uvm_info(get_type_name(), "--------------Sequence 2 completed-----------------", UVM_LOW)
   endtask

endclass

class fifo_sequence3 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence3)

   function new ( string name="fifo_sequence3");
	super.new (name);
   endfunction

   task body ();
	repeat(5) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b1 ; wr_en==1'b1 ;rd_cs==1'b0 ; rd_en==1'b0;});
	finish_item(req);
end
     end
    `uvm_info(get_type_name(), "-------------------Sequence 3 completed---------------", UVM_LOW)
   endtask

endclass

class fifo_sequence4 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence4)

   function new ( string name="fifo_sequence4");
	super.new (name);
   endfunction

   task body ();
	repeat(6) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b0 ; wr_en==1'b0 ;rd_cs==1'b1 ; rd_en==1'b1;});
	finish_item(req);
end
     end
     `uvm_info(get_type_name(), "--------------Sequence 4 completed--------------", UVM_LOW)
   endtask
endclass

class fifo_sequence5 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence5)

   function new ( string name="fifo_sequence5");
	super.new (name);
   endfunction

   task body ();
	repeat(259) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b1 ; wr_en==1'b1 ;rd_cs==1'b0 ; rd_en==1'b0;});
	finish_item(req);
end
     end
     `uvm_info(get_type_name(), "--------------Sequence 5 completed--------------", UVM_LOW)
   endtask
endclass

class fifo_sequence6 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence6)

   function new ( string name="fifo_sequence6");
	super.new (name);
   endfunction

   task body ();
	repeat(259) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b0 ; wr_en==1'b0 ;rd_cs==1'b1 ; rd_en==1'b1;});
	finish_item(req);
end
     end
     `uvm_info(get_type_name(), "--------------Sequence 6 completed--------------", UVM_LOW)
   endtask
endclass

class fifo_sequence7 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence7)

   function new ( string name="fifo_sequence7");
	super.new (name);
   endfunction

   task body ();
	repeat(259) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b1 ; wr_en==1'b0 ;rd_cs==1'b0 ; rd_en==1'b1;});
	finish_item(req);
end
     end
     `uvm_info(get_type_name(), "--------------Sequence 6 completed--------------", UVM_LOW)
   endtask
endclass

class fifo_sequence8 extends uvm_sequence #(trans);
  `uvm_object_utils (fifo_sequence8)

   function new ( string name="fifo_sequence8");
	super.new (name);
   endfunction

   task body ();
	repeat(257) begin
	trans req;
	req = trans ::type_id::create ("req");
     begin
	for (int i=0 ;i<=1;i=i+1) begin
	start_item(req);
	assert(req.randomize() with {wr_cs ==1'b0 ; wr_en== i ;rd_cs==i ; rd_en==1'b0;});
	finish_item(req);
        end
end
     end
     `uvm_info(get_type_name(), "--------------Sequence 6 completed--------------", UVM_LOW)
   endtask
endclass

