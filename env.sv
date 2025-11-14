class env extends uvm_env;
agent agt;
scoreboard scb;
 coverage cov; 
`uvm_component_utils(env)

function new(string name="env",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_name(),"THIS IS THE BUILD_PHASE OF ENV",UVM_LOW)
agt=agent::type_id::create("agt",this);
scb=scoreboard::type_id::create("scb",this);
cov = coverage::type_id::create("cov", this);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS CONNECT_PHASE OF ENV",UVM_LOW)
agt.mon.a_port.connect(scb.s_port);
agt.mon.a_port.connect(cov.analysis_export);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS END_OF_ELABORATION OF ENV",UVM_LOW)
endfunction

endclass
