sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 

gabar init 0
gilasso init 100

instr 1
 kenv linseg 1, p3, 0.0001
 a1 randh p4*kenv, p5
 gabar = a1*p6
 out a1
endin

instr 2
 kenv linseg 1, p3, 0
 a1 pluck 8000*kenv, 1600, 1000, 0, 1
  a2 pluck 8000*kenv, 2400, 2400, 0, 1
  a1=a1+a2
  gabar = a1*p4
 out a1
endin

instr 3
 aenv linseg 0, 0, 1, p3, 1
 a1 bamboo 8000, 0.1, 1
 out a1
endin

instr 10
 kenv linseg 1,p3,0
 a1 oscil kenv*8000, 100*p4, 1
 a2 butterlp a1, 400
 out a2
endin

instr 11
 kenv linseg 0, p3/2, 1, p3/2, 0
 kp expseg 3/4, p3/2, 1, p3/2, 1
 a1 pluck kenv*18000, kp*800*p4, 400, 0, 1
 a2 butterlp a1, 1400
 out a2
endin


instr 100
 a1 init 0

 a1 delay gabar,240/80
 out gabar
 gabar=a1
endin
