Title: Simple Highpass filter

** High pass element
Cbyp	vin 	n1 	1p	
Rhp	n1	GND	1k


** Stimuli
Vsin	vin	GND	0 PULSE(0 1 1n 1p 1p 10n 20n) 



.CONTROL
  save all
  OP
  TRAN 1p 80n
  
.ENDC 

.END
