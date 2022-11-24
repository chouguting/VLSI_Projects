library verilog;
use verilog.vl_types.all;
entity sync_r2w is
    generic(
        ASIZE           : integer := 4
    );
    port(
        rptr            : in     vl_logic_vector;
        wclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        wq2_rptr        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end sync_r2w;
