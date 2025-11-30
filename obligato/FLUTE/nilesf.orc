sr = 44100
kr = 441
ksmps = 100
nchnls = 1
gibase = 10.501

;:::::::::::::::::::::::::::::::::::::::::::::::For instr 3
gilast=gibase*32

;::::::::::::::::::::::::::::::::::::::::::::::: Volumes
giflute = .4
gisce = 1.5

;::::::::::::::::::::::::::::::::::::::::::::::: Gen Tables
ifn ftgen 1, 0, 8192, 10, 1 ;Sine
ifn ftgen 2, 0, 8192, 19, .5, 1, 270, 1 ;Sigmoid
ifn ftgen 3, 0, 8192, 10, 10, 5

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 1 ;::::::::::::::::::::::::::::::::::::::: Flute
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4+2000
  idur      =           p3
  irange    =           gibase*32
   inote    =           irange*p5
   ilast    =           (gilast < inote ? inote-10 : inote+10)
    knote   expseg      ilast, rnd(.03), inote, p3, inote

  ist       =           frac(inote*323)
   istl     =           irange*10/inote
    istop   =           ist*20+istl

  kvibc     linseg      3, p3/2, 5, p3/2, 3
   kvib     oscil       500, kvibc, 1
   kco      linseg      500, p3, 300
    kcon    =           kco+kvib/2
   i1len    =   rnd(1)+.5
   i2len    =   rnd(1)+.5
   i3len    =   rnd(1)+.5
   i4len    =   rnd(1)+.5
   i1       =   rnd(.4)+.3
   i2       =   rnd(.4)+.2
   i3       =   rnd(.4)+.2
   i4       =   rnd(.4)+.2
   ken      expseg      ivelo*1.6, (rnd(.02)+.05), ivelo, i1len, i1*ivelo, i2len, i2*ivelo, i3len, i3*ivelo, i4len, i4*ivelo, 4, 1
   iatt     =           rnd(.06)+.05
   kmainenv linseg      .01, iatt, 1, p3-.09, 1, .04, .01
    kenv    =           kmainenv*(ken*4+kvib*.7)
  
   kdur    linseg      .02, iatt, .008, 8, .006
   a1        fof         kenv, knote, 500+istop, 0, 100, .005, kdur, .007, 200, 1, 2, idur
   ar1     reson       a1, 1500, 500, 1
   at1     tone        a1, kcon
   ar2     reson       a1, 2000, 500, 1

   asig gain (ar1/6+ar2/6+at1), kenv, 2
            out        giflute*asig
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 2 ;::::::::::::::::::::::::::::::::::::::: Sclesthe
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4
  irange    =           gibase*16
   inote    =           irange*p5
   ibell2   =           (frac(inote*323)-.5)*.2
   inote2   =           inote*(inote < 300 ? 4 : 2) +ibell2

  gkvib     oscil       .4, 3, 1
  kdecay    expseg      ivelo*1.9, .2, ivelo, 8, 1
   iatt     =           rnd(.02)+.01
   iatt2    =           rnd(.02)+.01
   idelay   =           rnd(.03)
    ashape  linseg      0, iatt, 1, p3-iatt-.1, 1, .1, 0
    ashape2 linseg      0, idelay, 0, iatt2, 1, p3-iatt2-.1, 1, .1, 0
     aenv   =           kdecay*(1+gkvib)*ashape
     aenv2  =           kdecay*(1+gkvib)*ashape2 

itable = (rnd(1) < .5 ? 1 : 3)

  a1        oscil       aenv, inote, itable
  a2        oscil       aenv2, inote2, 1

            out        (a1+a2)*gisce
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 3 ;::::::::::::::::::::::::::::::::::::::: Flute Bends
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4+2000
  idur      =           p3
  irange    =           gibase*32
   inote    =           irange*p5
   ilast    =           (gilast < inote ? inote-10 : inote+10)
    knote   expseg      ilast, rnd(.03), inote, p6, inote*p7, p8, inote*p9, 1, inote*p9

  ist       =           frac(inote*323)
   istl     =           irange*10/inote
    istop   =           ist*20+istl

  kvibc     linseg      3, p3/2, 5, p3/2, 3
   kvib     oscil       500, kvibc, 1
   kco      linseg      500, p3, 300
    kcon    =           kco+kvib/2
   i1len    =   rnd(1)+.5
   i2len    =   rnd(1)+.5
   i3len    =   rnd(1)+.5
   i4len    =   rnd(1)+.5
   i1       =   rnd(.4)+.3
   i2       =   rnd(.4)+.2
   i3       =   rnd(.4)+.2
   i4       =   rnd(.4)+.2
   ken      expseg      ivelo*1.6, (rnd(.02)+.05), ivelo, i1len, i1*ivelo, i2len, i2*ivelo, i3len, i3*ivelo, i4len, i4*ivelo, 4, 1
   iatt     =           rnd(.06)+.05
   kmainenv linseg      .01, iatt, 1, p3-.09, 1, .04, .01
    kenv    =           kmainenv*(ken*4+kvib*.7)
  
   kdur    linseg      .02, iatt, .008, 8, .006
   a1        fof         kenv, knote, 500+istop, 0, 100, .005, kdur, .007, 200, 1, 2, idur
   ar1     reson       a1, 1500, 500, 1
   at1     tone        a1, kcon
   ar2     reson       a1, 2000, 500, 1

   asig gain (ar1/6+ar2/6+at1), kenv, 2
            out        giflute*asig
endin
