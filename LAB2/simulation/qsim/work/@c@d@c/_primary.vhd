library verilog;
use verilog.vl_types.all;
entity CDC is
    port(
        rst_n           : in     vl_logic;
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        in_valid        : in     vl_logic;
        in_account      : in     vl_logic_vector(7 downto 0);
        in_A            : in     vl_logic_vector(7 downto 0);
        in_T            : in     vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        out_valid       : out    vl_logic;
        out_account     : out    vl_logic_vector(7 downto 0);
        out_account0    : out    vl_logic_vector(16 downto 0);
        out_account1    : out    vl_logic_vector(16 downto 0);
        out_account2    : out    vl_logic_vector(16 downto 0);
        out_account3    : out    vl_logic_vector(16 downto 0);
        out_account4    : out    vl_logic_vector(16 downto 0);
        out_result      : out    vl_logic_vector(16 downto 0)
    );
end CDC;
