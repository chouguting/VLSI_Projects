library verilog;
use verilog.vl_types.all;
entity fifomem is
    generic(
        DSIZE           : integer := 8;
        ASIZE           : integer := 4
    );
    port(
        wclk            : in     vl_logic;
        wclken          : in     vl_logic;
        wfull           : in     vl_logic;
        wdata           : in     vl_logic_vector;
        waddr           : in     vl_logic_vector;
        raddr           : in     vl_logic_vector;
        rdata           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end fifomem;
