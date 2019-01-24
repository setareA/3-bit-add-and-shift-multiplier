* SPICE export by:  S-Edit 16.01
* Export time:      Thu Jan 24 21:09:21 2019
* Design:           edge-triggered-Register
* Cell:             edge_triggered_Register
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
* Root path:        C:\Users\Lenovo-pc\Documents\Tanner EDA\Tanner Tools v16.0\Edge-triggered-Register\edge-triggered-Register
* Exclude global pins:   no
* Exclude instance locations: no
* Control property name(s): SPICE

********* Simulation Settings - General Section *********

*************** Subcircuits *****************
.subckt Inverter Out Gnd Vdd 
MMn1 Out N_1 Gnd 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-107 
+$y=200 $w=414 $h=600
MMp1 Out N_2 Vdd Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ 
+$x=-107 $y=800 $w=414 $h=600
.ends


***** Top Level *****
XInverter_1 N_1 Gnd Vdd Inverter $ $x=3000 $y=900 $w=1800 $h=1000
XInverter_2 Q Gnd Vdd Inverter $ $x=7300 $y=1000 $w=1800 $h=1000
XInverter_3 clk Gnd Vdd Inverter $ $x=2600 $y=2200 $w=1800 $h=1000
XC1 N_1 Gnd Capacitor_MIM L=10u W=10u $ C=89.71f $ $x=1590 $y=500 $w=619 $h=600
XC2 Q Gnd Capacitor_MIM L=10u W=10u $ C=89.71f $ $x=5990 $y=400 $w=619 $h=600
MMn1 N_1 clk D 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-7 
+$y=200 $w=414 $h=600
MMn2 Q clk N_1 0 NMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=4793 
+$y=200 $w=414 $h=600
MMp1 D clk N_1 Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=-107 
+$y=1600 $w=414 $h=600
MMp2 N_1 clk Q Vdd PMOS25 W=1.5u L=250n M=1 AS=975f PS=4.3u AD=975f PD=4.3u $ $x=4793 
+$y=1600 $w=414 $h=600

********* Simulation Settings - Analysis Section *********

********* Simulation Settings - Additional SPICE Commands *********

.end

