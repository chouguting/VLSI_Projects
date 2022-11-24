library verilog;
use verilog.vl_types.all;
entity TESTBED is
    generic(
        DSIZE           : integer := 8;
        ASIZE           : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of ASIZE : constant is 1;
end TESTBED;
