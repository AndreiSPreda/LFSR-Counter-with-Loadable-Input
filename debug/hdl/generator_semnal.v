module generator_semnal 
#(parameter CK_SEMIPERIOD = 'd10,
parameter WIDTH = 8)
(
    input                clk,
    input                rst_n,
    output reg           load,
    output reg           cen,
    output reg  [WIDTH-1:0]    data

);
initial
begin

    load <= 1'b1;
    cen <=1'b1;
    data <= 8'b0;
    @(posedge clk);
    repeat(10) @(posedge clk);
    cen <= 1'b0;
    repeat(3) @(posedge clk);
    cen <=1'b1;
    repeat(6) @(posedge clk);
    $stop;

end
endmodule

