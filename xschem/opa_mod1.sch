v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -30 -50 10 -50 {lab=vip}
N -30 -10 10 -10 {lab=vim}
N 50 -80 50 -60 {lab=vilp}
N 50 -80 120 -80 {lab=vilp}
N 50 -0 50 30 {lab=GND}
N 50 30 120 30 {lab=GND}
N 120 -80 155 -80 {lab=vilp}
N 220 -80 335 -80 {lab=volp}
N 335 -80 335 -60 {lab=volp}
N 335 -60 360 -60 {lab=volp}
N 275 -80 275 -55 {lab=volp}
N 340 -20 360 -20 {lab=GND}
N 340 -20 340 30 {lab=GND}
N 120 30 340 30 {lab=GND}
N 275 5 275 30 {lab=GND}
N 400 -75 400 -70 {lab=vop}
N 400 -75 465 -75 {lab=vop}
N 400 -10 400 25 {lab=vom}
N 400 25 465 25 {lab=vom}
N 265 30 265 45 {lab=GND}
N 155 -80 160 -80 {lab=vilp}
C {vcvs.sym} 50 -30 0 0 {name=E1 value=1000}
C {iopin.sym} 465 -75 0 0 {name=p1 lab=vop}
C {iopin.sym} 465 25 0 0 {name=p2 lab=vom}
C {iopin.sym} -30 -50 0 1 {name=p3 lab=vip}
C {iopin.sym} -30 -10 0 1 {name=p4 lab=vim}
C {res.sym} 190 -80 3 0 {name=R1
value=200
footprint=1206
device=resistor
m=1}
C {capa.sym} 275 -25 0 0 {name=C1
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {vcvs.sym} 400 -40 0 0 {name=E2 value=1}
C {gnd.sym} 265 45 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 260 -80 0 0 {name=p5 sig_type=std_logic lab=volp}
C {lab_wire.sym} 120 -80 0 0 {name=p6 sig_type=std_logic lab=vilp}
