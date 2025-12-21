;illegal intry
;forbidden to call the cops
;crackhead banging on he door
;three times hes in

sr = 48000
kr = 4800
ksmps = 10
nchnls = 1

gkbass init 40
ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 
isi ftgen 4, 0, 8192, 10, 10,9,8,7,6,5,4,3,2,1,10,9,8,7,6,5,4,3,2
ifn ftgen 5, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1
ifn ftgen 6, 0, 1024, 7, 0, 128, 1, 767, -1, 128, 0
ifn ftgen 7, 0, 16384, 10, 1,2,3,4
ifn ftgen 8, 0, 8192, 10, 10, 8 ,0,0,0,0,0,20 
isi ftgen 9, 0, 8192, 10, 10


instr 1
kenv linseg 0, 0.1, 8000, p3-0.2, 8000, 0.1, 0
kdopp linseg 1, p3, 1.1
asro oscil p5, 1, 5
a1 oscil kenv, (asro+p4)*kdopp, p6
out a1
endin

instr 2
kenv linseg 0, 0.1, 8000, p3-0.2, 8000, 0.1, 0
kdopp linseg 1, p3, 1.1
asro oscil p5, 1, 1
a1 oscil kenv, (asro+p4)*kdopp, p6
out a1
endin


instr 3
kenv linseg 0, 0.1, 8000, p3-0.2, 8000, 0.1, 0
kdopp linseg 1, p3, 1.1
asro oscil p5, 1, 1
a1 oscil kenv, (asro+p4)*kdopp, p6
out a1
endin




instr 100
endin
