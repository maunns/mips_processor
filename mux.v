module mux #(parameter size = 32)(input[size-1:0] in1,in2, input sel, 
									output reg[size-1:0] out);
			always@(sel,in1,in2)
			case(sel)
			0: out = in1;
			1: out = in2;
			endcase
endmodule
