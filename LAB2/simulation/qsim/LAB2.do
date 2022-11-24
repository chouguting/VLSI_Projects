onerror {exit -code 1}
vlib work
vlog -work work LAB2.vo
vlog -work work test1.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CDC_vlg_vec_tst -voptargs="+acc"
vcd file -direction LAB2.msim.vcd
vcd add -internal CDC_vlg_vec_tst/*
vcd add -internal CDC_vlg_vec_tst/i1/*
run -all
quit -f
