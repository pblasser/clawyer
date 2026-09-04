
sr = 44100
kr = 441
ksmps = 100
nchnls = 1
gibase = 10.301


ifn ftgen 1, 0, 8192, 10, 1 
ifn ftgen 2, 0, 2048, 7, 0, 512, 1, 1024, -1, 512, 0 ;tri

instr 1
p3=p3*2
aenv expseg 0.0001, 0.001, 800, p3, 0.0001
a2=0
#define buttock(a) #
 a1 oscil aenv, $a+a1*4, 1
 a2 = a2 + a1
#

$buttock(7330)
$buttock(6781)
$buttock(7673)
$buttock(6760)
$buttock(7741)

$buttock(6760)
$buttock(5761)
$buttock(6120)
$buttock(6478)

out a2
endin



instr 2
kenv linseg 8000, p3, 0
kpch linseg p4, p3, p5
a1 oscil kenv, kpch, 2
a1 butterlp a1, 1200
out a1
endin

instr 3 ; --- Bongo Synthesizer ---
  iamp     = p4         ; Peak amplitude (0 to 1)
  ifreq    = p5         ; Fundamental frequency (Hz)
  anoise   rand     iamp 
  apitsig  linseg   1, 0.005, 0  
  astrike  =        anoise * apitsig
  ares1    reson    astrike, ifreq, ifreq*0.05
  ares2    reson    astrike, ifreq * 1.6, ifreq*0.08
  ares3    reson    astrike, ifreq * 2.1, ifreq*0.1
  out     ares1+ares2+ares3
endin

