module dataplusctrl(input clk, reset, output[15:0] out,output done);

wire regWrite, memRead,memWrite,memToReg,aluSrc,regDst, zero, reset_dt;
wire[1:0] pcSrc;
wire[2:0] aluOp;
wire[5:0] opcode,func;

datapath dp(clk,regWrite, memRead, memWrite, 
				memToReg, aluSrc, regDst, reset_dt, pcSrc, aluOp,
				out, opcode, func, zero,done);

ctrl ct(zero, reset , opcode, func,
			 regWrite, memWrite,memRead, memToReg, aluSrc, regDst, 
				reset_dt,  pcSrc, aluOp);
				
endmodule
