sr = 48000
kr = 480
ksmps = 100
nchnls = 1

ifn ftgen 1, 0, 1024, 7, 0, 256, 1, 512, -1, 256, 0
ifn ftgen 2, 0, 16384, 10, 1
ifn ftgen 3, 0, 8192, 10, 10, 8, 7 
ifn ftgen 4, 0, 1024, 19, 0.5, 0.5, 270, 0.5
ifn ftgen 5, 0, 1024, 7, -1, 512, -1, 0, 1, 512, 1





gagasso init 0
gilasso init 100
gitubap init 100
gibase init 50
gkverb init 1

instr 1
 p3=p3/2 ;relt to dely
  kdyn linseg rnd(1.4)+.3,  rnd(.1),  rnd(1)+1,  rnd(.5),  rnd(1)
 ifir = 200
 isec = 300
 iatt1 = rnd(.2)+.2
 iatt2 = rnd(.2)+.2
  kcra linseg 0, p3/3, 0, iatt1, ifir, iatt1, 0, p3/3, 0, iatt2, isec, iatt2, 0
 irange = gibase*2
  inote = irange* (2.0^( p4/28.0))
   knot linseg gitubap, p3*rnd(.033), inote, 1, inote
 ivalve = int(4*frac(inote*323))
  kvibc linseg 3, p3, 2
  kvibr oscil 1, kvibc, 2
   iatt =5000*(rnd(.02)+p3/100)
   kmainenv linseg 0.001, iatt, 1, p3-iatt-.1, 1, .1, 0.001
    kenv = ((1000)*kdyn+kvibr*100)*kmainenv*100
 ;knote = knott+kvibr*inote/400
 kformcon linseg 0, .2, 1, p3-0.2, 0
  kform = 90+ivalve*10+kformcon*70
 a1 fof kenv, knot/4, kform, 0, 200, .001,.002,.001, 100, 2, 4, p3
 kcon linseg 900, .1, 1800, p3/2, 1500, p3/2, 900
  a2 butterlp a1, kcon*kdyn
   a3 tone a2, 700
    a4 gain a2, kenv
 out a4
 gagasso=gagasso+a1
 gitubap=inote
endin



instr 2
 iprev=i(gkverb)
 gkverb linseg iprev, p3, p4
 
endin


instr 3
 inote = gibase* (2.0^( p4/28.0))
 knote linseg gitubap, 0.01+rnd(p3/10), inote, p3, inote
 iatt = rnd(0.9)
 kenv linseg 0,iatt,500,p3-iatt*2,200,iatt,0
 a1 oscil kenv, knote, 5
 a2 butterlp a1, 800
 gagasso=gagasso+a2
 gitubap=inote
endin

instr 100
 kzo oscil 1, 0.5, 2
 a1 reverb gagasso, gkverb;+kzo
 out a1
 gagasso=0
endin
