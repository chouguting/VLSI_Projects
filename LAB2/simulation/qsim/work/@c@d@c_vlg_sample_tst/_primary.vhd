library verilog;
use verilog.vl_types.all;
entity CDC_vlg_sample_tst is
    port(
        clk1            : in     vl_logic;
        clk2            : in     vl_logic;
        in_A            : in     vl_logic_vector(7 downto 0);
        in_T            : in     vl_logic_vector(7 downto 0);
        in_account      : in     vl_logic_vector(7 downto 0);
        in_valid        : in     vl_logic;
        rst_n           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CDC_vlg_sample_tst;
