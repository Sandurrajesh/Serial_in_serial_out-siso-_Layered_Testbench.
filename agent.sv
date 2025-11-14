class agent extends uvm_agent;
driver drv;
sequencer seq;
monitor mon;

`uvm_component_utils(agent)

function new(string name="agent",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_name(),"THIS IS BUILD PHASE OF AGENT",UVM_LOW)
drv=driver::type_id::create("drv",this);
mon=monitor::type_id::create("mon",this);
seq=sequencer::type_id::create("seq",this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS CONNENCT PHASE OF AGENT",UVM_LOW)
drv.seq_item_port.connect(seq.seq_item_export);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS END_OF_ELABORATION PHASE OF AGENT",UVM_LOW)
endfunction

endclass
