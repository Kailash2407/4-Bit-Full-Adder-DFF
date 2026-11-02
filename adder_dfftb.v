
module adder_dfftb;

reg [3:0] A, B;
reg Cin, clk, rst;
wire [4:0] Q;

adder_dff uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .clk(clk),
    .rst(rst),
    .Q(Q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("Time=%0t A=%b B=%b Cin=%b | Q=%b",
             $time, A, B, Cin, Q);

    rst = 1;
    A = 0; B = 0; Cin = 0;
    #10;

    rst = 0;

    A = 4'b0011; B = 4'b0010; Cin = 0;
    #10;

    A = 4'b0101; B = 4'b0011; Cin = 0;
    #10;

    A = 4'b1111; B = 4'b0001; Cin = 0;
    #10;

    A = 4'b1010; B = 4'b0101; Cin = 1;
    #10;

    A = 4'b1111; B = 4'b1111; Cin = 1;
    #10;

    $finish;
end

endmodule
