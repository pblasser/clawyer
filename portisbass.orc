
sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 23, 1, 1, 1, -1, 1000, -1
ifn ftgen 2, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1
ifn ftgen 3, 0, 16384, 10, 1
ifn ftgen 4, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0


;100 120 110 100
;55 56 50 
;89 73 67 59

;100 length, sometimes 800 !


instr 1
;kron expseg p4, p3, p4
kenv expseg 1,0.05,120000,p3-0.1,0.1
a1 oscil kenv, p4, 4
a2 butterlp a1,400
out a2
endin

instr 2
;kron expseg p4, p3, p4
kenv linseg 0, p3/2, 120000, p3/2, 0
a1 oscil kenv, p4, 3
a2 butterlp a1,400
out a2
endin

instr 100
endin
