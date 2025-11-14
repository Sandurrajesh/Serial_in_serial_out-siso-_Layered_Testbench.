class driver extends uvm_driver #(packet);

packet req;
virtual siso_if vif;

`uvm_component_utils(driver)

function new(string name="driver",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_name(),"THIS IS BUILD PHASE OF DRIVER",UVM_LOW)
 uvm_config_db#(virtual siso_if)::get(this, "", "vif", vif);
`uvm_info(get_name(), "Driver build_phase - got vif", UVM_LOW)
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS CONNECT_PHASE OF DRIVER",UVM_LOW)
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS END_OF_ELABORATIONO_PHASE OF DRIVER",UVM_LOW)
endfunction

task run_phase(uvm_phase phase);
  super.run_phase(phase);

  forever begin
    seq_item_port.get_next_item(req);

    @(posedge vif.clk);
    vif.din <= req.din; 
 
    `uvm_info("DRV", $sformatf("Driver sent din=%0d", req.din), UVM_LOW);

    seq_item_port.item_done();
  end
endtask
endclass
