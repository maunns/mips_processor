module datapath(input clk, regWrite, memRead, memWrite, 
				memToReg, aluSrc, regDst, reset, input[1:0] pcSrc, input[2:0] aluOp,
				output[15:0] out, output[5:0] opcode, func, output zero,done);
				
	wire[31:0] ins, d1,d2, m2out, sign_out, alu_out, datamem_out, m3out;
	wire[4:0] addr1, add1,add2, m1out, add3;
	wire[15:0] add4;
	wire[6:0] pc, temp,pcmux2,pcmux3,pcmux4, pcplus4;
	//instruction_memory( input[5:0] pc, output reg ins[31:0]);
	instruction_memory_ba mem1(pc, ins);
	
	assign opcode = ins[31:26];
	assign addr1 = ins[25:21]; //dividing 32 bit output to respective inputs
	assign add2 = ins[20:16];
	assign add3 = ins[15:11];
	assign add4 = ins[15:0];
	assign func = ins[5:0];
	//mux #(parameter size = 32)(input[size-1:0] in1,in2, input sel, 
		//							output reg[size-1:0] out);
	
	/////////mux #(5) m0(addr1, user_in, user_switch, add1);///////////////////
	mux #(5) m1(add2,add3, regDst, m1out);
	//register_file(input[4:0] add1, add2, addwr, input[31:0] datawr, 
	//input write_enable,clk, output reg [31:0] d1,d2);
	register_file mem2(addr1,add2,m1out,m3out,regWrite,clk, d1,d2);
	assign out = d1[15:0];
	assign done = d2[0];
	
	assign sign_out = {{16{add4[15]}}, {add4[15:0]}};  //sign extend
	mux #(32) m2(d2, sign_out, aluSrc, m2out);
	//module ALU(input[2:0] aluOp, input[31:0] op1,op2, output reg[31:0] out,
			//output reg zeroflag);
	ALU alu1(aluOp, d1, m2out, alu_out, zero);
	//module data_memory(input [31:0] rd_add, wr_add, wr_data, input memRead, clk
					//output reg [31:0] data);
	data_memory_ba mem3(alu_out, alu_out, d2,memRead,clk,memWrite, datamem_out);
	mux #(32) m3(datamem_out, alu_out, memToReg, m3out);
	
	assign pcplus4 = pc + 7'd4;
	assign temp = sign_out[6:0];
	assign pcmux2 = (pcplus4 + {temp, 2'b00}); 
	assign pcmux3 = d1[6:0];
	assign pcmux4 =   ({{{6{ins[25]}}, {ins[25:0]}} , 2'b00} + pcplus4);
	//module program_counter(input[5:0] a,b,c,d, input[1:0] sel, output[5:0] pc);
	program_counter pc1(pcplus4,pcmux2,pcmux3,pcmux4, pcSrc,reset,clk,pc);
	
	
endmodule
