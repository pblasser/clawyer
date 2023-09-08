sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 

gabar init 0
gilasso init 100
gib init 100

instr 1
 kenv linseg 1, p3, 0.0001
 a1 randh 6000*kenv, 2700
 gabar = a1*p4
 out a1
endin

instr 2
 kenv linseg 1, p3, 0
 a1 pluck 8000*kenv, gib*16, 1000, 0, 1
  a2 pluck 8000*kenv, gib*24, 2400, 0, 1
  a1=a1+a2
  gasplash = a1*p4
 out a1
endin

instr 3
 aenv linseg 0, 0, 1, p3, 1
 a1 bamboo 8000, 0.1, 1
  gasplash = a1*p4
 out a1
endin

instr 4
p3=4
 a1        barmodel    1, 1, 12, 0.001, 0.123, 5, 0.13, 200,1.1
  a2 mpulse 32000, 4
 a2	nreverb	a2, 2, 1
 
  gasplash = a2*p4
 out a2

endin

instr 10
 kenv linseg 1,p3,0
 a1 oscil kenv*8000, gib*p4, 1
 a2 butterlp a1, 400
 out a2
endin

instr 11
 kenv linseg 0, p3/2, 1, p3/2, 0
 kp expseg 3/4, p3/2, 1, p3/2, 1
 a1 pluck kenv*18000, kp*gib*8*p4, 400, 0, 1
 a2 butterlp a1, 1400
 out a2
endin


instr 100
 a1 init 0

 a1 delay gabar,240/80
 a2 delay gasplash, 480/80
 out gabar+gasplash
 gabar=a1
 gasplash=a2
endin
