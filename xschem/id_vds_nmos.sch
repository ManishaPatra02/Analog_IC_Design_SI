v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -10 -50 -10 -40 {lab=vg}
N -10 -50 50 -50 {lab=vg}
N -10 20 -10 50 {lab=GND}
N -10 50 190 50 {lab=GND}
N 190 20 190 50 {lab=GND}
N 190 -100 190 -40 {lab=vd}
N 90 -100 190 -100 {lab=vd}
N 90 -100 90 -80 {lab=vd}
N 110 -50 110 -0 {lab=GND}
N 90 -0 110 -0 {lab=GND}
N 90 -20 90 -0 {lab=GND}
N 90 -20 90 -0 {lab=GND}
N 90 -0 90 50 {lab=GND}
N 80 50 80 70 {lab=GND}
N 90 -50 110 -50 {lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 70 -50 0 0 {name=M1
L=1
W=4
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -10 -10 0 0 {name=Vgs value=1}
C {vsource.sym} 190 -10 0 0 {name=Vds value=0}
C {gnd.sym} 80 70 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 10 -50 0 0 {name=p2 sig_type=std_logic lab=vg}
C {lab_wire.sym} 140 -100 0 0 {name=p3 sig_type=std_logic lab=vd}
C {simulator_commands_shown.sym} -230 -220 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands

.CONTROL 
  OP
  DC Vds 0 1.8 0.05 Vgs 0.4 1.0 0.1
.ENDC
"}
C {devices/code.sym} -250 -40 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
