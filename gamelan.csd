

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

 
nchnls = 1

ifn ftgen 1, 0, 8192, 10, 1           ;:::::::Sine:::::::
ifn ftgen 2, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1 
;Square wave

instr 1
	kenv linseg 0, p3/2, 1000, p3/2, 0 
	aSin	oscil kenv, p4, p5
	out aSin			
endin

</CsInstruments>
<CsScore>

#define CHRISPIERCE(I#T#L#F)#
i $I $T $L 135.117 $F
i $I $T $L 335.514 $F
i $I $T $L 164.838 $F
i $I $T $L 180.638 $F
i $I $T $L 453.371 $F
#

$CHRISPIERCE(1#0#4#1)

$CHRISPIERCE(1#4#8#2)

e 							
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>160</r>
  <g>158</g>
  <b>162</b>
 </bgcolor>
 <bsbObject version="2" type="BSBConsole">
  <objectName/>
  <x>24</x>
  <y>2</y>
  <width>250</width>
  <height>158</height>
  <uuid>{4239763c-dca4-492d-b883-e2300844738b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <font>Courier</font>
  <fontsize>8</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>25</x>
  <y>166</y>
  <width>249</width>
  <height>164</height>
  <uuid>{846b6ed5-d563-404b-b17d-5b33b6df7713}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>This is a widget window. In this case, the Console Output is also visible here. More information about widgets can be found in the menu: Examples-> Widgets</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView background {41120, 40606, 41634}
ioListing {24, 2} {250, 158}
ioText {25, 166} {249, 164} label 0.000000 0.00100 "" left "Lucida Grande" 18 {0, 0, 0} {60416, 59648, 55296} nobackground noborder This is a widget window. In this case, the Console Output is also visible here. More information about widgets can be found in the menu: Examples-> Widgets
</MacGUI>
