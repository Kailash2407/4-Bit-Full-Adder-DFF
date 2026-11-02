
module adder_dff (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    input clk,
    input rst,
    output reg [4:0] Q
);

wire [4:0] sum;

// 4-bit Full Adder
assign sum = A + B + Cin;

// D Flip-Flop to store the result
always @(posedge clk or posedge rst)
begin
    if (rst)
        Q <= 5'b00000;
    else
        Q <= sum;
end

endmodule
