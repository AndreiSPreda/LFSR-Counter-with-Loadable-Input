module lfsr #(parameter WIDTH = 8)(
input                     clk,
input [WIDTH-1:0]         data,
input                     rst_n,
input                     load,
input                     cen,
output reg [WIDTH-1:0]    count
);

always @(posedge clk or posedge rst_n) begin
    //count = 2 cand reset e 0
    if (~rst_n) count <= 8'd2;
    //data xor count
    else if (~load) count <= data ^ count;
    //count = count[2] xor count [0]
    else if (cen) count <={count[WIDTH-2:0], count[2] ^ count[0]};
    //count e in standby
    else count<=count;
end
endmodule
