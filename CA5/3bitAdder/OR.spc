.inc '180nm_bulk.pm'

vdd vdd gnd 3.3
vA A gnd pulse(0 3.3 0 .1n .1n 15n 30n)
vB B gnd pulse(0 3.3 0 .1n .1n 2n 20n)

*************** Subcircuits *****************
.subckt Inverter In Out Gnd Vdd 
MMn1 Out In Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=-600 $w=414 $h=600
MMp1 Out In Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=0 $w=414 $h=600
.ends

.subckt NOR A B Out Gnd Vdd 
MMn1 Out A Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=93 
+$y=-400 $w=414 $h=600
MMn2 Out B Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=1393 
+$y=-400 $w=414 $h=600
MMp1 Out B N_1 Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=693 
+$y=300 $w=414 $h=600
MMp2 N_1 A Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=693 
+$y=900 $w=414 $h=600
.ends


***** Top Level *****
XInverter_1 N_1 Out Gnd Vdd Inverter $ $x=1800 $y=0 $w=1800 $h=1000
XNOR_1 A B N_1 Gnd Vdd NOR $ $x=0 $y=0 $w=1800 $h=1000

********* Simulation Settings - Analysis Section *********
.tran 1n 40n 
.print tran Out
.print tran A
.print tran B

.end

