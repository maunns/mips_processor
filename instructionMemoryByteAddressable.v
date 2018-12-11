module  instruction_memory_ba( input[6:0] pc, output [31:0] ins);

reg [7:0] memory [0:127];
reg[7:0] temp [0:3];
integer i;

initial begin
 
 memory[0] <= 8'h64;    //a
 memory[1] <= 8'h00;
 memory[2] <= 8'h00;
 memory[3] <= 8'h00;
 
 memory[4] <= 8'h00;
 memory[5] <= 8'h00;
 memory[6] <= 8'he0;
 memory[7] <= 8'h07;
 
 memory[8] <= 8'h00;  //done
 memory[9] <= 8'h00;
 memory[10] <= 8'h21;
 memory[11] <= 8'h00;
 
 memory[12] <= 8'h04;
 memory[13] <= 8'h00;
 memory[14] <= 8'he1;
 memory[15] <= 8'h07;
 
 memory[16] <= 8'h50;  //b
 memory[17] <= 8'h00;
 memory[18] <= 8'h42;
 memory[19] <= 8'h00;
 
 memory[20] <= 8'h08;
 memory[21] <= 8'h00;
 memory[22] <= 8'he2;
 memory[23] <= 8'h07;
 
 memory[24] <= 8'h00;
 memory[25] <= 8'h00;
 memory[26] <= 8'he0;
 memory[27] <= 8'h0b;

 memory[28] <= 8'h04;
 memory[29] <= 8'h00;
 memory[30] <= 8'he1;
 memory[31] <= 8'h0b;

 memory[32] <= 8'h08;
 memory[33] <= 8'h00;
 memory[34] <= 8'he2;
 memory[35] <= 8'h0b;

 memory[36] <= 8'h0b;
 memory[37] <= 8'h00;
 memory[38] <= 8'h23;
 memory[39] <= 8'h40;

 memory[40] <= 8'h05;
 memory[41] <= 8'h28;
 memory[42] <= 8'h02;
 memory[43] <= 8'h80;

 
 memory[44] <= 8'h04;
 memory[45] <= 8'h00;
 memory[46] <= 8'ha3;
 memory[47] <= 8'h44;

 
 memory[48] <= 8'h00;
 memory[49] <= 8'h20;
 memory[50] <= 8'h60;
 memory[51] <= 8'h80;

 memory[52] <= 8'h00;
 memory[53] <= 8'h00;
 memory[54] <= 8'h62;
 memory[55] <= 8'h80;
 
 memory[56] <= 8'h00;
 memory[57] <= 8'h10;
 memory[58] <= 8'h64;
 memory[59] <= 8'h80;

 memory[60] <= 8'hf9;
 memory[61] <= 8'hff;
 memory[62] <= 8'hff;
 memory[63] <= 8'h4b;

 //
 
 memory[64] <= 8'h02;
 memory[65] <= 8'h00;
 memory[66] <= 8'h43;
 memory[67] <= 8'h44;

 memory[68] <= 8'h01;
 memory[69] <= 8'h00;
 memory[70] <= 8'h02;
 memory[71] <= 8'h80;

 
 memory[72] <= 8'hf6;
 memory[73] <= 8'hff;
 memory[74] <= 8'hff;
 memory[75] <= 8'h4b;

 
 memory[76] <= 8'h01;
 memory[77] <= 8'h00;
 memory[78] <= 8'h21;
 memory[79] <= 8'h00;

 memory[80] <= 8'hf4;
 memory[81] <= 8'hff;
 memory[82] <= 8'hff;
 memory[83] <= 8'h4b;
 
 memory[84] <= 8'hfe;
 memory[85] <= 8'hff;
 memory[86] <= 8'h00;
 memory[87] <= 8'hfc;

 memory[88] <= 8'hfe;
 memory[89] <= 8'hff;
 memory[90] <= 8'hff;
 memory[91] <= 8'h4b;
 

//$readmemh("memory1.list", memory);
end
 
always@(pc)
begin
	 temp[0] <= memory[pc];
	 temp[1] <= memory[pc+1];
	 temp[2] <= memory[pc+2];
	 temp[3] <= memory[pc+3];
	 
end

assign ins = {temp[3], temp[2], temp[1], temp[0]};

	
endmodule
