<CsoundSynthesizer>
;Options given through csoundqt
;Recommend setting hardware buffer as low as possible
;	Tested with -B16 with i7/onboard sound

<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

;Widget height
	giwheight = 20
	;Note: this is written to work well on a 4K monitor.
			FLpanel "Gain Control", 450, 150
idgain	FLvalue " ", 450, giwheight, 0, giwheight*2
			 
			 ;ihandle FLslider "label", imin, imax, iexp, itype, idisp, iwidth, iheight, ix, iy 
gkgain, ihgain FLslider	 "Gain", 1, 20, -1, 25, idgain, 450, giwheight, 0, 0
;			;FLlabel isize, ifont, ialign, ired, igreen, iblue 
;			FLlabel	16, 14, 4, 0, 0, 0
	;ihandle FLbox "label", itype, ifont, isize, iwidth, iheight, ix, iy [, image] 
			
			
			;Init value for gain
			FLsetVal_i 10, ihgain
	
			FLpanelEnd
	
			FLrun	

;Expand mono source (guitar) to 
instr 1
	ainR, ainL ins 
	aMix =(ainR+ainL)/2
	aMonoOuut = aMix*gkgain
	outs aMonoOuut, aMonoOuut

endin

</CsInstruments>
<CsScore>
 i 1 0 3600
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
