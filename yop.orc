sr = 8000
kr = 80
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1

gagasso init 0
gilasso init 100

instr 1
 kenv linseg 0,0.1,p4,p3,0
 a1 oscil kenv, p5, 1
 kgliss linseg gilasso, 0.1, p5
 a1 pluck p4,kgliss,p5,0,1
 gagasso = a1 
 gilasso=p5
; out a1
endin

instr 2
 kenv linseg 0,p3,p4
kenvq linseg p4,p3,0
 a1q oscil kenvq*0.1, gilasso, 2
 a1 oscil kenv, p5+a1q, 2
 out a1
endin


instr 3
 gilasso = p5
endin

instr 4
a1 mpulse 64000, 0.1
 gagasso = a1 + gagasso
endin

instr 5
a1 mpulse 64000, 0.11
 gagasso = a1 + gagasso
endin

instr 6
a1 tambourine p4, 1,4,0,0,5000,7600,14500
 gagasso = a1 + gagasso
endin


instr 10
 ares mpulse 64000, 0.1
out ares
endin


instr 100
 a1 init 0
 a1 delay gagasso,14
 out gagasso
 gagasso=a1
endin
