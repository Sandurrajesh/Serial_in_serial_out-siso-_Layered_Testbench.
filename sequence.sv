class seqn extends uvm_sequence  #(packet);
  `uvm_object_utils(seqn)

  function new(string name = "seqn");
    super.new(name);
  endfunction

  task body();
    repeat(100)begin
       //`uvm_do(req)
    packet pkt;
    pkt = packet::type_id::create("pkt");
    start_item(pkt);
    assert(pkt.randomize());
    finish_item(pkt);
end

  endtask
endclass
