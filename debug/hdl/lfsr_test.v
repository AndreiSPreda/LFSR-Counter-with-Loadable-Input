module lfsr_test;
localparam WIDTH = 8;
wire        clk;
wire        rst_n;
wire        load;
wire        cen;
wire [WIDTH-1:0]  data;
wire [WIDTH-1:0]  count;

ck_rst_tb #(.CK_SEMIPERIOD ('d10))
 i_ck_rst_tb(
.clk    (clk  ),
.rst_n  (rst_n)
);
generator_semnal #(.CK_SEMIPERIOD ('d10))
 i_generator_semnal (
.clk     (clk  ),
.rst_n   (rst_n),
.load    (load ),
.cen     (cen  ),
.data    (data)
);
lfsr i_lfsr(
.clk            (clk),
.data           (data),
.load           (load),
.cen            (cen),
.count          (count),
.rst_n          (rst_n)
);
    
endmodule