* SPICE export by:  S-Edit 16.01
* Export time:      Wed Jan 23 20:51:54 2019
* Design:           FullAdder
* Cell:             AND
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


***** Top Level *****
XInverter_1 N_1 Out Gnd Vdd Inverter $ $x=2500 $y=0 $w=1800 $h=1000
XNAND_1 A B N_1 Gnd Vdd NAND $ $x=700 $y=0 $w=1800 $h=1000

********* Simulation Settings - Analysis Section *********

********* Simulation Settings - Additional SPICE Commands *********

.end

