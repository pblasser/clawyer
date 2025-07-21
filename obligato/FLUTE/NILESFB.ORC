sr = 8000
kr = 80
ksmps = 100
nchnls = 1
gibase = 10.301

;:::::::::::::::::::::::::::::::::::::::::::::::For instr 3

;::::::::::::::::::::::::::::::::::::::::::::::: Volumes
giflute = 1
gisce = 1

;::::::::::::::::::::::::::::::::::::::::::::::: Gen Tables
ifn ftgen 1, 0, 8192, 10, 1 ;Sine
ifn ftgen 2, 0, 8192, 20, 1
ifn ftgen 3, 0, 8192, 10, 10, 6, 5, 4
ifn ftgen 4, 0, 8192, 10, 10, 6, 5, 4, 3, 2, 1
ifn ftgen 5, 0, 8192, 10, 10, 8, 5
ifn ftgen 6, 0, 8192, 10, 10, 6, 7, 4
ifn ftgen 7, 0, 8192, 10, 10, 6, 5, 4, 3
ifn ftgen 8, 0, 8192, 10, 10, 3, 5, 4, 5, 2

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 1 ;::::::::::::::::::::::::::::::::::::::: Oboe
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4/2+3000
  idur      =           p3
  irange    =           gibase*32
   inote    =           irange*p5

  kvibc     linseg      3, p3/2, 4, p3/2, 3
   kvib     oscil       500, kvibc, 1
   ken      expseg      1, rnd(.04)+.04, ivelo, 8, 1
   kmainenv linseg      .01, .005, 1, p3-.14, 1, .1, .01
    kenv    =           kmainenv*(ken+kvib)
   knote    =           inote*(1+kvib/100000)

  a1        pluck       8000, knote, inote, 0, 2, 1.1

   atube1   reson       a1, 600, 400, 1
   atube2   reson       a1, 700, 300, 1
   atube3   reson       a1, 800, 100, 1
   kcon expseg inote/8, .1, inote*2, 20, 600
    afilt tone atube1+atube2+atube3, kcon
     asig   gain        afilt, kenv

   ken2     expseg      1, rnd(.2), 1, rnd(.005)+.005, ivelo*(rnd(.25)+.3), 12, 1
    kenv2    =           kmainenv*(ken2+kvib)
   a2       pluck       8000, knote*(rnd(.02)+2), inote*(rnd(.02)+2), 0, 2, 1.05
   atube12   reson       a2, 900, 400, 1
   atube22   reson       a2, 800, 300, 1
   atube32   reson       a2, 1000, 100, 1
    afilt2 tone atube12+atube22+atube32, kcon
     asig2   gain        afilt2, kenv2

            out        giflute*(asig2+ asig)
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 2 ;::::::::::::::::::::::::::::::::::::::: Sclesthe
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4
  irange    =           gibase*16
   inote    =           irange*p5

  gkvib     oscil       .2, 3, 1
   iatt     =           p3/(rnd(1)+1)
    kshape  linseg      0, iatt, 1, p3-iatt-1, 1, 1, 0
     kenv   =           (1+gkvib)*kshape*ivelo
   knote    =           inote*(gkvib/140+1)

  iplace1   =           rnd(1)
  iplace2   =           rnd(1)
   kmo      linseg      iplace1, p3, iplace2
    kdens   =           40*(kmo+.2)

  iplace12   =           rnd(1)
  iplace22   =           rnd(1)
   kmo2      linseg      iplace12, p3, iplace22
    kdens2   =           40*(kmo2+.2)

  iplace13   =           rnd(1)
  iplace23   =           rnd(1)
   kmo3      linseg      iplace13, p3, iplace23
    kdens3   =           40*(kmo3+.2)

  iplace1b   =           rnd(1)
  iplace2b   =           rnd(1)
   kmob      linseg      iplace1b, p3, iplace2b
    kdensb   =           40*(kmob+.2)

  ab2       grain       1000, knote/4, kdensb/8, 500, 8, .5, 4, 2, p3
  ab        grain       1000, knote/2, kdensb/4, 500, 8, .5, 4, 2, p3
  a1        grain       1000, knote, kdens, 500, 8, .1, 3, 2, p3
  a2        grain       1000, knote*2, kdens2/2, 500, 16, .08, 3, 2, p3
  a3        grain       1000, knote*4, kdens3/3, 500, 16, .09, 3, 2, p3

  asig gain (a1+a2+a3+ab+ab2), kenv

            out        asig*gisce
endin

;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
instr 3 ;::::::::::::::::::::::::::::::::::::::: Flute Bends
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ivelo     =           p4/2+3000
  idur      =           p3
  irange    =           gibase*32
   inote    =           irange*p5
    knott   expseg      inote, p6, inote*p7, p8, inote*p9, 1, inote*p9

  kvibc     linseg      3, p3/2, 4, p3/2, 3
   kvib     oscil       500, kvibc, 1
   ken      expseg      1, rnd(.04)+.04, ivelo, 8, 1
   kmainenv linseg      .01, .04, 1, p3-.14, 1, .1, .01
    kenv    =           kmainenv*(ken+kvib)
   knote    =           knott*(1+kvib/100000)

  a1        pluck       8000, knote, inote, 0, 2, 1.1

   atube1   reson       a1, 600, 400, 1
   atube2   reson       a1, 700, 300, 1
   atube3   reson       a1, 800, 100, 1
   kcon expseg inote/8, .1, inote*2, 20, 600
    afilt tone atube1+atube2+atube3, kcon
     asig   gain        afilt, kenv

   ken2     expseg      1, rnd(.15), 1, rnd(.005)+.005, ivelo*(rnd(.25)+.3), 12, 1
    kenv2    =           kmainenv*(ken2+kvib)
   a2       pluck       8000, knote*(rnd(.02)+2), inote*(rnd(.02)+2), 0, 2, 1.05
   atube12   reson       a2, 900, 400, 1
   atube22   reson       a2, 800, 300, 1
   atube32   reson       a2, 1000, 100, 1
    afilt2 tone atube12+atube22+atube32, kcon
     asig2   gain        afilt2, kenv2

            out        giflute*asig
endin
