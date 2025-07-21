
sr = 44100
kr = 441
ksmps = 100
nchnls = 1
gibase = 10.301

;::::::::::::::::::::Gen Tables::::::::::::::::::::::::::::
ifn ftgen 1, 0, 8192, 10, 1             ;:::::::Sine:::::::
ifn ftgen 2, 0, 8192, 19, .5, 1, 270, 1 ;:::::::Sigmoid::::
ifn ftgen 3, 0, 8192, 7, 1, 2730, 1, 1000, 0 ;:::::Pulse:::
ifn ftgen 4, 0, 8192, 10, 10, 5, 4, 3, 2
ifn ftgen 5, 0, 8192, 10, 10, 5, 1, 2
ifn ftgen 6, 0, 8192, 10, 10, 3, 2
ifn ftgen 7, 0, 8192, 10, 10, 1

;::::::::::::::::::::Volumes:::::::::::::::::::::::::::::::
gibass = 1.6
giscel = .4
gichor = 1


;:::::::::::::::::::Instrument Specific::::::::::::::::::::
gi5prev = gibase*16

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 1 ;::::::::::::Bass::::::::::::::::::::::::::::::::::
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ivelo = p4*6+2000
 iatt = rnd(40)/900
 ken expseg 1, iatt, ivelo, 4, 1
 ken2 expseg 1, iatt+.02, ivelo, 2, 1
 kmainenv linseg 0, .01, 1, p3-.11, 1, .1, 0
  kenv = ken*kmainenv
  kenv2 = ken2*kmainenv
 irange = gibase*4
 inote = irange*p5
  istr = int(2*frac(inote*323))
  istrin = (inote < 65 ? 4 : 6)
   istring = istrin + istr
   a1 oscil kenv, inote, istring
   a2 oscil kenv2, inote*2, 1
     at tone a1+a2/2, 200
     a2 = at
 out a2*gibass
endin

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 2 ;::::::::::::Scelesthe:::::::::::::::::::::::::::::
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ivelo = p4*6+2000

 idur = p3
 irange = gibase*32
 inote = irange*p5
 ipan =((.5/irange)*inote)
 kmainenv linseg 1, idur-.1, 1, .1, 0
 kenv expseg ivelo*1.3, .1, ivelo, 6, 1
 gkbell oscil 1, 5, 1
 
 afof fof kenv*kmainenv+gkbell*800, inote, 800, 0, 800, .001, .04, .004, 200, 1, 2, idur, 0, 1
  at butterlp  afof, 1000+gkbell*100
 out (at)*giscel
endin

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 3 ;::::::::::::Scelesthe:::::::::::::::::::::::::::::
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ivelo = p4

 idur = p3
 irange = gibase*16
 inote = irange*p5

 kmainenv linseg 1, idur-.05, 1, .05, 0

  kcross expseg .4, 4, .001
  imod = 5/inote
   kmod linseg imod, 6, 0
  kenv expseg  ivelo, .5, ivelo*.8, 5, ivelo*.4
  a5 grain kenv*kmainenv, inote*2, 20, 0, 0, .2, 4, 3, 1
    a6 butterlp a5, 1000
 aout = (a6*2)*.5
 out aout*gichor
endin
