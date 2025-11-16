;imagin the mexican bar playing polka next door
;or the neighbors downstairs with the 
;illegal crocodile in a fishtank
;playing loud beats, 
;while your friend meditates

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 
isi ftgen 4, 0, 8192, 10, 10,9,8,7,6,5,4,3,2,1,10,9,8,7,6,5,4,3,2


instr 1
a1 oscil 4000, p4/2, 4
a2 randh a1, p4*100 
a2 butterlp a2, a1
a3 oscil 10000, p4, 2
out a2+a3
endin

instr 2
krill linseg p4,p3,p5
kenz linseg 0,0.01,8000,p3-0.02,8000,0.01,0
a1 oscil kenz, krill, 1
out a1
endin

instr 3
krill linseg p4,p3,p5
kenz linseg 0,0.01,8000,p3-0.02,8000,0.01,0
a1 oscil kenz, p4, 4
a1 butterlp a1, krill
out a1
endin

instr 4
p3=p3*4
krill linseg p4,p3,p5
ktrill linseg p5,p3,p4
a1 pluck 8000, krill, 10,0,1
a2 streson a1, ktrill, 0.9
a3 butterlp a2, krill*3
out a3
endin


instr 100
endin
