sr = 48000
kr = 480
ksmps = 100
nchnls = 2
isine ftgen 1, 0, 8192, 10, 1     isine ftgen 2, 0, 8192, 10, 10,9,8,7,6,5,4,3,2,1,10,9,8,7,6,5,4,3,2  ;2 squares at decades   ihorn ftgen 3, 0, 512, 7, -1, 256, 1, 256, -1isquare ftgen 4, 0, 512, 7, -1, 256, -1, 0, 1, 256, 1instr 1 apch linseg p5, p3, p6 a1 oscil 8000, apch, p4 outs a1,a1endin