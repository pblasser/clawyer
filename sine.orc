sr = 24000
kr = 240
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1

gagasso init 0

instr 1
 aenv linseg 0,0.01, p4/2,0.01, p4/2, 0.01,0
 gagasso oscil aenv, 440*p5, 2
 a1 oscil p4/1, 440*p5/410, 1
 a1 oscil a1, 440*p5/16,1
 out a1
endin

instr 2
 aenv linseg 0,0.01, p4/2,p3-0.02, p4/2, 0.01,0
 a1 oscil p4/2, 440*p5, 2
 out a1
endin

instr 10
 ares mpulse 64000, 0.1
out ares
endin


instr 100
 a1 reverb gagasso, 20
 out a1
endin
