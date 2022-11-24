library verilog;
use verilog.vl_types.all;
entity CDC_vlg_check_tst is
    port(
        out_account     : in     vl_logic_vector(7 downto 0);
        out_account0    : in     vl_logic_vector(16 downto 0);
        out_account1    : in     vl_logic_vector(16 downto 0);
        out_account2    : in     vl_logic_vector(16 downto 0);
        out_account3    : in     vl_logic_vector(16 downto 0);
        out_account4    : in     vl_logic_vector(16 downto 0);
        out_result      : in     vl_logic_vector(16 downto 0);
        out_valid       : in     vl_logic;
        ready           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CDC_vlg_check_tst;
