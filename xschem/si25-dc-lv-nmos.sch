v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 -60 110 -20 {lab=GND}
N 380 -60 380 -40 {lab=GND}
N 110 -40 380 -40 {lab=GND}
N 230 -120 230 -40 {lab=GND}
N 110 -150 110 -120 {lab=#net1}
N 110 -150 190 -150 {lab=#net1}
N 230 -150 250 -150 {lab=GND}
N 250 -150 250 -110 {lab=GND}
N 230 -110 250 -110 {lab=GND}
N 230 -200 230 -180 {lab=#net2}
N 230 -200 280 -200 {lab=#net2}
N 380 -200 380 -120 {lab=#net3}
N 340 -200 380 -200 {lab=#net3}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 210 -150 0 0 {name=M1
L=1
W=5
nf=1 mult=1
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/vsource.sym} 110 -90 0 0 {name=Vgs value=0.77}
C {devices/vsource.sym} 380 -90 0 0 {name=Vds value=3.3}
C {devices/gnd.sym} 110 -20 0 0 {name=l1 lab=GND}
C {devices/ammeter.sym} 310 -200 1 0 {name=Vd}
C {devices/code_shown.sym} -370 -390 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
  save all
  save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
  op
  write si25_dc_lv_nmos.raw
  set appendwrite
  dc Vds 0 1.8 0.01 Vgs 0 1.8 0.2
  write dc_hv_nmos.raw
  plot i(Vd)
  **quit
.endc
"}
C {devices/code.sym} 180 -390 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {devices/ngspice_get_value.sym} -300 -90 0 1 {name=r4 node=@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
descr="gm="}
