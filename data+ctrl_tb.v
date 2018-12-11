module zz_both_tb;


reg clk, reset;
wire[15:0] out;

initial begin
clk=0;
forever #5 clk = ~clk;
end

dataplusctrl tb( clk,reset,out,done);

initial begin


reset=1;
#22

reset = 0;
#2200
$stop;
end
endmodule