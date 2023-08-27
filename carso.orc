sr = 24000
kr = 240
ksmps = 100
nchnls = 1
gibase = 440 * 3 / (2 * 128)
gi5prev = 200



;::::::::::::::::::::::::::::::::::::::::::::::: Gen Tables
ifn ftgen 1, 0, 8192, 10, 1           ;:::::::Sine:::::::
ifn ftgen 2, 0, 8192, 19, .5, 1, 270, 1 ;:::::::Sigmoid::::
ifn ftgen 3, 0, 8192, 10, 10, 8, 7    ;:::::::Sine:::::::
ifn ftgen 4, 0, 8192, 10, 10, 8, 4
ifn ftgen 5, 0, 8192, 10, 10, 7, 1, 2
ifn ftgen 6, 0, 8192, 10, 10, 5, 2
ifn ftgen 7, 0, 8192, 10, 10, 4
ifn ftgen 8, 0, 8192, 20, 1
ifn ftgen 9, 0, 512, 7, -1, 400, 0, 112, 1

gitrumpet=.45
gibass=.7
giharm=.1

gitrumpetprev=1
gibassprev=1
giharmprev=1

 giphrase = 6+rnd(6)

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 2 ;::::::::::::Trumpet:::::::::::::::::::::::::::::::
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  kdyn linseg rnd(1)+1,  rnd(.1),  rnd(1)+1,  rnd(.5),  rnd(1)
 ifir = 200*(rnd(.3)+.7)/p4
 isec = 300*(rnd(.3)+.7)/p4
 iatt1 = rnd(.2)+.2
 iatt2 = rnd(.2)+.2
  kcra linseg 0, p3/3, 0, iatt1, ifir, iatt1, 0, p3/3, 0, iatt2, isec, iatt2, 0
 irange = gibase*16
  inote = irange*p5
   knot linseg gitrumpetprev, rnd(.5), inote, 1, inote
    knott = knot*(1/(kcra/(kdyn*12)+1))
 ivalve = int(4*frac(inote*323))
  kvibc linseg 3, p3, 1
  kvibr oscil 1, kvibc, 1
   iatt =5000*(rnd(.02)+p3/100)/p4
   kmainenv linseg 0.001, iatt, 1, p3-iatt-.1, 1, .1, 0.001
    kenv = ((1000+.9*p4)*kdyn+kvibr*100)*kmainenv
 knote = knott+kvibr*inote/400
 kformcon linseg 0, .2, 1, 4, 1
  kform = 690+ivalve*10+p4/40+kformcon*70
 a1 fof kenv, knote, kform, 0, 600, .001,.002,.001, 200, 3, 2, p3
 agrain grain 8000, inote, 30, 1000, inote/400, .08, 3, 8, 1
 kcon linseg 900, .1, 1800, p3/2, 1500, p3/2, 900
  a2 butterlp a1, kcon*kdyn+p4/40
   a3 tone a2, 700
    a4 gain a3+agrain*((inote+2000)/180000), kenv
 out (a4)*gitrumpet
 gitrumpetprev=inote
endin

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 3 ;::::::::::::Bass::::::::::::::::::::::::::::::::::
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 iatt = (rnd(40)+20)/1200
  kenv1 linseg 0, iatt, 1, p3-.1-iatt, 1, .1, 0
 kenv2 expseg p4, 22, 1
  kenv = kenv1*kenv2
 irange = gibase*4
  inote = irange*p5
 istr = int(2*frac(inote*323))
 istrin = (inote < irange*3/2 ? 4 : 6)
  istring = istrin + istr
  acon      oscil       4095, inote, 9
  a1        tablei      acon+4096, istring
  ar        reson       a1, inote*2, 50, 1
  at        tone        ar, 700
  a2        gain        at, kenv

  aat pluck p4, inote, inote,9,1

a1 sleighbells 8000, 0.1

 out (aat+a2+a1)*gibass
endin



;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

instr 4 ;::::::::::::Harmonium:::::::::::::::::::::::::::::

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
p3 = 4
 iatt = rnd(40)/100+.4

  kenv1 expseg 1, iatt, p4, p3-.5, p4, 1, 1

  kconv linseg 1, p3/2, .5, p3/2, 1

   kvib oscil .1, kconv*5, 1

  kenv=kenv1*(kvib+1)*kconv



 gkbell oscil 1, 3, 1

 gkbell2 oscil 1, 3.5, 1



 irange = gibase*16

  inote = irange*p5

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
p3 = .4
  a1 guiro p4, p5/2
a2 cabasa 8100-p4, p5
  out a1+a2
endin
