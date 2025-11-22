;imagin the mexican bar playing polka next door
;or the neighbors downstairs with the 
;illegal crocodile in a fishtank
;playing loud beats, 
;while your friend meditates

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

gkbass init 40
ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 
isi ftgen 4, 0, 8192, 10, 10,9,8,7,6,5,4,3,2,1,10,9,8,7,6,5,4,3,2
ifn ftgen 5, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1


instr 1
kron expseg p4, p3, p5
kenv linseg 0,0.05,12000,p3-0.1,1200,0.05,0
a1 oscil kenv, kron, p6
a2 butterlp a1,900
out a2
endin

instr 2
gkbass linseg p4, p3, p5
endin


instr 3
gkbass oscil 5, p6, 5
gkbass = gkbass + p4
endin


instr 23
p3=p3*4
kwill linseg 0,p3/2,24000,p3/2,0
a1 pluck kwill, gkbass, 10,0 ,1
a1 butterlp a1, 400
out a1
endin

instr 100
endin
