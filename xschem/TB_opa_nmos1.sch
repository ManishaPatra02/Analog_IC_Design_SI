v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 -40 110 -10 {lab=GND}
N -180 10 -180 40 {lab=vcm}
N -180 40 -20 40 {lab=vcm}
N -20 10 -20 40 {lab=vcm}
N -110 40 -110 70 {lab=vcm}
N -20 -60 -20 -50 {lab=vip}
N -20 -60 50 -60 {lab=vip}
N -180 -110 -180 -50 {lab=vim}
N -180 -110 50 -110 {lab=vim}
N -60 -70 -60 -40 {lab=vindiff}
N -240 -70 -60 -70 {lab=vindiff}
N -240 -70 -240 -40 {lab=vindiff}
N -240 -40 -220 -40 {lab=vindiff}
N -60 0 -60 20 {lab=GND}
N -240 20 -60 20 {lab=GND}
N -240 0 -240 20 {lab=GND}
N -240 0 -220 0 {lab=GND}
N -240 20 -240 40 {lab=GND}
N -110 130 -110 150 {lab=GND}
N -350 -70 -350 20 {lab=vindiff}
N -350 -70 -240 -70 {lab=vindiff}
N -350 80 -350 130 {lab=GND}
N -50 -250 -50 -230 {lab=Vdda}
N -50 -250 90 -250 {lab=Vdda}
N 90 -250 90 -140 {lab=Vdda}
N -50 -170 -50 -150 {lab=GND}
N 120 -170 120 -140 {lab=vib5u}
N 120 -250 120 -230 {lab=Vdda}
N 90 -250 120 -250 {lab=Vdda}
N 230 0 230 20 {lab=GND}
N 180 -80 230 -80 {lab=vout}
N 230 -80 230 -60 {lab=vout}
C {opa_nmos1.sym} 90 -80 0 0 {name=x1}
C {gnd.sym} 110 -10 0 0 {name=l1 lab=GND}
C {vsource.sym} -110 100 0 0 {name=Vcm value="0.9 AC 0" savecurrent=false}
C {vcvs.sym} -180 -20 0 0 {name=E1 value=-0.5}
C {vcvs.sym} -20 -20 0 0 {name=E2 value=0.5}
C {gnd.sym} -240 40 0 0 {name=l2 lab=GND}
C {gnd.sym} -110 150 0 0 {name=l3 lab=GND}
C {vsource.sym} -350 50 0 0 {name=V2 value="0 AC 1" savecurrent=false}
C {gnd.sym} -350 130 0 0 {name=l4 lab=GND}
C {isource.sym} 120 -200 0 0 {name=I0 value=5u}
C {vsource.sym} -50 -200 0 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -50 -150 0 0 {name=l5 lab=GND}
C {capa.sym} 230 -30 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 230 20 0 0 {name=l6 lab=GND}
C {devices/code.sym} -340 -250 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/code_shown.sym} -1010 -410 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
  save all
  save @m.x1.xmtail.msky130_fd_pr__nfet_01v8[id]
  save @m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[id]
  save @m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[id]
  save @m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[id]
  save @m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[id]
  save @m.x1.xmtail.msky130_fd_pr__nfet_01v8[gm]
  save @m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[gm]
  save @m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[gm]
  save @m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[gm]
  save @m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[gm]
  op
  write TB_opa_nmos1.raw
  let imtail=@m.x1.xmtail.msky130_fd_pr__nfet_01v8[id]
  let iip=@m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[id]
  let iim=@m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[id]
  let icmp=@m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[id]
  let icmm=@m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[id]

  let gmtail=@m.x1.xmtail.msky130_fd_pr__nfet_01v8[gm]
  let gmip=@m.x1.xmip.msky130_fd_pr__nfet_01v8_lvt[gm]
  let gmim=@m.x1.xmim.msky130_fd_pr__nfet_01v8_lvt[gm]
  let gmcmp=@m.x1.xmpcmp.msky130_fd_pr__pfet_01v8_lvt[gm]
  let gmcmm=@m.x1.xmpcmm.msky130_fd_pr__pfet_01v8_lvt[gm]

  let gmidtail=gmtail/imtail
  let gmidip=gmip/iip
  let gmidim=gmim/iim
  let gmidcmp=gmcmp/icmp
  let gmidcmm=gmcmm/icmm

  print gmidtail
  print gmidip
  print gmidim
  print gmidcmp
  print gmidcmm

  AC DEC 100 1 1e9
  set appendwrite
  write TB_opa_nmos1.raw
.endc
"}
C {lab_wire.sym} -290 -70 0 0 {name=p1 sig_type=std_logic lab=vindiff}
C {lab_wire.sym} -120 -110 0 0 {name=p2 sig_type=std_logic lab=vim}
C {lab_wire.sym} 20 -60 0 0 {name=p3 sig_type=std_logic lab=vip}
C {lab_wire.sym} -30 40 0 0 {name=p4 sig_type=std_logic lab=vcm}
C {lab_wire.sym} 60 -250 0 0 {name=p5 sig_type=std_logic lab=Vdda}
C {lab_wire.sym} 120 -150 1 0 {name=p6 sig_type=std_logic lab=vib5u}
C {devices/ngspice_get_value.sym} -260 -90 0 1 {name=r1 node=@m.x1.xmtail.msky130_fd_pr__nfet_01v8[id]
descr="id-mtail="}
C {lab_wire.sym} 220 -80 0 0 {name=p7 sig_type=std_logic lab=vout}
