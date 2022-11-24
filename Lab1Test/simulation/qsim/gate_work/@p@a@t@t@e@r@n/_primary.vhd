library verilog;
use verilog.vl_types.all;
entity PATTERN is
    port(
        in_0            : out    vl_logic_vector(3 downto 0);
        in_1            : out    vl_logic_vector(3 downto 0);
        in_2            : out    vl_logic_vector(3 downto 0);
        in_3            : out    vl_logic_vector(3 downto 0);
        in_4            : out    vl_logic_vector(3 downto 0);
        in_5            : out    vl_logic_vector(3 downto 0);
        in_rule         : out    vl_logic_vector(2 downto 0);
        \out\           : in     vl_logic_vector(9 downto 0)
    );
end PATTERN;
