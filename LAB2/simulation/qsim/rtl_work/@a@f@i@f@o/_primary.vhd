library verilog;
use verilog.vl_types.all;
entity AFIFO is
    generic(
        DSIZE           : integer := 8;
        ASIZE           : integer := 4
    );
    port(
        rst_n           : in     vl_logic;
        rclk            : in     vl_logic;
        rinc            : in     vl_logic;
        wclk            : in     vl_logic;
        winc            : in     vl_logic;
        wdata           : in     vl_logic_vector;
        rempty          : out    vl_logic;
        rdata           : out    vl_logic_vector;
        wfull           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end AFIFO;
