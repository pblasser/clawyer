sr = 48000
kr = 480
ksmps = 100
nchnls = 1


;the question is
;about jungle techno
;of the antiquities

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 8, 2, 1, 28/27,16/15,4/3,3/2,14/9,8/5,2
ibase=55

instr 1
asig linseg 8000, 0.001, 0
asig noise asig, 0
awg wguide1 asig, 1200, 1800, 0.9
out awg
;acrotalon stix 8000,1
;out acrotalon
;casted phisem perc
;to ancient ensemble
;(macro)
endin

instr 2
;atympanon pluck 8000, 200, 300, 1, 3, 0.1, 1
;out atympanon
asig linseg 8000, 0.05, 0
asig oscil asig, p4*0.567, 1     

awg wguide2 asig, p4, p4+12, p4*2.13, p4*3.45, 0.24999,0.25
out awg
endin

instr 3
akoudounion gogobel, 8000, 1200, 0.8, 0.2, 1, 10, 1, 1
out akoudounion
endin

instr 4
a1 linseg 8000, p3, 0
acymbalum noise a1, 0
out acymbalum
endin

instr 5
asistrum sleighbells 8000, 0.5
out asistrum
endin

instr 6
a1 linseg 8000, p3, 0
a2 linseg p4, p3, p5
a1 oscil a1, a2, 1
a1 butterlp a1, 800
out a1
endin

instr 7
asyrinx fmpercfl 8000, p4, p5, 5, .01, 6
out asyrinx
endin

instr 8 
kenv linseg 8000, p3, 8000
inote table p4%8,2
inote = inote * (2^floor(p4/8)) * 55 *4
akithara pluck kenv, inote, inote, 0, 1
out akithara 
endin

;freeverb








