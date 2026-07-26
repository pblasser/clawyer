;just sines with different hiphop envelopes

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1


ifn ftgen 1, 0, 1024, 7, 0, 20, 1, 300, 0
ifn ftgen 2, 0, 1024, 7, 0, 200, 1, 200, 0
ifn ftgen 3, 0, 1024, 7, 0, 300, 1, 20, 0

ifn ftgen 4, 0, 1024, 7, 0, 20, 1, 200, 0, 500, 0, 20, 1, 200, 0
ifn ftgen 5, 0, 1024, 7, 0, 100, 1, 100, 0, 500, 0, 100, 1, 100, 0
ifn ftgen 6, 0, 1024, 7, 0, 200, 1, 20, 0, 500, 0, 200, 1, 20, 0

ifn ftgen 7, 0, 1024, 7, 0, 20, 1, 100, 0, 300, 0, 20, 1, 100, 0, 300, 0, 20, 1, 100, 0
ifn ftgen 8, 0, 1024, 7, 0, 100, 1, 100, 0, 200, 0, 100, 1, 100, 0, 200, 0, 100, 1, 100, 0
ifn ftgen 9, 0, 1024, 7, 0, 200, 1, 10, 0, 200, 0, 200, 1, 10, 0, 200, 0, 200, 1, 10, 0



ifn ftgen 10, 0, 16384, 10, 1



instr 1
p3=p3*10
aenv oscil 8000, p5/10, p6
arts oscil (10^(p6/3)), p5/p6, p6
aenv butterlp aenv, 100
a1 oscil aenv, p4+arts, 10
out a1
endin

instr 2
p3=p3*8
aenv oscil 1, p5/18, p6
aenv = 6000* (aenv ^ 5)
aenv butterlp aenv, 100
a1 oscil aenv, p4, 10
out a1
endin

instr 3
p3=p3*3
aenv oscil 1, p5/3, p6
aenv = 3000* (aenv ^ 20)
aenv butterlp aenv, 200
a1 oscil aenv, p4, 10
a2 randh aenv/4, p4*4
out a1+a2
endin


instr 100
endin
