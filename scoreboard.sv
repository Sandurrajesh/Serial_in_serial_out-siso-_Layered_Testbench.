class scoreboard extends uvm_scoreboard;
packet tr;
`uvm_component_utils(scoreboard)
uvm_analysis_imp #(packet,scoreboard) s_port;

bit [3:0] ref_model = 4'b0000;

function new(string name="scoreboard",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_name(),"THIS IS BUILD_PHASE OF SCOREBOARD",UVM_LOW)
s_port=new("s_port",this);
endfunction

function void write(packet tr);
     bit expected; 

  ref_model = {ref_model[2:0], tr.din};
  expected  = ref_model[3];

  if (tr.dout == expected)
    `uvm_info(get_name(), "PASS", UVM_LOW)
  else
    `uvm_error(get_name(), $sformatf("FAIL Expected=%0b Got=%0b", expected, tr.dout));
  endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
`uvm_info(get_name(),"THIS IS CONNECT_PHASE OF SOREBOARD",UVM_LOW)
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
`uvm_info(get_name(),"THIS IS END_OF_ELABORATION_PHASE OF SCOREBOARD",UVM_LOW)
endfunction

endclass
