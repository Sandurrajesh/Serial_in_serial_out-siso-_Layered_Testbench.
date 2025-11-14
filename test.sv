class test extends uvm_test;
env e;
seqn tr;
`uvm_component_utils(test)

function new(string name="test",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_name(),"THIS IS TEST BUILD_PHASE",UVM_LOW)
e=env::type_id::create("env",this);
tr=seqn::type_id::create("tr",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS TEST CONNECT_PHASE",UVM_LOW)
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS TEST END_OF_ELABORATION_PHASE",UVM_LOW)
//factory.print();
uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection(this);
`uvm_info(get_name(),"RAISE OBJECTION",UVM_LOW)
  tr.start(e.agt.seq);
phase.phase_done.set_drain_time(this,500);
`uvm_info(get_name(),"DROP OBJECTION",UVM_LOW)
phase.drop_objection(this);
endtask
endclass
