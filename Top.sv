module top;
import uvm_pkg::*;
`include "uvm_macros.svh"
import my_pkg::*;

 logic clk;

 initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  siso_if intf(clk);
  siso dut (.clk(clk),.rst(intf.rst),.din(intf.din),.dout(intf.dout)  );

initial begin
  uvm_config_db#(virtual siso_if)::set(null, "*", "vif", intf);
  run_test("test");
end


initial begin
  intf.rst = 1;
  #10 intf.rst = 0;
end

/*initial begin
    #200;
       $finish;
  end*/

    initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top);
  end
endmodule
