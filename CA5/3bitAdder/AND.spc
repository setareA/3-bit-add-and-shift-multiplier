.inc '180nm_bulk.pm'

vdd vdd gnd 3.3
vA A gnd pulse(0 3.3 0 .1n .1n 15n 30n)
vB B gnd pulse(0 3.3 0 .1n .1n 2n 20n)
*VB B gnd 3.3

*************** Subcircuits *****************
.subckt Inverter In Out Gnd Vdd 
MMn1 Out In Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=-600 $w=414 $h=600
MMp1 Out In Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=0 $w=414 $h=600
.ends

.subckt NAND A B Out Gnd Vdd 
MMn1 Out A N_1 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=393 
+$y=-500 $w=414 $h=600
MMn2 N_1 B Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=393 
+$y=-1100 $w=414 $h=600
MMp1 Out A Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-307 
+$y=400 $w=414 $h=600
MMp2 Out B Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=993 
+$y=400 $w=414 $h=600
.ends


***** Top Level *****
XInverter_1 N_1 Out Gnd Vdd Inverter $ $x=2500 $y=0 $w=1800 $h=1000
XNAND_1 A B N_1 Gnd Vdd NAND $ $x=700 $y=0 $w=1800 $h=1000

********* Simulation Settings - Analysis Section *********
.tran 1n 40n 
.print tran A B Out

.end

