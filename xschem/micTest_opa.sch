v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 520 -850 1320 -450 {flags=graph
y1=0.4
y2=2.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1000000.1
x2=11000000
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node=vdb(vout)
color=4
dataset=-1
unitx=1
logx=0
logy=0
sim_type=ac
rawfile=$netlist_dir/micTest.raw}
N -40 -10 -40 30 {lab=GND}
N -40 -110 -40 -70 {lab=vnmic}
N -40 -110 50 -110 {lab=vnmic}
N 110 -110 180 -110 {lab=vn1}
N 240 -110 290 -110 {lab=vn2}
N 470 -40 470 0 {lab=GND}
N 390 -290 390 -110 {lab=virt}
N 390 -290 440 -290 {lab=virt}
N 390 -220 440 -220 {lab=virt}
N 570 -180 570 -160 {lab=vout}
N 540 -290 570 -290 {lab=vout}
N 570 -290 570 -180 {lab=vout}
N 540 -220 570 -220 {lab=vout}
N 340 30 340 70 {lab=GND}
N 570 -80 640 -80 {lab=vout}
N 700 10 700 50 {lab=GND}
N 700 -80 700 -50 {lab=vout}
N 640 -80 700 -80 {lab=vout}
N 350 -110 410 -110 {lab=virt}
N 500 -290 540 -290 {lab=vout}
N 500 -220 540 -220 {lab=vout}
N 570 -160 570 -80 {lab=vout}
N 540 -80 570 -80 {lab=vout}
N 340 -60 340 -30 {lab=#net1}
N 340 -60 410 -60 {lab=#net1}
C {vsource.sym} -40 -40 0 0 {name=Vmic value="0 AC 1 sin(0 1m 1e3 0 0 0)" savecurrent=false}
C {res.sym} 80 -110 3 0 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 210 -110 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -40 30 0 0 {name=l1 lab=GND}
C {res.sym} 320 -110 3 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 470 0 0 0 {name=l2 lab=GND}
C {res.sym} 470 -220 3 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 470 -290 3 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 340 0 0 0 {name=V2 value=1.5 savecurrent=false}
C {gnd.sym} 340 70 0 0 {name=l3 lab=GND}
C {capa.sym} 700 -20 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 700 50 0 0 {name=l4 lab=GND}
C {lab_wire.sym} 10 -110 0 0 {name=p1 sig_type=std_logic lab=vnmic}
C {lab_wire.sym} 160 -110 0 0 {name=p2 sig_type=std_logic lab=vn1}
C {lab_wire.sym} 280 -110 0 0 {name=p3 sig_type=std_logic lab=vn2}
C {lab_wire.sym} 390 -130 0 0 {name=p4 sig_type=std_logic lab=virt}
C {lab_wire.sym} 640 -80 0 0 {name=p6 sig_type=std_logic lab=vout}
C {simulator_commands_shown.sym} -190 -690 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
  save all
  op
  write micTest_opa.raw
  set appendwrite
  AC DEC 100 0.1 10e6
  write micTest_opa.raw
  **
  MEAS AC gain_db MAX vdb(vout) FROM=0.1 TO=10e6
  LET vm3db = gain_db - 3.0
  print vm3db
  MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
  MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
  **MEAS AC fmid  WHEN vdb(vout)=gain_db
  **Phase Measurement
  LET phase_deg = cph(vout)*180/PI
  MEAS AC phase_zero FIND phase_deg AT=fzero
  MEAS AC phase_pole FIND phase_deg AT=fpole
  **MEAS AC phase_mid  FIND phase_deg AT=fmid
  ** MEAS fero fpole using phase
  **LET phase_zero_ph = phase_mid-45
  **MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
  **
  **TRAN 1u 5m
  
.ENDC
"}
C {opa_mod1.sym} 450 -80 0 0 {name=x1}
