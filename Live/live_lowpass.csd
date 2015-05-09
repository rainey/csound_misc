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
idfreq	FLvalue " ", 450, giwheight, 0, giwheight*4
idres		FLvalue " ", 450, giwheight, 0, giwheight*6

			 
			 ;ihandle FLslider "label", imin, imax, iexp, itype, idisp, iwidth, iheight, ix, iy 
gkgain, ihgain FLslider	 "Gain", 1, 20, -1, 25, idgain, 450, giwheight, 0, 0
;			;FLlabel isize, ifont, ialign, ired, igreen, iblue 
;			FLlabel	16, 14, 4, 0, 0, 0
	;ihandle FLbox "label", itype, ifont, isize, iwidth, iheight, ix, iy [, image] 
			 
			 ;ihandle FLslider "label", imin, imax, iexp, itype, idisp, iwidth, iheight, ix, iy 
gkfreq, ihfreq FLslider	 "Filter Freq", 40, 2000, 0, 25, idfreq, 450, giwheight, 0, giwheight*3
gkres,  ihres  FLslider	 "Filter Res", 1, 500, 0, 25, idres, 450, giwheight, 0, giwheight*5

			
			;Init value for gain
			FLsetVal_i 10, ihgain
		FLsetVal_i 2000, ihfreq
		FLsetVal_i 1, ihres
	
			FLpanelEnd
	
			FLrun	

;Expand mono source (guitar) to 
instr 1
	ainR, ainL ins 
	aMix =(ainR+ainL)/2
	aFiltered lowpass2 aMix, gkfreq, gkres
	
	aMonoOuut = aFiltered*gkgain
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
