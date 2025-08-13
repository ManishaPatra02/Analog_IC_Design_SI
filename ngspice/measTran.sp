Title: transient experiement: rise, fall, delat, period, etc.

** RC Network 
R1	vin	vout	1k
C1	vout	GND	1p

**Stimuli
Vsin	vin	GND	0 PULSE(0 5 1n 1p 1p 10n 20n) 


** Rise/Fall 10-90%
.MEASURE TRAN tr1090 TRIG v(vout) VAL=0.5 RISE=1 TARG v(vout) VAL=4.5 RISE=1 
.MEASURE TRAN tf9010 TRIG v(vout) VAL=4.5 FALL=1 TARG v(vout) VAL=0.5 FALL=1 
** Rise/Fall 20-80%
.MEASURE TRAN tr2080 TRIG v(vout) VAL=1.0 RISE=1 TARG v(vout) VAL=4.0 RISE=1 
.MEASURE TRAN tf8020 TRIG v(vout) VAL=4.0 FALL=1 TARG v(vout) VAL=1.0 FALL=1 
** Delay Rise Fall
.MEASURE TRAN tdrise TRIG v(vin)  VAL=2.5 RISE=1 TARG v(vout) VAL=2.5 RISE=1 
.MEASURE TRAN tdfall TRIG v(vin)  VAL=2.5 FALL=1 TARG v(vout) VAL=2.5 FALL=1 
** Pulse width/ Period
.MEASURE TRAN PWidth TRIG v(vout)  VAL=2.5 RISE=1 TARG v(vout) VAL=2.5 FALL=1 
.MEASURE TRAN Period TRIG v(vout)  VAL=2.5 RISE=1 TARG v(vout) VAL=2.5 RISE=2 


.CONTROL
  OP
  TRAN 10p 40n
.ENDC

.GLOBAL GND
