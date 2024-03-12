igc_custom_camera_name = custom_igc_cam

script PlayIGCCamScene 
	hide_all_hud_sprites
	PlayIGCCam {
		Name = $igc_custom_camera_name
		<...>
		exitScript = show_all_hud_sprites
		allow_pause = 1
	}
endscript

script PlayIGCCamSceneWithHUD 
	PlayIGCCam {
		<...>
		allow_pause = 1
	}
endscript

script freeze_skater_for_cinematic 
	Skater :SwitchOffAtomic \{Board}
	Skater :PausePhysics
	Skater :pause
	Skater :Disableplayerinput
	Skater :SkaterLoopingSound_TurnOff
endscript

script unfreeze_skater_after_cinematic 
	Skater :UnPausePhysics
	Skater :Enableplayerinput
	Skater :Unpause
	Skater :Input_Debounce \{X}
	if NOT Skater :Walking
		Skater :SkaterLoopingSound_TurnOn
	endif
endscript

script FadeToBlack \{Time = 0.5 Alpha = 0.5 z_priority = 9000 rgba = [0 0 0 255] scale = (600.0, 400.0) texture = BLACK Id = screenfader pos = (320.0, 240.0) PARENT = root_window}
	if gotParam \{On}
		if NOT ScreenelementExists Id = <Id>
			SetScreenElementLock OFF Id = <PARENT>
			if NOT gotParam \{create_script}
				createScreenElement {
					Type = spriteElement
					PARENT = <PARENT>
					Id = <Id>
					texture = <texture>
					pos = <pos>
					rgba = <rgba>
					just = [Center Center]
					scale = <scale>
					Alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			TerminateObjectsScripts Id = <Id>
			<Id> :Removetags [waiting_to_die]
		endif
		DoScreenElementMorph Id = <Id> Time = <Time> Alpha = <Alpha>
	endif
	if gotParam \{OFF}
		if ScreenelementExists Id = <Id>
			DoScreenElementMorph Id = <Id> Time = <Time> Alpha = 0
			if gotParam \{No_wait}
				runScriptOnScreenElement Id = <Id> fadetoblack_wait_and_die Params = {Time = <Time>}
			else
				<Id> :SetTags waiting_to_die
				if (<Time> > 0.0)
					Printf \{"waiting"}
					Wait <Time> Seconds
				endif
				if ScreenelementExists Id = <Id>
					if <Id> :GetSingleTag waiting_to_die
						DestroyScreenelement Id = <Id>
					endif
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die 
	if gotParam \{Time}
		Wait <Time> Seconds
	endif
	DIE
endscript

script igc_fadeout \{Time = 0.75}
	FadeToBlack On Alpha = 1.0 Time = <Time>
	Wait (<Time> + 0.1) Seconds
endscript

script igc_fadeout_fast 
	FadeToBlack \{On Alpha = 1.0 Time = 0.0}
endscript

script igc_fadein_fast 
	FadeToBlack \{OFF Time = 0.0}
endscript

script igc_fadein \{Time = 0.75}
	FadeToBlack OFF Time = <Time> No_wait
endscript
