library verilog;
use verilog.vl_types.all;
entity PATTERN is
    generic(
        DSIZE           : integer := 8
    );
    port(
        rst_n           : out    vl_logic;
        clk1            : out    vl_logic;
        in_valid        : out    vl_logic;
        in_account      : out    vl_logic_vector;
        in_A            : out    vl_logic_vector;
        in_T            : out    vl_logic_vector;
        ready           : in     vl_logic;
        start_in        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
end PATTERN;
