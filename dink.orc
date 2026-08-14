;call the euro ambulance with hash
;call the wife who dinks ceramic with he leters
;a gong
;pitch, tar, pine sap
;makes my earplugs
;i groan numbers
;the environment is varied (randomiz params)
;but the dinking ceramic bowls are fixed
;to create a misophoniac objet petit a



sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 
ifn ftgen 4, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1

gagasso init 0
gilasso init 100

instr 1
 kgliss linseg p4, p3, p5
 kligs linseg p5, p3, p4
 aenv expseg 0.0001,0.001,1000,p3-0.2,0.00001
 aenv butterlp aenv, 5000
 a1 oscil aenv, kgliss, 2
 a2 oscil aenv, kligs+a1, 2
gagasso = gagasso + a1
 out a2
endin

instr 2
kph linseg 4,p3,4
kpho=4
;a1 voice 1.1, p4, kpho, 0.4, 1.5, 0.02,3,2
;a1 fmvoice 2000,p4,10,90,1,1, 2,2,2,2,2
 ;out a1

kenv linseg 0, 0.05, 100, p3-0.1, 100, 0.05, 0
kvb oscil 0.01, 1.5, 2
kvbs oscil 0.01, 1.7, 2
asig buzz  kenv, p4*(1+kvb), 5, 2
afil fofilter asig, 600*(1-kvb*20), 0.01, 0.04
afils fofilter asig, 800*(1-kvbs*10), 0.01, 0.04
   out afil+afils

endin

instr 3
 aq        barmodel    1, 1, 12, 0.001, 0.123, 5, 0.13, 200,1.1
 out aq
endin

instr 4
 ir random 100, 1000
 aq oscil 1000, ir, 1
 out aq
endin

instr 5
 ir random 10, 200
 kenv linseg 0, p3/2, 4000, p3/2, 0
 aq oscil kenv, ir, 3
 out aq
endin

instr 6
 ir random 700, 900
 irr random 0.1, 1
 kenv linseg 0, p3/2, 4000, p3/2, 0
 a1 oscil 0.2, irr, 4
 aq oscil kenv, ir*(1+a1)*(1+(kenv/60000)), 1
 out aq
endin

instr 7
 ir random -1,1
 irr random 1000, 10000
 kenv linseg 0, p3/2, 1000, p3/2, 0
 a1 noise kenv, ir
 kdrong linseg 0, p3/3, irr, p3*2/3, 0
 a1 butterlp a1, kdrong
 out a1
endin



instr 100
 a1 reverb gagasso, 0.1
 out a1
 gagasso=0
endin
