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

script Reset_Transition_FXandLighting 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_HOF
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		Kill \{prefix = Z_HOF_GFX_FX_BlueSmoke}
		Kill \{prefix = Z_HOF_GFX_FX_GreenSmoke}
		Kill \{prefix = Z_HOF_GFX_FX_YellowSmoke}
		Kill \{name = Z_HOF_GFX_FX_Snow}
		Kill \{name = Z_HOF_GFX_FX_DrummerGlow_01}
		Kill \{name = Z_HOF_GFX_FX_DrummerSmoke_02}
		DestroyParticlesByGroupID \{groupid = PyroFountains ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksAmbient ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunch ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunchSmoke ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunch03 ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunchSmoke03 ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunchSmoke04 ifempty = 0}
		DestroyParticlesByGroupID \{groupid = FireworksLaunchSmoke04 ifempty = 0}
		SetDynamicShadowIntensity \{i = 0.35000002}
		case z_Fenway
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		Kill \{prefix = z_fenway_GFX_FX_BandTrans}
		SetShadowDirFromLight \{name = z_Fenway_gfx_L_Band_Center_Direct01}
		case z_maxskc
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		Kill \{prefix = Z_MaxsKC_GFX_FX_BandTrans_Smoke}
		case z_jpplay
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		SetShadowDirFromLight \{name = z_JPPlay_gfx_L_Band_Center_Direct01}
		DestroyParticlesByGroupID \{groupid = AE_Pyro ifempty = 0}
		DestroyParticlesByGroupID \{groupid = PyroFountains ifempty = 0}
		case z_soundcheck
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		case z_nine_lives
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		SafeKill \{nodeName = Z_nine_lives_GFX_FX_BandTrasition_Smoke_01}
		SafeKill \{nodeName = Z_nine_lives_GFX_FX_BandTrasition_Glow_01}
		case z_nipmuc
		popworldlights
		DisableLightGroup \{name = defaultgroup}
		SetShadowDir \{heading = 15 pitch = 45.0}
		Kill \{prefix = Z_Nipmuc_GFX_FX_Fog}
		Kill \{prefix = Z_Nipmuc_GFX_Party}
	endswitch
endscript
