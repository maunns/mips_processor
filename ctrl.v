module ctrl(input zeroflag, reset ,input[5:0] opcode, func,
			output reg regWrite, memWrite,memRead, memToReg, aluSrc, regDst, 
			output reset_dt, output reg[1:0] pcSrc, output reg[2:0] aluOp);
	initial begin
	regWrite <= 0;   
	memRead <= 0;
	memWrite <= 0;
	memToReg <= 1;
	aluSrc <= 0;
	regDst <= 1;
	pcSrc <= 2'b00;
	aluOp <= 3'b000;
	end
	
	assign reset_dt = reset;
	
	always@(opcode,func,zeroflag)
	case(opcode)
	6'b10_0000: begin
				regWrite <= 1;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 1;
				aluSrc <= 0;
				regDst <= 1;
				pcSrc <= 2'b00;
				case(func)
				6'b000000 : aluOp <= 3'b000; //add
				6'b000001 : aluOp <= 3'b001; //sub
				6'b000010 : aluOp <= 3'b010; //or
				6'b000011 : aluOp <= 3'b011; //xor
				6'b000100 : aluOp <= 3'b100; //and
				6'b000101 : aluOp <= 3'b101; //sltu
				6'b000110 : aluOp <= 3'b110; //slt
				default : aluOp <= 3'b111; //jr
				endcase
				end
	6'b01_0000: begin   //bneq
				regWrite <= 0;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 1;
				aluSrc <= 0;
				regDst <= 1;
				aluOp<=3'b000;
				case(zeroflag)
				1'b0: pcSrc <= 2'b01;
				1'b1: pcSrc <= 2'b00;
				endcase
				end
	6'b01_0001: begin  //beq
				regWrite <= 0;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 1;
				aluSrc <= 0;
				regDst <= 1;
				aluOp<=3'b000;
				case(zeroflag)
				1'b0: pcSrc <= 2'b00;
				1'b1: pcSrc <= 2'b01;
				endcase
				end
	6'b01_0010: begin //j
				regWrite <= 0;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 1;
				aluSrc <= 0;
				regDst <= 1;
				aluOp<=3'b000;
				pcSrc<=2'b11;
				end
	6'b00_0000: begin //addi
				regWrite <= 1;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 1;
				aluSrc <= 1;
				regDst <= 0;
				aluOp<=3'b000;
				pcSrc<=2'b00;
				end
	6'b00_0001: begin //sw
				regWrite <= 0;   
				memRead <= 0;
				memWrite <= 1;
				memToReg <= 1;
				aluSrc <= 1;
				regDst <= 0;
				aluOp<=3'b000;
				pcSrc<=2'b00;
				end
	6'b00_0010: begin //lw
				regWrite <= 1;   
				memRead <= 1;
				memWrite <= 0;
				memToReg <= 0;
				aluSrc <= 1;
				regDst <= 0;
				aluOp<=3'b000;
				pcSrc<=2'b00;
				end
	6'b11_1111: begin
				regWrite <= 0;   
				memRead <= 0;
				memWrite <= 0;
				memToReg <= 0;
				aluSrc <= 0;
				regDst <= 0;
				aluOp<=3'b000;
				pcSrc<=2'b00;
				end
	endcase
	
endmodule
