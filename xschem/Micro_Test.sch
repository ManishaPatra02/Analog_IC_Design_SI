v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 140 -740 940 -340 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.6824231e-06
x2=4.3175769e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=vout
color=4
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/Micro_Test.raw}
N 370 -50 370 20 {lab=GND}
N -110 30 -110 60 {lab=GND}
N -110 -60 -110 -30 {lab=vnmic}
N -110 -60 -40 -60 {lab=vnmic}
N 20 -60 80 -60 {lab=vn1}
N 140 -60 180 -60 {lab=vn2}
N 240 -60 330 -60 {lab=virt}
N 280 -100 280 -10 {lab=#net1}
N 280 -100 330 -100 {lab=#net1}
N 370 -180 370 -110 {lab=vout}
N 470 -150 470 -110 {lab=vout}
N 370 -150 470 -150 {lab=vout}
N 470 -50 470 -10 {lab=GND}
N 280 50 280 70 {lab=GND}
N 350 -280 360 -280 {lab=vout}
N 360 -280 370 -280 {lab=vout}
N 370 -280 370 -180 {lab=vout}
N 350 -200 370 -200 {lab=vout}
N 270 -280 290 -280 {lab=virt}
N 270 -280 270 -60 {lab=virt}
N 270 -200 290 -200 {lab=virt}
C {vsource.sym} -110 0 0 0 {name=vnmic value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {res.sym} -10 -60 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 110 -60 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 210 -60 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 370 -80 0 0 {name=E1 value=10000}
C {vsource.sym} 280 20 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} -110 60 0 0 {name=l1 lab=GND}
C {gnd.sym} 280 70 0 0 {name=l2 lab=GND}
C {gnd.sym} 370 20 0 0 {name=l3 lab=GND}
C {capa.sym} 470 -80 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 470 -10 0 0 {name=l4 lab=GND}
C {res.sym} 320 -200 3 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 320 -280 3 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} -80 -60 0 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_wire.sym} 50 -60 0 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_wire.sym} 160 -60 0 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_wire.sym} 420 -150 0 0 {name=p4 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -610 -410 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control 
OP
save all
write Micro_Test.raw
set appendwrite
Ac DEC 100 1 10e6
plot vdb(vout)
plot v(vout)
plot phase(vout)
MEAS AC gain_db MAX vdb(vout) FROM=1 TO=10e6
LET vm3db = gain_db-3.0
print vm3db
MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
** phase measurement
LET phase_deg = cph(vout)*180/PI
MEAS AC phase_zero FIND phase_deg AT=fzero
MEAS AC phase_pole FIND phase_deg AT=fpole
MEAS AC phase_mid FIND phase_deg AT=fmid
** MEAS fero fpole using phase
LET phase_zero_ph = phase_mid - 45
MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
.endc
.end
"}
C {lab_wire.sym} 270 -130 0 0 {name=p5 sig_type=std_logic lab=virt}
