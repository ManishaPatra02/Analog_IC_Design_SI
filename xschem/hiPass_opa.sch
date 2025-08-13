v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -320 -50 -320 30 {lab=vin}
N -320 -50 -250 -50 {lab=vin}
N -190 -50 -150 -50 {lab=vn1}
N -90 -50 -40 -50 {lab=virt}
N -60 -120 -60 -50 {lab=virt}
N -60 -120 -0 -120 {lab=virt}
N -100 0 -100 30 {lab=vcm}
N -100 0 -40 0 {lab=vcm}
N -320 90 -320 110 {lab=GND}
N -320 110 -100 110 {lab=GND}
N -100 90 -100 110 {lab=GND}
N 20 20 20 110 {lab=GND}
N -100 110 20 110 {lab=GND}
N 90 -20 120 -20 {lab=vout}
N 60 -120 120 -120 {lab=vout}
N 120 -120 120 -20 {lab=vout}
N 120 -20 140 -20 {lab=vout}
C {opa_mod1.sym} 0 -20 0 0 {name=x1}
C {res.sym} -120 -50 3 0 {name=R1
value=5k
footprint=1206
device=resistor
m=1}
C {res.sym} 30 -120 3 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {capa.sym} -220 -50 3 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -100 60 0 0 {name=V1 value=1.5 savecurrent=false}
C {vsource.sym} -320 60 0 0 {name=V2 value="0 AC 1" savecurrent=false}
C {gnd.sym} -320 110 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 140 -20 0 1 {name=p1 sig_type=std_logic lab=vout}
C {lab_wire.sym} -290 -50 0 0 {name=p2 sig_type=std_logic lab=vin}
C {lab_wire.sym} -160 -50 0 0 {name=p3 sig_type=std_logic lab=vn1}
C {lab_wire.sym} -70 0 0 0 {name=p4 sig_type=std_logic lab=vcm}
C {lab_wire.sym} -40 -120 0 0 {name=p5 sig_type=std_logic lab=virt}
C {simulator_commands_shown.sym} -630 -640 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
  save all
  op
  write hiPass_opa.raw
  set appendwrite
  AC DEC 100 0.1 100e6
  write hiPass_opa.raw
  **
  MEAS AC gain_db MAX vdb(vout) FROM=0.1 TO=100e6
  LET vm3db = gain_db - 3.0
  print vm3db
  MEAS AC fzero WHEN vdb(vout)=vm3db RISE=1
  ** MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
  **MEAS AC fmid  WHEN vdb(vout)=gain_db
  **Phase Measurement
  LET phase_deg = cph(vout)*180/PI
  MEAS AC phase_zero FIND phase_deg AT=fzero
  **MEAS AC phase_pole FIND phase_deg AT=fpole
 

  **LET phase_zero_ph = phase_mid-45
  **MEAS AC fzero_ph WHEN phase_deg=phase_zero_ph
  **
  plot vdb(vout) 
  plot cph(vout)*180/PI

  **TRAN 1u 5m
  
.ENDC
"}
