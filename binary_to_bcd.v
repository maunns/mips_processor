module binary_to_bcd(output reg[3:0] tens,units, input[5:0] in,input done);
always@(posedge done)
begin
	case(in)
		6'h0 : begin tens<=0;units<=0;end
		6'h1 : begin tens<=0;units<=1;end
		6'h2 : begin tens<=0;units<=2;end
		6'h3 : begin tens<=0;units<=3;end
		6'h4 : begin tens<=0;units<=4;end
		6'h5 : begin tens<=0;units<=5;end
		6'h6 : begin tens<=0;units<=6;end
		6'h7 : begin tens<=0;units<=7;end
		6'h8 : begin tens<=0;units<=8;end
		6'h9 : begin tens<=0;units<=9;end
		6'ha : begin tens<=1;units<=0;end
		6'hb : begin tens<=1;units<=1;end
		6'hc : begin tens<=1;units<=2;end
		6'hd : begin tens<=1;units<=3;end
		6'he : begin tens<=1;units<=4;end
		6'hf : begin tens<=1;units<=5;end
		6'h10 : begin tens<=1;units<=6;end
		6'h11 : begin tens<=1;units<=7;end
		6'h12 : begin tens<=1;units<=8;end
		6'h13 : begin tens<=1;units<=9;end
		6'h14 : begin tens<=2;units<=0;end
		6'h15 : begin tens<=2;units<=1;end
		6'h16 : begin tens<=2;units<=2;end
		6'h17 : begin tens<=2;units<=3;end
		6'h18 : begin tens<=2;units<=4;end
		6'h19 : begin tens<=2;units<=5;end
		6'h1a : begin tens<=2;units<=6;end
		6'h1b : begin tens<=2;units<=7;end
		6'h1c : begin tens<=2;units<=8;end
		6'h1d : begin tens<=2;units<=9;end
		6'h1e : begin tens<=3;units<=0;end
		6'h1f : begin tens<=3;units<=1;end
		6'h20 : begin tens<=3;units<=2;end
		6'h21 : begin tens<=3;units<=3;end
		6'h22 : begin tens<=3;units<=4;end
		6'h23 : begin tens<=3;units<=5;end
		6'h24 : begin tens<=3;units<=6;end
		6'h25 : begin tens<=3;units<=7;end
		6'h26 : begin tens<=3;units<=8;end
		6'h27 : begin tens<=3;units<=9;end
		6'h28 : begin tens<=4;units<=0;end
		6'h29 : begin tens<=4;units<=1;end
		6'h2a : begin tens<=4;units<=2;end
		6'h2b : begin tens<=4;units<=3;end
		6'h2c : begin tens<=4;units<=4;end
		6'h2d : begin tens<=4;units<=5;end
		6'h2e : begin tens<=4;units<=6;end
		6'h2f : begin tens<=4;units<=7;end
		6'h30 : begin tens<=4;units<=8;end
		6'h31 : begin tens<=4;units<=9;end
		default: begin tens<=10;units<=10; end
	endcase
end

endmodule