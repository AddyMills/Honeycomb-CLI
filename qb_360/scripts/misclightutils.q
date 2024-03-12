curReviewLighting = 0

script CycleReviewLighting 
	change curReviewLighting = ($curReviewLighting + 1)
	if ($curReviewLighting = 7)
		change \{curReviewLighting = 0}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = lightPrefix '%p_GFX_L' p = <pakname>
	CallScriptOnNode prefix = <lightPrefix> callback_script = CB_CycleReviewLighting params = {}
endscript

script CB_CycleReviewLighting 
	GetLightColor name = <nodeName>
	big = <r>
	if (<big> < <g>)
		big = <g>
	endif
	if (<big> < <b>)
		big = <b>
	endif
	switch $curReviewLighting
		case 0
		SetLightColor name = <nodeName> r = <big> g = <big> b = <big>
		case 1
		SetLightColor name = <nodeName> r = <big> g = (<big> / 6.0) b = (<big> / 6.0)
		case 2
		SetLightColor name = <nodeName> r = (<big> / 6.0) g = <big> b = (<big> / 6.0)
		case 3
		SetLightColor name = <nodeName> r = (<big> / 6.0) g = (<big> / 6.0) b = <big>
		case 4
		SetLightColor name = <nodeName> r = (<big> / 6.0) g = <big> b = <big>
		case 5
		SetLightColor name = <nodeName> r = <big> g = (<big> / 6.0) b = <big>
		case 6
		SetLightColor name = <nodeName> r = <big> g = <big> b = (<big> / 6.0)
	endswitch
endscript

script SafeCreate 
	if IsInNodeArray <nodeName>
		if NOT IsCreated <nodeName>
			Create name = <nodeName>
		endif
	endif
endscript

script SafeKill 
	if IsCreated <nodeName>
		Kill name = <nodeName>
	endif
endscript

script screenflash \{time = 1}
	KillSpawnedScript \{id = screenflash}
	SpawnScriptLater ScreenFlashOn id = screenflash params = {time = <time>}
endscript

script ScreenFlashOn 
	if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport name = FlashBS}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	endif
	wait (0.1 * <time>) seconds
	if ScreenFX_FXInstanceExists \{viewport = bg_viewport name = FlashBS}
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = FlashBS
			time = <time>
			($ScreenFlash_TOD_Manager.screen_FX [0])
			contrast = 1
			brightness = 1
		}
	endif
	wait <time> seconds
	SpawnScriptLater \{ScreenFlashOff id = screenflash}
endscript

script ScreenFlashOff 
	if ViewportExists \{id = bg_viewport}
		if ScreenFX_FXInstanceExists \{viewport = bg_viewport name = FlashBS}
			ScreenFX_RemoveFXInstance \{viewport = bg_viewport name = FlashBS}
		endif
	endif
endscript

script ScreenToBlack \{time = 0.4 viewport = ui}
	KillSpawnedScript \{id = ScreenToBlack}
	SpawnScriptLater Call_ScreenToBlack id = ScreenToBlack params = {<...>}
endscript

script Call_ScreenToBlack 
	time = (0.5 * <time>)
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {on time = <time> <...>}
	wait <time> seconds
	SpawnScriptLater Do_ScreenToBlack id = ScreenToBlack params = {Off time = <time> <...>}
endscript

script Do_ScreenToBlack 
	if NOT (<viewport> = 0)
		if NOT ViewportExists id = <viewport>
			return
		endif
	endif
	if GotParam \{on}
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> name = blackFX
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				name = blackFX
				($ScreenToBlack_TOD_Manager.screen_FX [0])
			}
		endif
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			name = blackFX
			time = <time>
			($ScreenToBlack_TOD_Manager.screen_FX [0])
			inner_radius = 0
			outer_radius = 0
			alpha = 1
		}
	else
		if ScreenFX_FXInstanceExists viewport = <viewport> name = blackFX
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				name = blackFX
				time = <time>
				($ScreenToBlack_TOD_Manager.screen_FX [0])
				inner_radius = 1
				outer_radius = 1.5
				alpha = 0
			}
			if GotParam \{Off}
				wait <time> seconds
				ScreenFX_RemoveFXInstance viewport = <viewport> name = blackFX
			endif
		endif
	endif
endscript
