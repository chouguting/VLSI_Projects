library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        en              : in     vl_logic;
        out_count       : out    vl_logic_vector(4 downto 0)
    );
end counter;
