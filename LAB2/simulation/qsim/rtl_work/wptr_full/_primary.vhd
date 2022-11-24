library verilog;
use verilog.vl_types.all;
entity wptr_full is
    generic(
        ASIZE           : integer := 4
    );
    port(
        wq2_rptr        : in     vl_logic_vector;
        wclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        winc            : in     vl_logic;
        wptr            : out    vl_logic_vector;
        waddr           : out    vl_logic_vector;
        wfull           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end wptr_full;
