igc_custom_camera_name = custom_igc_cam

script PlayIGCCamScene 
	hide_all_hud_sprites
	PlayIGCCam {
		name = $igc_custom_camera_name
		<...>
		exitscript = show_all_hud_sprites
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
	skater :switchoffatomic \{board}
	skater :PausePhysics
	skater :Pause
	skater :disableplayerinput
	skater :SkaterLoopingSound_TurnOff
endscript

script unfreeze_skater_after_cinematic 
	skater :UnPausePhysics
	skater :enableplayerinput
	skater :UnPause
	skater :input_debounce \{x}
	if NOT skater :walking
		skater :SkaterLoopingSound_TurnOn
	endif
endscript

script fadetoblack \{time = 0.5
		alpha = 0.5
		z_priority = 9000
		rgba = [
			0
			0
			0
			255
		]
		Scale = (600.0, 400.0)
		texture = black
		id = screenfader
		Pos = (320.0, 240.0)
		parent = root_window}
	if GotParam \{on}
		if NOT ScreenElementExists id = <id>
			SetScreenElementLock Off id = <parent>
			if NOT GotParam \{create_script}
				CreateScreenElement {
					type = SpriteElement
					parent = <parent>
					id = <id>
					texture = <texture>
					Pos = <Pos>
					rgba = <rgba>
					just = [center center]
					Scale = <Scale>
					alpha = 0
					z_priority = <z_priority>
					no_zwrite
				}
			else
				<create_script>
			endif
		else
			TerminateObjectsScripts id = <id>
			<id> :removetags [waiting_to_die]
		endif
		DoScreenElementMorph id = <id> time = <time> alpha = <alpha>
	endif
	if GotParam \{Off}
		if ScreenElementExists id = <id>
			DoScreenElementMorph id = <id> time = <time> alpha = 0
			if GotParam \{no_wait}
				RunScriptOnScreenElement id = <id> fadetoblack_wait_and_die params = {time = <time>}
			else
				<id> :settags waiting_to_die
				if (<time> > 0.0)
					printf \{"waiting"}
					wait <time> seconds
				endif
				if ScreenElementExists id = <id>
					if <id> :getsingletag waiting_to_die
						DestroyScreenElement id = <id>
					endif
				endif
			endif
		endif
	endif
endscript

script fadetoblack_wait_and_die 
	if GotParam \{time}
		wait <time> seconds
	endif
	Die
endscript

script igc_fadeout \{time = 0.75}
	fadetoblack on alpha = 1.0 time = <time>
	wait (<time> + 0.1) seconds
endscript

script igc_fadeout_fast 
	fadetoblack \{on alpha = 1.0 time = 0.0}
endscript

script igc_fadein_fast 
	fadetoblack \{Off time = 0.0}
endscript

script igc_fadein \{time = 0.75}
	fadetoblack Off time = <time> no_wait
endscript
