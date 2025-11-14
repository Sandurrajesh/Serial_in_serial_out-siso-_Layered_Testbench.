class monitor extends uvm_monitor;
`uvm_component_utils(monitor)
packet tr;
virtual siso_if vif;
uvm_analysis_port #(packet) a_port;

function new(string name="monitor",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
a_port=new("a_port",this);
`uvm_info(get_name(),"THIS IS BUILD_PHASE OF MONITOR",UVM_LOW)
uvm_config_db#(virtual siso_if)::get(this, "", "vif", vif);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS CONNECT_PHASE OF MONITOR",UVM_LOW)
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS END_OF_ELABORATION_PHASE OF MONITOR",UVM_LOW)
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);
  forever begin
    @(posedge vif.clk);
    #10;  

    tr = packet::type_id::create("tr", this);

    tr.din  = vif.din;
    tr.dout = vif.dout;

    `uvm_info(get_name(), $sformatf("Monitor observed: din=%0d dout=%0d", tr.din, tr.dout), UVM_LOW);

    a_port.write(tr);
    $display("the value of coverage",$get_coverage());
  end
endtask
endclass
