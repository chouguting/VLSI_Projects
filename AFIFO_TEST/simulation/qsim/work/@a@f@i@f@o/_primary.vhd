library verilog;
use verilog.vl_types.all;
entity AFIFO is
    port(
        rst_n           : in     vl_logic;
        rclk            : in     vl_logic;
        rinc            : in     vl_logic;
        wclk            : in     vl_logic;
        winc            : in     vl_logic;
        wdata           : in     vl_logic_vector(7 downto 0);
        rempty          : out    vl_logic;
        rdata           : out    vl_logic_vector(7 downto 0);
        wfull           : out    vl_logic
    );
end AFIFO;
