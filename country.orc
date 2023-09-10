sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 

gabar init 0
gaba init 0
gast init 0
gilasso init 100
gibasso init 100
gib init 100

instr 1
p3 = p3/10
 kenv linseg 1, p3, 0.0001
 a1 randh 6000*kenv, 2700
 gabar = a1*p4
 out a1
endin

instr 2
p3 = p3/10
 kenv linseg 1, p3, 0
 a1 pluck 8000*kenv, gib*16, 1000, 0, 1
  a2 pluck 8000*kenv, gib*24, 2400, 0, 1
  a1=a1+a2
  gasplash = a1*p4
 out a1
endin

instr 3
p3 = p3/10
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

instr 5
p3 = p3/10
 kenv expseg 1, p3, 0.00001
 idf[] init 30
 index=0
 while index < lenarray(idf) do
  idf[index] = rnd(5000)+500
  index+=1
 od
 kindex = 0
 a2 =0
 while kindex < lenarray(idf) do
  a1 oscil kenv*1000,idf[kindex]+a1/10,2
  a3 randh kenv*200, rnd(1200)+1000
  a2=a2+a1+a3
  kindex += 1
 od 
 out a2
endin


instr 10
 p3=p3/4
 kenv linseg 0,0.01,1,p3,0
 kfrq linseg gibasso, 0.01, gib*p4
 a1 oscil kenv*8000, kfrq, 1
 a2 butterlp a1, 400

 if p5==1 then
 gaba = gaba*(1-kenv) + a2
 else
  out a2
 endif
 gibasso = gib*p4
endin

instr 11
 kenv linseg 0, p3/2, 1, p3/2, 0
 kp expseg 3/4, p3/2, 1, p3/2, 1
 a1 pluck kenv*18000, kp*gib*8*p4, 400, 0, 1
 a2 butterlp a1, 1400
 if p5==1 then
  gast = gast*(1-kenv) + a2
 else
  out a2
 endif
endin

instr 12
endin ;spacebar delete

instr 100
 a1 init 0

 a1 delay gabar,240/80
 a2 delay gasplash, 480/80
 a3 delay gaba, 1920/80
 a4 delay gast, 1200/80
 out gabar+gasplash+gaba+gast
 gabar=a1
 gasplash=a2
 gaba=a3
 gast=a4
endin
