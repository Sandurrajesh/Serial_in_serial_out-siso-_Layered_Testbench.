class packet extends uvm_sequence_item;
  rand bit din;
  bit dout;

`uvm_object_utils_begin(packet)
    `uvm_field_int(din, UVM_ALL_ON)
    `uvm_field_int(dout, UVM_ALL_ON)
  `uvm_object_utils_end

 function new(string name = "packet");
    super.new(name);
  endfunction

 endclass
