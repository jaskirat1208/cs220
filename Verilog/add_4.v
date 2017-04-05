module test;
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0]sum;
	wire carry;
	wire [6:0]display;
	 bit_four_add adder(.a(a), .b(b),.sum(sum), .carry(carry));
	 tohex hex(.sum(sum), .display(display));
	initial begin
		#5
		a=4'b0000;
		b=4'b0000;
		$monitor(carry);
		#5
		a=4'b1011;
		b=4'b1011;
		$monitor(carry);
		#5
		a=4'b0101;																	/*four different test cases*/
		b=4'b0010;
		$monitor(display);
		#5
		a=4'b0110;
		b=4'b0111;
		$monitor(display);
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
module tohex(
	input[3:0] sum,
	output [6:0] display
	);
	reg [6:0] disp;
	always @(*) begin
		if (sum==4'b0000) begin
			disp = 7'b0000001;
		end	
		else if (sum==4'b0001) begin
			disp = 7'b1001111;
		end	
		if (sum==4'b0010) begin
			disp = 7'b0010010;
		end	
		if (sum==4'b0011) begin
			disp = 7'b0000110;
		end	
		if (sum==4'h4) begin
			disp = 7'b1001100;
		end	
		if (sum==4'h5) begin
			disp = 7'b0100100;
		end	
		if (sum==4'h6) begin
			disp = 7'b0100000;
		end
		if (sum==4'h7) begin
			disp = 7'b0100000;
		end	
		if (sum==4'h8) begin
			disp = 7'b0000000;
		end
		if (sum==4'h9) begin
			disp = 7'b0000100;
		end
		if (sum==4'hA) begin
			disp = 7'b0001000;
		end
		if (sum==4'hB) begin
			disp = 7'b1100000;
		end
		if (sum==4'hC) begin
			disp = 7'b0110001;
		end
		if (sum==4'hD) begin
			disp = 7'b1000010;
		end
		if (sum==4'hE) begin
			disp = 7'b0110000;
		end
		if (sum==4'hF) begin
			disp = 7'b0111000;
		end
	end
	assign display = disp;
	

endmodule