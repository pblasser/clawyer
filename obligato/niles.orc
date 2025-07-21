sr = 44100
kr = 441
ksmps = 100
nchnls = 2
gibase = 10.301

;:::::::::::::::::::::::::::::::::::::::::::::::For instr 3
ga1outl init 0
ga1outr init 0
gilast=0

;::::::::::::::::::::::::::::::::::::::::::::::: Volumes
gi1vol=1
gi2vol=.5
gi3vol=.5

;::::::::::::::::::::::::::::::::::::::::::::::: Gen Tables
ifn ftgen 1, 0, 8192, 10, 1 ;Sine
ifn ftgen 2, 0, 8192, 19, .5, 1, 270, 1 ;Sigmoid
ifn ftgen 3, 0, 8192, 20, 8 ;square window
ifn ftgen 4, 0, 8192, 7, 0, 2048, 1, 4096, -1, 2048, 0 ;saw

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 1 ;::::::::::::::::::::::::::::::::::::::: Scelesthe
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 idur = p3
 irange = gibase*32
 inote = irange*p5
 ipan =((.5/irange)*inote)
 kmainenv linseg 1, idur-.1, 1, .1, 0
  afofenv expseg p4, 8, 1
  gkfofcon oscil 3, 6, 1
   afof fof kmainenv*afofenv*.6, inote, 300+gkfofcon, 0, 200, .003, .02, .007, 200, 1, 2, idur, 0, 1
  kcross expseg .4, 4, .001
  imod = 2/inote
   kmod linseg imod, 6, 0
  kenv expseg  p4, .5, p4*.8, idur-.5, p4*.8
  kenvb expseg  p4, idur, p4/2
  kenv2 expseg 1, .01, p4, idur-.01, 1
   ken = kmainenv*(idur <= 1 ? kenvb : kenv)
   ken2 = (300/inote)*kmainenv*kenv2
   a3 fmb3 ken*4, inote, kmod, kcross, 0.05, 8, 1, 1, 1, 1, 1
   a4 fmb3 ken2*4, inote*2, kmod/4, kcross, 0.05, 8, 1, 1, 1, 1, 1
    a1reson reson a3, inote, 100, 1, 0
    a2reson reson a4, inote*2, 100, 1, 0
 aout = (afof+a1reson+a2reson)*gi1vol
 outs ipan*aout, (1-ipan)*aout
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 2 ;::::::::::::::::::::::::::::::::::::::: Bass
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 idur = p3
 irange = gibase*4
 inote = irange*p5
 ipan =((.5/irange)*inote)
  abassenv expseg p4, 8, 1
  klocalenv linseg 1, p3-.1, 1, .1, 0
  kcon expseg 1, 4, .4
   abass foscil 2*abassenv*klocalenv, inote, 1, 2, kcon, 1
   a1 pluck klocalenv*p4*8, inote, inote, 0,1
    a3 butterlp a1, 50
 aout = gi2vol*(abass+a3)
 outs ipan*aout, (1-ipan)*aout
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 3 ;::::::::::::::::::::::::::::::::::::::: Grain
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 ibase=gibase*32
  inote1=ibase*p5
  inote2=ibase*p6
 knote expseg inote1, 2, inote1, p3-4, inote2, 2, inote2
 kpan expseg rnd(1), p3, rnd(1)
 kcon expseg 3, p3/2, p7, p3/2, 10
 kampoffset oscil 1000, 1.5, 1
 kpitchoff oscil knote/32, 1.75, 1
 kamp = p4*10/kcon
  a1 grain kamp*6, knote, kcon, kampoffset, kpitchoff, .2, 4, 2, 1
 ga1outl = ga1outl+(a1*kpan)*gi3vol
 ga1outr = ga1outr+(a1*(1-kpan))*gi3vol
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 13;::::::::::::::::::::::::::::::::::::::: Grain Filt
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 kconl linseg p4, .5, p4, .01, gilast
  asig1l butterlp ga1outl, kconl
  asig2l reson ga1outl, kconl, 30, 1
   asigl = (200/p4)*(asig1l/8+asig2l)
 kconr linseg p4, .3, p4, .001, gilast
  asig1r butterlp ga1outr, kconr
  asig2r reson ga1outr, kconr, 10, 1
   asigr = (500/p4)*(asig1r/6+asig2r*.8)
 outs asigl, asigr
 ga1outl = 0
 ga1outr = 0
 gilast = p4
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 99;::::::::::::::::::::::::::::::::::::::: Volume
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
gi1vol=p4
gi2vol=p5
gi3vol=p6
endin