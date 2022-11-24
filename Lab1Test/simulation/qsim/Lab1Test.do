onerror {exit -code 1}
vlib work
vlog -work work Lab1Test.vo
vlog -work work actual_test.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.LAB1_vlg_vec_tst -voptargs="+acc"
vcd file -direction Lab1Test.msim.vcd
vcd add -internal LAB1_vlg_vec_tst/*
vcd add -internal LAB1_vlg_vec_tst/i1/*
run -all
quit -f
