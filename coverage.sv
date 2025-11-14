class coverage extends uvm_subscriber #(packet);
  `uvm_component_utils(coverage)

  virtual siso_if vif;
  packet t;

  
   covergroup cg @(posedge vif.clk);
   coverpoint vif.din{bins b1 ={0};
                      bins b2 ={1}; }
   coverpoint vif.dout{ bins d1 ={0};
                        bins d2 ={1}; }
   cross vif.din,vif.dout;
   endgroup

  
  function new(string name = "coverage", uvm_component parent = null);
    super.new(name, parent);
    cg = new();
  endfunction


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

   uvm_config_db#(virtual siso_if)::get(this, "", "vif", vif);
 
  endfunction


  function void write(packet t);
   // pkt = t;
    cg.sample();
  endfunction

endclass : coverage
