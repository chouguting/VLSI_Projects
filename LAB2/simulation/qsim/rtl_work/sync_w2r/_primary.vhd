library verilog;
use verilog.vl_types.all;
entity sync_w2r is
    generic(
        ASIZE           : integer := 4
    );
    port(
        wptr            : in     vl_logic_vector;
        rclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        rq2_wptr        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end sync_w2r;
