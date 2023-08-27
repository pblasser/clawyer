sr = 24000
kr = 240
ksmps = 100
nchnls = 1
gibase = 160
gi5prev = 200
gi2prev = 60
giharm = .1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
instr 1
 iglis = (p6 > 0 ? p6 : 0.01)
 inote pow 2, p5/17
 iknot = gibase * p5
 anott expsega gi2prev,iglis,iknot,p3,iknot
 aenv linseg p4, p3, 0.01
 a1 oscil aenv, anott, 1
 arat butterlp   a1, 550
 out arat*2
 gi2prev = iknot
endin

instr 4
 p3 = 4
 iatt = rnd(40)/100+.1
  kenv expseg 1, iatt, p4/2, p3-.5, p4/2, .1, 1
  inote = gibase*4*p5
   knote expseg gi5prev, iatt-.2, inote, p3, inote

 a1 oscil kenv, knote, 2
 out a1*giharm
 gi5prev = inote
endin

instr 5
 ares guiro p4, p3/8,18
 out ares
endin
instr 6
 ares bamboo p4, p3/8, 2, 0, 0, 1200, 1333, 888
 out ares
endin
instr 8
 ares sleighbells p4, p3
 out ares
endin
instr 10
 iknot = gibase * p5 * 4
 kenv  linseg 0, p3-0.1, p4/2,0.1,1
 a1 oscil kenv, iknot, 2
     out a1
endin
