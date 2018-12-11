module ALU(input[2:0] aluOp, input[31:0] op1,op2, output reg[31:0] out,
			output reg zeroflag);
			
			initial begin
			zeroflag = 1'b0;
			end
			always@(aluOp, op1,op2)
			begin
			zeroflag <= (op1 - op2 == 32'd0);
				case(aluOp)
				3'd0:  out <= op1 + op2;  
				3'd1:  out <= op1 - op2;  
				3'd2:  out <= op1 | op2;
				3'd3:  out <= op1 ^ op2;
				3'd4:  out <= op1 & op2;
				3'd5:  out <= op1 < op2;
				3'd6: begin
						if(op1[31] & op2[31])
						out <= op1 > op2;
						else if(~op1[31] & ~op2[31])
						out <= op1 < op2;
						else if(op1[31] & ~op2[31])
						out <= 32'd1;
						else
						out <= 32'd0;
					end
				3'd7 : out <= op1+op2;
				endcase
			end
endmodule
				