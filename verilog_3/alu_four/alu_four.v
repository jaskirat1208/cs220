module test;
reg [3:0] a,b;
wire [3:0]res;
reg [1:0] opcode;
alu_four alu(opcode,a,b,res);
initial begin
	opcode=2'b00;
	a=4'b1101;
	b=4'b1010;
	$monitor(res);
	#100
	opcode=2'b01;
	$monitor(res);
	#100
	opcode=2'b10;
	$monitor(res);
	#100
	opcode=2'b11;
	$monitor(res);
	#100
	opcode=2'b01;
	$monitor(res);
	
end
endmodule

module alu_four(
		input wire [1:0] opcode,
		input wire [3:0] a,b,
		output wire [3:0] result
	);
	reg [3:0]res;
	//opcodes: 00 : and, 01 : or , 10 : add, 01 : sub
	always @(*) begin
		if (opcode==2'b00) 	begin
			res = a & b;	
		end 
		if (opcode==2'b01) 	begin
			res = a | b;	
		end 
		if (opcode==2'b10) 	begin
			res = a + b;	
		end 
		if (opcode==2'b11) 	begin
			res = a - b;	
		end 
		
	end
	assign result = res;
	// assign result = res;
endmodule