<CsoundSynthesizer>
<CsInstruments>

sr = 48000
ksmps = 480
nchnls = 1


gkaporto init 100
gkapuerto init 100
gkiglisso init 1100
gagasso init 0
gkportwine init 1100
gkagass_nostrilio init 1100
gkagass init 1100
gkassdrill init 0
instr 1 ; bayan
; more like a gliss bass
; do not reverb this
; sick n tired of reverb
; bass
gkapuerto = p5;
p3 = 2
kamp expseg 0.001, .01, p4*18, p3-.01,0.001


aosc oscil kamp, gkaporto, p6
absz butterlp aosc, 400
out absz
endin

instr 19
gkaporto portk gkapuerto, p4/1000
endin

instr 2 ;tok
; benlai use secret 
; "slaybells" handshake
; now we want the graphite+glue
; of the skin head, making
; a buddhic thock
ashrift randh p4*8, 400, ;.5, 0, p4*8
atik sleighbells 1, .1, 117,.1,0,700,1100,1500

out atik*(p4*8+ashrift)

endin

instr 3 ;glisso
; gkagass nostrilio
; is a vampire,
;he has a hair suit,
;top hat, wine lips
;different from barnabas
; he is stocky, for he can
; eat, but only crabs
; and other insect like things
; he is at night, representing
; the 7 and 11 of the world,
; speaking very high pitched,
; and whispery.  this is where
; he resides in csound_world
gkiglisso = p5*2
gkagass = p5*2
katt linseg 0, 0.1, p4*6, p3-0.01, 0
kgass expseg 0.01, 0.01, 1, 
aasso oscil 1, gkagass_nostrilio+gagasso*200, 3
gagasso oscil 1,gkportwine+(aasso*gkassdrill*200) , 3
out gagasso * katt
endin

instr 39 ;gkglisso
gkportwine portk gkiglisso, p4/500
gkagass_nostrilio portk gkagass, .1-p4/10
gkassdrill = p5
endin

instr 90
asnd init 0 			;input of fin must be initialized
     fin  "bf.wav", 0, 0, asnd	;read audiofile
aenv follow asnd, 0.01		;envelope follower
kenv downsamp aenv
asig rand kenv			;gate the noise with audiofile
     out asnd*10
endin

</CsInstruments>

<CsScore>
t0 79
f 1 0 1024 7 -1 1024 1 ;Saw wave
f 2 0 1024 7 1 512 1 0 -1 512 -1 ;Square wave
f 3 0 1024 9 1 1 0

i 90 0 90
#define BEATUSWONCE(WHEN) #
i1 $WHEN .5 1000 100 1
i1 + .5 1000 100 1
i1 + 1 1000 200 2
i1 + .5 1000 100 1
i1 + .5 1000 100 1
i1 + 1 1000 200 2
i1 + .5 1000 175 2
i1 + 1 1000 100 2
i1 + .5 1000 100 1
i1 + .5 1000 100 1
i1 + 1 1000 200 2


i2 $WHEN .5 1000 
i2 + 1 1000 
i2 + .5 1000 
i2 + .5 1000
i2 + 1 1000 
i2 + .5 1000 
i2 + .5 500 
i2 + .5 700 
i2 + .5 1100
i2 + .5 1000
i2 + 1 1000 
i2 + .5 1000 
#


#define GLISS711(WHEN) #
i3 $WHEN .1 1000 700
i3 + .1 1000 800
i3 + .1 1000 900
i3 + .1 1000 1000
i3 + .25 1000 1100 # 

#define GLISS1115(WHEN) #
i3 $WHEN .1 1000 1100
i3 + .1 1000 1200
i3 + .1 1000 1300
i3 + .1 1000 1400
i3 + .25 1000 1500 # 
$BEATUSWONCE(0)
$BEATUSWONCE(7.5)
$BEATUSWONCE(15)
$BEATUSWONCE(22.5)

$GLISS711(2)
$GLISS1115(4)
$GLISS711(6)
$GLISS1115(8)
$GLISS711(10)
$GLISS1115(12)
$GLISS711(14)
$GLISS1115(16)
$GLISS711(20)
$GLISS1115(24)
$GLISS711(28)
$GLISS1115(32)

i19 0 4 1
i19 + 4 100
i19 + 4 10
i19 + 4 1000
i19 + 4 1
i19 + 4 100
i19 + 4 10
i19 + 4 1000

i39 0 5 1 0
i39 + 5 10 1
i39 + 5 1 2
i39 + 5 10 3
i39 + 5 1 4
i39 + 5 10 1
i39 + 5 1 5
i39 + 5 10 3
i39 + 5 1 7

e
</CsScore>

</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>30</width>
 <height>30</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>162</r>
  <g>123</g>
  <b>134</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 616 296 98 28
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView background {41634, 31611, 34438}
</MacGUI>
