v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 710 -250 750 -250 {lab=vip}
N 1010 -250 1050 -250 {lab=vim}
N 690 -30 690 -0 {lab=AVSS}
N 690 -0 870 -0 {lab=AVSS}
N 870 -30 870 -0 {lab=AVSS}
N 670 -60 690 -60 {lab=AVSS}
N 670 -60 670 0 {lab=AVSS}
N 670 0 690 0 {lab=AVSS}
N 870 -60 890 -60 {lab=AVSS}
N 890 -60 890 0 {lab=AVSS}
N 870 0 890 0 {lab=AVSS}
N 730 -60 830 -60 {lab=ib5u}
N 760 -120 760 -60 {lab=ib5u}
N 690 -120 760 -120 {lab=ib5u}
N 690 -120 690 -90 {lab=ib5u}
N 620 -0 670 -0 {lab=AVSS}
N 610 -120 690 -120 {lab=ib5u}
N 790 -220 790 -190 {lab=vs}
N 790 -190 970 -190 {lab=vs}
N 970 -220 970 -190 {lab=vs}
N 870 -190 870 -90 {lab=vs}
N 790 -420 790 -280 {lab=vom}
N 970 -420 970 -280 {lab=vout}
N 830 -450 930 -450 {lab=vom}
N 790 -510 790 -480 {lab=AVDD}
N 790 -510 970 -510 {lab=AVDD}
N 970 -510 970 -480 {lab=AVDD}
N 770 -450 790 -450 {lab=AVDD}
N 770 -510 770 -450 {lab=AVDD}
N 770 -510 790 -510 {lab=AVDD}
N 970 -450 1000 -450 {lab=AVDD}
N 1000 -510 1000 -450 {lab=AVDD}
N 970 -510 1000 -510 {lab=AVDD}
N 720 -510 770 -510 {lab=AVDD}
N 970 -340 1020 -340 {lab=vout}
N 870 -450 870 -370 {lab=vom}
N 790 -370 870 -370 {lab=vom}
N 790 -250 970 -250 {lab=vs}
N 900 -250 900 -190 {lab=vs}
C {iopin.sym} 710 -250 0 1 {name=p3 lab=vip}
C {iopin.sym} 1050 -250 0 0 {name=p4 lab=vim}
C {iopin.sym} 720 -510 0 1 {name=p5 lab=AVDD}
C {iopin.sym} 620 0 0 1 {name=p6 lab=AVSS}
C {sky130_fd_pr/nfet_01v8.sym} 850 -60 0 0 {name=Mtail
L=1
W=5  
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 710 -60 0 1 {name=M1
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {iopin.sym} 610 -120 0 1 {name=p7 lab=ib5u}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 770 -250 0 0 {name=Mip
L=2
W=5
nf=1 mult=4
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 990 -250 0 1 {name=Mim
L=2
W=5
nf=1 mult=4
model=nfet_01v8_lvt
spiceprefix=X
}
C {iopin.sym} 1020 -340 0 0 {name=p1 lab=vout}
C {lab_wire.sym} 790 -330 0 0 {name=p2 sig_type=std_logic lab=vom}
C {lab_wire.sym} 840 -190 0 0 {name=p8 sig_type=std_logic lab=vs}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 950 -450 0 0 {name=Mpcmm
L=2
W=5
nf=1 mult=2
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 810 -450 0 1 {name=Mpcmp
L=2
W=5
nf=1 mult=2
model=pfet_01v8_lvt
spiceprefix=X
}
