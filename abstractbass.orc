;imagin the mexican bar playing polka next door
;or the neighbors downstairs with the 
;illegal crocodile in a fishtank
;playing loud beats, 
;while your friend meditates

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 23, 1, 1, 1, -1, 1000, -1
ifn ftgen 2, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1
ifn ftgen 3, 0, 16384, 10, 1
ifn ftgen 4, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0


instr 1
kron expseg p4, p3, p4
kenv linseg 0,0.05,120000,p3-0.1,12000,0.05,0
a1 oscil kenv, kron, 1
a2 butterlp a1,400
out a2
endin

instr 2
kron expseg p4, p3, p5
kenv linseg 0,0.05,4000,p3-0.1,4000,0.05,0
a12 oscil 1, kron/10, 2
a12 = a12+1
a1 oscil kenv*a12, kron, 2
a2 butterlp a1,400
out a2
endin
instr 3
kron expseg p4, p3, p5
aenv expseg 0.00001, 0.001, 22000,p3-0.001,0.00001
a1 oscil aenv, kron, 3
a2 butterlp a1,6200
out a2
endin

instr 4
kron expseg p4, p3, p5
kenv linseg 0,p3/2,8000,p3/2,0
a1 oscil kenv, kron, 4
a2 butterlp a1,6200
out a2
endin




instr 100
endin
