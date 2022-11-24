library verilog;
use verilog.vl_types.all;
entity comparator_4_bits is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        bigger          : out    vl_logic_vector(3 downto 0);
        smaller         : out    vl_logic_vector(3 downto 0)
    );
end comparator_4_bits;
