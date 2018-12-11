module register_file(input[4:0] add1, add2, addwr, input[31:0] datawr,
					input write_enable,clk, output reg [31:0] d1,d2);

reg [31:0] register [0:31];
integer i;

initial begin
 //register[0] <= 32'd1;
 //register[1] <= 32'd2;
for(i=0;i<32;i=i+1)
 register[i] <= 32'd0;
end
 
always@(posedge clk)
begin
	if(write_enable)
		register[addwr] <= datawr;
end

always@(add1,add2)
begin
	d1 <= register[add1];
	d2 <= register[add2];
end

endmodule
		
