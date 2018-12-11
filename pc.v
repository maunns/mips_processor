module program_counter(input[6:0] a,b,c,d, input[1:0] sel, input reset,clk, output[6:0] pc);

wire[6:0] temp;
mux4 #(7) m(a,b,c,d,sel, temp);

pcq p(pc, temp,reset,clk);

endmodule


module pcq(output reg[6:0] pc, input[6:0] in,input reset,clk);


always@(posedge clk)
	if(reset)
	pc = 7'd0;
	else
	pc = in;
endmodule

module mux4#(parameter size = 7)(input[size-1:0] a,b,c,d, input [1:0] sel, output reg[size-1:0] out);

always@(a,b,c,d,sel)
case(sel)
0: out =a;
1: out = b;
2: out = c;
3: out = d;
endcase
endmodule

