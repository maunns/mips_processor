module debounce(input clk, sw,  output reg status);
reg[17:0] sum=0; 
reg temp;
initial begin
	status = 1'b0;
	end
always@(posedge clk)
begin
	
	if(!status)
	begin
		if(!sw)
			sum =0;
		if(sw)
			sum = sum + 1;
	end
	else begin
		if(sw)
			sum =0;
		if(!sw)
			sum = sum + 1;
	end
	if (sum == 18'd250_000)
		status=~status;
	else
		status=status;
end

endmodule