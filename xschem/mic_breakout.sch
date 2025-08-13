v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 780 -810 1580 -410 {flags=graph,unlocked
y1=-1.9
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=8
unity=1
x1=0
x2=8
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="vout
vmic" vmic
color="4 5"
dataset=-1
unitx=1
logx=1
logy=1
sim_type=ac
rawfile=$netlist_dir/mic_breakout.raw}
B 2 780 -410 1580 -10 {flags=graph
y1=0.49
y2=0.51
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.003
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vmic"
color="4"
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/mic_breakout.raw}
N 20 -150 20 -120 {lab=#net1}
N 20 -150 60 -150 {lab=#net1}
N 120 -150 210 -150 {lab=#net2}
N 270 -150 350 -150 {lab=vmic}
N 410 -150 520 -150 {lab=vinm}
N 470 -190 470 -120 {lab=vinp}
N 470 -190 520 -190 {lab=vinp}
N 20 -60 20 -40 {lab=GND}
N 20 -40 470 -40 {lab=GND}
N 470 -60 470 -40 {lab=GND}
N 560 -140 560 -40 {lab=GND}
N 470 -40 560 -40 {lab=GND}
N 440 -330 440 -150 {lab=vinm}
N 440 -330 480 -330 {lab=vinm}
N 440 -270 480 -270 {lab=vinm}
N 560 -330 560 -200 {lab=vout}
N 540 -330 560 -330 {lab=vout}
N 540 -270 560 -270 {lab=vout}
N 690 -220 690 -160 {lab=vout}
N 560 -220 690 -220 {lab=vout}
N 690 -100 690 -40 {lab=GND}
N 560 -40 690 -40 {lab=GND}
C {vsource.sym} 20 -90 0 0 {name=Vsmic value="0 ac 1 0 sin(0 1m 1e3 0 0 0)" }
C {res.sym} 90 -150 1 1 {name=Rsmic
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 240 -150 3 0 {name=Cbyp
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 380 -150 1 1 {name=R3
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 560 -170 0 0 {name=E1 value=10000}
C {vsource.sym} 470 -90 0 0 {name=Vcm value=0.5}
C {res.sym} 510 -270 1 1 {name=R4
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 510 -330 3 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 690 -130 0 0 {name=Cbyp2
m=1
value=4.7f
footprint=1206
device="ceramic capacitor"}
C {lab_wire.sym} 680 -220 0 0 {name=p1 sig_type=std_logic lab=vout}
C {lab_wire.sym} 310 -150 0 0 {name=p2 sig_type=std_logic lab=vmic}
C {gnd.sym} 370 -40 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -10 -800 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
  save all
  op
  remzerovec
  write mic_breakout.raw
  set appendwrite
  ac dec 10 1 10e7
  remzerovec
  write mic_breakout.raw
  ** plot 20*log10(vout)

  meas ac dcgain MAX vmag(vout) FROM=1 TO=1e6
  let dcgain_db = 20*log10(dcgain)
  let f3db = dcgain/sqrt(2)
  meas ac fbw WHEN vmag(vout)=f3db FALL=1
  meas ac fzero WHEN vmag(vout)=f3db RISE=1
  print dcgain_db
  
  tran 3u 3m
  write mic_breakout.raw
  plot v(vout)
.endc
"}
C {lab_wire.sym} 480 -190 0 0 {name=p3 sig_type=std_logic lab=vinp}
C {lab_wire.sym} 510 -150 0 0 {name=p4 sig_type=std_logic lab=vinm}
C {ngspice_get_expr.sym} 520 -580 0 0 {name=r1 node=vout
descr="I=vmag(vout)"}
