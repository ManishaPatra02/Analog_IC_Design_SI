v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 90 -10 90 10 {lab=GND}
N -75 -80 -75 -70 {lab=vin}
N -75 -10 -75 0 {lab=GND}
N 160 -50 190 -50 {lab=vout}
N 90 10 90 15 {lab=GND}
N -75 0 -75 20 {lab=GND}
N -75 0 10 0 {lab=GND}
N 25 -80 30 -80 {lab=GND}
N 0 -30 30 -30 {lab=vin}
N -0 -80 -0 -30 {lab=vin}
N -75 -80 -0 -80 {lab=vin}
N 10 -80 25 -80 {lab=GND}
N 10 -80 10 -0 {lab=GND}
C {opa_mod1.sym} 70 -50 0 0 {name=x1}
C {gnd.sym} -75 20 0 0 {name=l1 lab=GND}
C {vsource.sym} -75 -40 0 0 {name=V1 value="0 AC 1" savecurrent=false}
C {lab_pin.sym} 190 -50 0 1 {name=p1 sig_type=std_logic lab=vout}
C {lab_wire.sym} -35 -80 0 0 {name=p2 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} -605 -300 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.CONTROL
  save all
  op
  write TB_opa_model.raw
  set appendwrite
  AC DEC 100 0.1 100e6
  write TB_opa_model.raw
  **
  MEAS AC gain_db MAX vdb(vout) FROM=0.1 TO=100e6
  LET vm3db = gain_db - 3.0
  print vm3db
  MEAS AC fpole WHEN vdb(vout)=vm3db FALL=1
  PLOT vdb(vout)

.ENDC
"}
C {gnd.sym} 90 15 0 0 {name=l2 lab=GND}
