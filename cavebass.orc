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
kenv linseg 0,p3/2,12000,p3/3,0
a1 rand kenv
a2 lowpass2 a1, kron, 100
out a2
endin

instr 2
kron expseg p4, p3, p5
kenv linseg 0,p3/2,12000,p3/3,0
a1 rand kenv
a2 lowpass2 a1, kron, 100
out a2
endin

instr 3
kron expseg p4, p3, p5
krontoo linseg p5, p3, p4
kenv linseg 0,p3/2,120000,p3/3,0
a1 mpulse kenv, 10/kron
a2 lowpass2 a1, kron, 1
out a2
endin

instr 4
kron expseg p4, p3, p5
kenv linseg 0,p3/2,12000,p3/3,0
a11 rand kenv*20
a22 lowpass2 a11, kron/20, 30
a1 rand a22
a2 lowpass2 a1, kron, 100
out a2
endin


instr 100
endin
