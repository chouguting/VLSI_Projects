transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/wptr_full.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/sync_w2r.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/sync_r2w.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/rptr_empty.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/fifomem.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/CDC.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2 {C:/Users/choug/VLSI_Projects/LAB2/AFIFO.v}

vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE {C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE/PATTERN.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE {C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE/PATTERN0.v}
vlog -vlog01compat -work work +incdir+C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE {C:/Users/choug/VLSI_Projects/LAB2/TEST_FILE/TESTBED.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  TESTBED

add wave *
view structure
view signals
run -all
