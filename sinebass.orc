;just sines with different hiphop envelopes

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1


ifn ftgen 1, 0, 16384, 10, 1



instr 1
p3=p3*10
aenv oscil 8000, 1/p5, 1
arts oscil aenv, p4, 1
out arts
endin


instr 100
endin
