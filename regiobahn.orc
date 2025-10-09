sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 

gkmainfreq init 200
gksecofreq init 200
gkmainangle init 0
gafeeder init 0

instr 1

 gkmainfreq linseg i(gkmainfreq), 0.1,  p4
 a1 expseg 0.001, p3/2, 0.633, p3/2, 0.001
 gkmainangle = a1-1
endin

instr 2
 gksecofreq = p4
 a1 expseg 0.001, 0.1, 0.633, p3, 0.001
 a2 cmp a1-1, "<", gafeeder
 a3 reson gafeeder*20, a1*p4, 100
 out a2*2000+(a1*a3)
endin


;add craftwork beat

instr 100
 a1 oscil 0.9999, gkmainfreq, 3
 a2 cmp a1, "<", gkmainangle
 a3 reson a2, gkmainfreq+10, 10
 a2 butterlp a2*8000, 1600


 awhir grain 3000, gksecofreq+gkmainfreq, 10, 10, 10, gkmainangle/-3+0.001, 2, 2, 1

 gafeeder oscil 0.9999, (gksecofreq/4)+gkmainangle*10, 3


 a2 reverb a2+a3, 0.5
 out a2+awhir
endin
