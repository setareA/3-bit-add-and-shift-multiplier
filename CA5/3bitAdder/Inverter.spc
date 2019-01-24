.inc '180nm_bulk.pm'

vdd vdd gnd 3.3
vin in gnd pulse(0 3.3 0 .1n .1n 3n 6n)
***** Top Level *****
MMn1 Out In Gnd 0 nmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=-600 $w=414 $h=600
MMp1 Out In Vdd Vdd pmos W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=0 $w=414 $h=600

********* Simulation Settings - Analysis Section *********

.tran 1n 40n 
.print tran In Out

.end

