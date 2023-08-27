sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1

gagasso init 0
gilasso init 100

instr 1
 kgliss linseg gilasso, 0.1, p5*880*4
 a1 pluck p4, kgliss, p5*55, 0, 1
 a2 pluck p4, kgliss+30, p5*55, 0, 1
 gilasso=p5*55
 gagasso=a1
 out a1+a2
endin

instr 2
 a1 fmbell p4/2, 880*p5, 1,1,0.1,6,2,2,2,2,2,1
 out a1
endin


instr 3
 a1 tambourine p4, 1,4,0,0,5000,7600,14500
 out a1
endin

instr 10
 ares mpulse 64000, 0.1
out ares
endin


instr 100
 a1 reverb gagasso, 20
 ;out gagasso
 gagasso=0
endin
