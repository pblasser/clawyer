sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 

gagasso init 0
gilasso init 100

instr 1
 kgliss linseg p4, p3, p5
 kenv linseg 0,0.1,1000,p3-0.2,1000,0.1,0
 a1 oscil kenv, kgliss, 2
gagasso = gagasso + a1
 out a1
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



instr 100
 a1 reverb gagasso, 0.1
 out a1
 gagasso=0
endin
