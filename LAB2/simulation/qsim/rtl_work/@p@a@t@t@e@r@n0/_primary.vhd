library verilog;
use verilog.vl_types.all;
entity PATTERN0 is
    generic(
        DSIZE           : integer := 8
    );
    port(
        rst_n           : in     vl_logic;
        clk2            : out    vl_logic;
        out_valid       : in     vl_logic;
        out_account     : in     vl_logic_vector;
        start_in        : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
end PATTERN0;
