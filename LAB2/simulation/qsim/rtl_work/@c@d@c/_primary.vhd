library verilog;
use verilog.vl_types.all;
entity CDC is
    generic(
        DSIZE           : integer := 8;
        ASIZE           : integer := 4
    );
    port(
        rst_n           : in     vl_logic;
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        in_valid        : in     vl_logic;
        in_account      : in     vl_logic_vector;
        in_A            : in     vl_logic_vector;
        in_T            : in     vl_logic_vector;
        ready           : out    vl_logic;
        out_valid       : out    vl_logic;
        out_account     : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end CDC;
