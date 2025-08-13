v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 220 -130 310 -130 {lab=vn1}
N 30 -130 30 -80 {lab=vin}
N 30 -130 160 -130 {lab=vin}
N 370 -130 410 -130 {lab=#net1}
N 410 -130 410 -80 {lab=#net1}
N 410 -20 410 0 {lab=GND}
N 30 0 410 0 {lab=GND}
N 30 -20 30 -0 {lab=GND}
N 30 0 30 20 {lab=GND}
C {vsource.sym} 30 -50 0 0 {name=Vsmic value="0 ac 1 0 sin(0 1m 1e3 0 0 0)" }
C {res.sym} 340 -130 1 1 {name=Rsmic
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 190 -130 3 0 {name=Cbyp
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 410 -50 0 0 {name=Vcm value="1.8" }
C {gnd.sym} 30 20 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 100 -130 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} 270 -130 0 0 {name=p2 sig_type=std_logic lab=vn1}
C {simulator_commands_shown.sym} -380 -260 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
  save all
  op
  removezerovec
  write hiPass.raw
  **
  set appendwrote
  ac dec 100 0.01 10e6
  removezerovec
  plot vdb(vn1) cph(vn1)*180/PI

.endc
"}
