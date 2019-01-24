********* Simulation Settings - General Section *********
.inc '180nm_bulk.pm'
vdd vdd gnd 3.3
vC0 C0 gnd pulse(0 3.3 0 .1n .1n 0n 50n)
vA0 A0 gnd pulse(0 3.3 0 .1n .1n 15n 50n)
vB0 B0 gnd pulse(0 3.3 0 .1n .1n 15n 50n)

vA1 A1 gnd pulse(0 3.3 0 .1n .1n 0n 50n)
vB1 B1 gnd pulse(0 3.3 0 .1n .1n 15n 50n)

vA2 A2 gnd pulse(0 3.3 0 .1n .1n 0n 50n)
vB2 B2 gnd pulse(0 3.3 0 .1n .1n 0n 30n)

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

.subckt AND A B Out Gnd Vdd 
XInverter_1 N_1 Out Gnd Vdd Inverter $ $x=2500 $y=0 $w=1800 $h=1000
XNAND_1 A B N_1 Gnd Vdd NAND $ $x=700 $y=0 $w=1800 $h=1000
.ends

.subckt OR A B Out Gnd Vdd 
XInverter_1 N_1 Out Gnd Vdd Inverter $ $x=1800 $y=0 $w=1800 $h=1000
XNOR_1 A B N_1 Gnd Vdd NOR $ $x=0 $y=0 $w=1800 $h=1000
.ends

.subckt XOR A B Out Gnd Vdd 
XAND_1 N_1 B N_3 Gnd Vdd AND $ $x=700 $y=100 $w=1800 $h=1000
XAND_2 N_2 A N_4 Gnd Vdd AND $ $x=700 $y=-1400 $w=1800 $h=1000
XInverter_1 A N_1 Gnd Vdd Inverter $ $x=-1100 $y=100 $w=1800 $h=1000
XInverter_2 B N_2 Gnd Vdd Inverter $ $x=-1100 $y=-1400 $w=1800 $h=1000
XOR_1 N_3 N_4 Out Gnd Vdd OR $ $x=3300 $y=-500 $w=1800 $h=1000
.ends

.subckt halfAdder A B Carry Sum Gnd Vdd 
XAND_1 A B Carry Gnd Vdd AND $ $x=1100 $y=-1000 $w=1800 $h=1000
XXOR_1 A B Sum Gnd Vdd XOR $ $x=1100 $y=100 $w=1800 $h=1000
.ends

.subckt fullAdder C S X Y Z Gnd Vdd 
XhalfAdder_1 X Y N_1 N_2 Gnd Vdd halfAdder $ $x=200 $y=0 $w=1800 $h=1000
XhalfAdder_2 N_2 Z N_3 S Gnd Vdd halfAdder $ $x=2600 $y=-200 $w=1800 $h=1000
XOR_1 N_1 N_3 C Gnd Vdd OR $ $x=4500 $y=700 $w=1800 $h=1000
.ends


***** Top Level *****
XfullAdder_1 N_1 S0 A0 B0 C0 Gnd Vdd fullAdder $ $x=100 $y=900 $w=1800 $h=1200
XfullAdder_2 N_2 S1 A1 B1 N_1 Gnd Vdd fullAdder $ $x=100 $y=-400 $w=1800 $h=1200
XfullAdder_3 Cout S2 A2 B2 N_2 Gnd Vdd fullAdder $ $x=100 $y=-1700 $w=1800 $h=1200

********* Simulation Settings - Analysis Section *********
.tran 1n 40n 
.print tran A0
.print tran B0
.print tran C0
.print tran N_1
.print tran A1
.print tran B1
.print tran A2
.print tran B2
.print tran N_2
.print tran S0
.print tran S1
.print tran S2
.print tran Cout

.end

