module siso (input logic clk,input logic rst,input logic din ,output logic dout);
  logic [3:0] shift_reg;
  always @(posedge clk or posedge rst)begin
  if (rst)
   shift_reg <=4'b0;
    else
      shift_reg<={shift_reg[2:0],din};
  end
  assign dout = shift_reg[3];
endmodule
