module test;
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0]sum;
	wire carry;

	 bit_four_add adder(.a(a), .b(b),.sum(sum), .carry(carry));
	initial begin
		#5
		a=4'b1010;
		b=4'b0011;
		$monitor(sum);
		#5
		a=4'b0011;
		b=4'b0011;
		$monitor(sum);
		#5
		a=4'b0101;																	/*four different test cases*/
		b=4'b0010;
		$monitor(sum);
		#5
		a=4'b0110;
		b=4'b0111;
		$monitor(sum);
	end
endmodule
module bit_one_add(
		input wire cin,a,b,
		output wire carry,sum	
	);
	wire [1:0] sum1;
	assign sum1=cin+a+b;
	assign sum=sum1[0];
	assign carry = sum1[1];
endmodule



module bit_four_add(
	input [3:0] a,b,
	output [3:0] sum,
	output carry
	);
	wire c1,c2,c3,c4;
	bit_one_add adder(.a(a[0]), .b(b[0]), .cin(0),.sum(sum[0]), .carry(c1));
	bit_one_add addr(.a(a[1]), .b(b[1]), .cin(c1),.sum(sum[1]), .carry(c2));
	bit_one_add add(.a(a[2]), .b(b[2]), .cin(c2),.sum(sum[2]), .carry(c3));
	bit_one_add addi(.a(a[3]), .b(b[3]), .cin(c3),.sum(sum[3]), .carry(c4));
	assign  carry = c4;


endmodule