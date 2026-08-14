vlog -sv +acc +cover +fcover -l simulation.log fifo_dut.v ram_dp_ar_aw.v interface.sv fifo_package.sv fifo_top.sv 


vsim -vopt work.fifo_top -voptargs=+acc=npr -assertdebug -l simulation.log -coverage -c -do "coverage save -onexit -assert -directive -cvg -codeAll fifo_uvm_coverage.ucdb; run -all; exit" 
