transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {Lab1Test.svo}

vlog -sv -work work +incdir+C:/Users/choug/VLSI_Projects/Lab1Test {C:/Users/choug/VLSI_Projects/Lab1Test/TESTBED.sv}
vlog -sv -work work +incdir+C:/Users/choug/VLSI_Projects/Lab1Test {C:/Users/choug/VLSI_Projects/Lab1Test/PATTERN.sv}

vsim -t 1ps -L altera_ver -L cycloneiii_ver -L gate_work -L work -voptargs="+acc"  TESTBED

add wave *
view structure
view signals
run -all
