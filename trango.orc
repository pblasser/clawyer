sr = 24000
kr = 240
ksmps = 100
nchnls = 1
gibase = 60
gi5prev = 200
gi2prev = 60
giharm = .1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
instr 1
 iglis = (p6 > 0 ? p6 : 0.01)
 inote pow 2, p5/17
 iknot = gibase * inote
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
  kenv1 expseg 1, iatt, p4, p3-.5, p4, .1, 1
  kconv linseg 1, p3/2, .5, p3/2, 1
   kvib oscil .1, kconv*5, 1
  kenv=kenv1*(kvib+1)*kconv
 gkbell oscil 1, 3, 1
 gkbell2 oscil 1, 3.5, 1
 irange = gibase*4
  inot  pow 2, p5/17
  inote = irange*inot
   knote1 expseg gi5prev, iatt-.2, inote, p3, inote
 ire = int(5*frac(inote*323))
  kbell = (ire < 3 ? gkbell : gkbell2)
  iree = 3000/inote
   ireed = iree+ire
  knote=knote1*(kbell/250+1)
 a1 buzz kenv+kbell*300, knote, ireed, 1
  ar1 reson a1, 300, 200, 1
  ar2 reson a1, 400, 300, 1
  ar3 reson a1, 200, 100, 1
   kcon linseg 200, iatt, 400, p3, 300, 1, 300
    at tone a1, (kvib+1)*kcon
  a2 = ar1 + ar2 +ar3*at/100
  a3 butterlp a2, 4000
  a4 gain a3, kenv
 out a4*giharm
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
instr 2
 inote pow 2, p5/17
 iknot = gibase * inote * 4
 ijet =0.02
iatt = 0.1
idetk = 0.1
kngain = 0.015
kvibf linseg 5.925, p3, 2
kvamp = 0.1
kamp linseg 0, p3/2, p4, p3/2, 0
 asig wgflute kamp, iknot, ijet, iatt, idetk, kngain, kvibf, kvamp, 1
     out asig
endin
