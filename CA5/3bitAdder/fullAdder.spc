* SPICE export by:  S-Edit 16.01
* Export time:      Wed Jan 23 20:53:43 2019
* Design:           FullAdder
* Cell:             fullAdder
* Interface:        view0
* View:             view0
* View type:        connectivity
* Export as:        top-level cell
* Export mode:      hierarchical
* Exclude empty cells: no
* Exclude .model:   yes
* Exclude .end:     no
* Exclude simulator commands:     no
* Expand paths:     yes
* Wrap lines:       80 characters
* Root path:        C:\Users\Lenovo-pc\Documents\Tanner EDA\Tanner Tools v16.0\FullAdder\FullAdder
* Exclude global pins:   no
* Exclude instance locations: no
* Control property name(s): SPICE

********* Simulation Settings - General Section *********

*************** Subcircuits *****************
.subckt Inverter In Out Gnd Vdd 
MMn1 Out In Gnd 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=-600 $w=414 $h=600
MMp1 Out In Vdd Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-1007 
+$y=0 $w=414 $h=600
.ends

.subckt NAND A B Out Gnd Vdd 
MMn1 Out A N_1 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=393 
+$y=-500 $w=414 $h=600
MMn2 N_1 B Gnd 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=393 
+$y=-1100 $w=414 $h=600
MMp1 Out A Vdd Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-307 
+$y=400 $w=414 $h=600
MMp2 Out B Vdd Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=993 
+$y=400 $w=414 $h=600
.ends

.subckt NOR A B Out Gnd Vdd 
MMn1 Out A Gnd 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=93 
+$y=-400 $w=414 $h=600
MMn2 Out B Gnd 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=1393 
+$y=-400 $w=414 $h=600
MMp1 Out B N_1 Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=693 
+$y=300 $w=414 $h=600
MMp2 N_1 A Vdd Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=693 
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


***** Top Level *****
XhalfAdder_1 X Y N_1 N_2 Gnd Vdd halfAdder $ $x=200 $y=0 $w=1800 $h=1000
XhalfAdder_2 N_2 Z N_3 S Gnd Vdd halfAdder $ $x=2600 $y=-200 $w=1800 $h=1000
XOR_1 N_1 N_3 C Gnd Vdd OR $ $x=4500 $y=700 $w=1800 $h=1000

********* Simulation Settings - Analysis Section *********

********* Simulation Settings - Additional SPICE Commands *********

.end

