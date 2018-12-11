module lab10(input reset, clk, user_switch, input[4:0] user_in, 
				output[6:0] display, output e1,e2,e3,e4,h);
				
 wire[15:0] out;
 
wire[1:0] c;					 
wire[3:0] m;
wire clk_100hz, clk_1hz;

wire resetd, done;


 dataplusctrl dpc( clk, resetd, out,done);
clock_con cc(clk_100hz,clk);

cycle c11(clk_100hz, c);
debounce db(clk,reset, resetd);


mux4 #(4) mu(out[15:12],out[11:8],out[7:4],out[3:0], c,m);
four_bit_seven convertor(display,h,m,done);

two_to_four_decoder_active_low dc1(e1,e2,e3,e4, c);


endmodule

module clock_con(aclk, clock);
		input clock;
		output   aclk;
		wire clk;
		wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
		wire w17, w18;
		wire t;
		assign t = 1'b1;


		tf t2( w1, t,clock);
		tf t3(w2 ,t,w1);
		tf t4( w3, t,w2);
		tf t5(w4, t,w3);
		tf t6( w5, t,w4);
		tf t7( w6, t,w5);
		tf t8( w7, t,w6);
		tf t9( w8, t,w7);
		tf t10( w9, t,w8);
		tf t11( w10, t,w9);
		tf t12( w11, t,w10);
		tf t13( w12, t,w11);
		tf t14( w13, t,w12);
		tf t15(w14, t,w13);
		tf t16(w15, t,w14);
		tf t17(w16, t,w15);
		tf t18(w17, t,w16);
		tf t19(w18,t,w17);
		tf t20(aclk , t,w18);

endmodule


module four_bit_seven(output reg[6:0] display, output h, input [3:0] bcd, input done);
		//                   abc_defg
		parameter BLANK = 7'b111_1111;
		parameter ZERO =  7'b000_0001;
		parameter n = 7'b110_1010;
		parameter ONE = 7'b100_1111;
		parameter TWO = 7'b001_0010;
		parameter THREE = 7'b000_0110;
		parameter FOUR = 7'b100_1100;
		parameter FIVE = 7'b010_0100;
		parameter SIX = 7'b010_0000;
		parameter SEVEN = 7'b000_1111;
		parameter EIGHT = 7'b000_0000;
		parameter NINE = 7'b000_0100;
		parameter o = 7'b110_0010;
		parameter ten = 7'b0001000;
		parameter eleven = 1100000;
		parameter twelve = 0110001;
		parameter thirteen = 1000010;
		parameter fourteen = 0110000;
		parameter fifteen = 0111000;

		always@(posedge done)
		case(bcd)

		0: display = ZERO;
		1: display = ONE;
		2: display = TWO;
		3: display= THREE;
		4: display= FOUR;
		5: display = FIVE;
		6: display = SIX;
		7: display = SEVEN;
		8: display = EIGHT;
		9: display = NINE;
		10: display = ten;
		11: display = eleven;
		12: display = twelve;
		13: display = thirteen;
		14: display = fourteen;
		15: display = fifteen;
		endcase
		assign h =1;

endmodule
 
 
module tf(q,t,clk);
		output q;
		input  t;
		input clk;
		
		reg q;
		initial begin 
			q=1'b1;
		   end
		 always @ (posedge clk)
			begin
						if (t==1'b0) begin q=q;  end
					   else begin q=~q;  end	 
			end
endmodule

 
module cycle(input clk, output reg[1:0] c);

		initial begin
		c =2'b0;
		end

		always@(posedge clk)
		begin
				if(c == 0)
				begin
				c<=1;
				end
				else if(c == 1)
				begin
				 c<=2;
				end 
				else if(c == 2)
				begin
				 c<=3;
				end
				else if(c == 3)
				begin
				 c<=0;
				end
			end 
endmodule

module clock_con2(aclk, clock);
		input clock;
		output aclk;

		wire w1,w2,w3,t;
		assign t = 1'b1;


		tf t1( w1, t,clock);
		tf t2(w2 ,t,w1);
		tf t3( w3, t,w2);
		tf t4(aclk , t,w3);

endmodule


  
module two_to_four_decoder_active_low(output d1,d2,d3,d4, input[1:0] sel);

		assign d1 = (sel[1]==0)? ((sel[0]==0)? 0 : 1) : 1;
		assign d2 = (sel[1]==0)? ((sel[0]==1)? 0 : 1) : 1;
		assign d3 = (sel[1]==1)? ((sel[0]==0)? 0 : 1) : 1;
		assign d4 = (sel[1]==1)? ((sel[0]==1)? 0 : 1) : 1;

endmodule

