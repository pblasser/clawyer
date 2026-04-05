;sine by sine
;tri by tri
;sq by sq

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

ifn ftgen 3, 0, 1024, 7, 1, 512, 1, 0, 0, 512, 0
ifn ftgen 1, 0, 16384, 10, 1
ifn ftgen 2, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0


instr 1

endin

instr 2
inote=((p4%1)*10)+(((p4%10)-(p4%1))/10)
inotetoo=((p3%1)*10)+((p3%10)-(p3%1))/10
kron linseg inote, p3, inotetoo
kron oscil 8000, kron, 1
knote linseg p4, p3, p5
a1 oscil kron, knote, 1
out a1
endin

instr 3
inote=((p4%1)*10)+(((p4%10)-(p4%1))/10)
inotetoo=((p3%1)*10)+((p3%10)-(p3%1))/10
kron linseg inote, p3, inotetoo
kron oscil 8000, kron, 2
knote linseg p4, p3, p5
a1 oscil kron, knote, 2
out a1
endin

instr 4
inote=((p4%1)*10)+(((p4%10)-(p4%1))/10)
inotetoo=((p3%1)*10)+((p3%10)-(p3%1))/10
kron linseg inote, p3, inotetoo
kron oscil 8000, kron, 3
knote linseg p4, p3, p5
a1 oscil kron, knote,3
a1 butterlp a1, 100
out a1
endin




instr 100
endin
