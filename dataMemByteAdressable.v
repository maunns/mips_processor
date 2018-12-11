module data_memory_ba(input [31:0] rd_add, wr_add, wr_data, input memRead, clk,
					memWrite, output [31:0] data);

reg[7:0] datamem [0:127];
reg[7:0] temp [0:3];
integer i;

initial begin
/*datamem[0] <= 8'hff;
datamem[1] <= 8'haa;
datamem[2] <= 8'h11;
datamem[3] <= 8'h77;

datamem[4] <= 8'hee;
datamem[5] <= 8'hbb;
datamem[6] <= 8'h33;
datamem[7] <= 8'hff;

datamem[8] <= 8'hef;
datamem[9] <= 8'hab;
datamem[10] <= 8'h13;
datamem[11] <= 8'h7f;*/

for(i=0;i<128;i=i+1)
 datamem[i] <= 8'd0;
end

always@(rd_add, memRead)
begin
	if(memRead)
	begin
	 temp[0] <= datamem[rd_add];
	 temp[1] <= datamem[rd_add+1];
	 temp[2] <= datamem[rd_add+2];
	 temp[3] <= datamem[rd_add+3];
	 end
end

	assign data = {temp[3],temp[2],temp[1],temp[0]};
	
always@(posedge clk)
begin
	if(memWrite)
	begin
		datamem[wr_add] <= wr_data[7:0];
		datamem[wr_add+1] <= wr_data[15:8];
		datamem[wr_add+2] <= wr_data[23:16];
		datamem[wr_add+3] <= wr_data[31:24];
	end
end

endmodule
