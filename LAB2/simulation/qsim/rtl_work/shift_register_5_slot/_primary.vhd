library verilog;
use verilog.vl_types.all;
entity shift_register_5_slot is
    generic(
        DSIZE           : integer := 8
    );
    port(
        rst_n           : in     vl_logic;
        clk             : in     vl_logic;
        shift_enable    : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_0          : out    vl_logic_vector;
        data_1          : out    vl_logic_vector;
        data_2          : out    vl_logic_vector;
        data_3          : out    vl_logic_vector;
        data_4          : out    vl_logic_vector;
        hasData         : out    vl_logic_vector(4 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
end shift_register_5_slot;
