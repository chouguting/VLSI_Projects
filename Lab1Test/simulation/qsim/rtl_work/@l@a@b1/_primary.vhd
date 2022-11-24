library verilog;
use verilog.vl_types.all;
entity LAB1 is
    port(
        in_0            : in     vl_logic_vector(3 downto 0);
        in_1            : in     vl_logic_vector(3 downto 0);
        in_2            : in     vl_logic_vector(3 downto 0);
        in_3            : in     vl_logic_vector(3 downto 0);
        in_4            : in     vl_logic_vector(3 downto 0);
        in_5            : in     vl_logic_vector(3 downto 0);
        in_rule         : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(9 downto 0)
    );
end LAB1;
