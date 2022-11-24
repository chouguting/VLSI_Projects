library verilog;
use verilog.vl_types.all;
entity AFIFO_vlg_check_tst is
    port(
        rdata           : in     vl_logic_vector(7 downto 0);
        rempty          : in     vl_logic;
        wfull           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end AFIFO_vlg_check_tst;
