library verilog;
use verilog.vl_types.all;
entity rptr_empty is
    generic(
        ASIZE           : integer := 4
    );
    port(
        rq2_wptr        : in     vl_logic_vector;
        rclk            : in     vl_logic;
        rst_n           : in     vl_logic;
        rinc            : in     vl_logic;
        rptr            : out    vl_logic_vector;
        raddr           : out    vl_logic_vector;
        rempty          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end rptr_empty;
