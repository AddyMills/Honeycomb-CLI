
script run_windows_light_tool_commands 
	getArraySize <Commands>
	I = 0
	if (<array_Size> > 0)
		begin
		(<Commands> [<I>].scriptname) (<Commands> [<I>].Params)
		I = (<I> + 1)
		repeat <array_Size>
	endif
endscript

script global_fx_unlock_and_set_temp_tod 
	tod_manager_apply_perm_light_settings <...>
endscript
screenfx_instances_state = 1
screenfx_instances_default_state = [
	{
		Name = NULL
	}
]

script toggle_screenfx_instances 
	if gotParam \{On}
		Change \{screenfx_instances_state = 1}
	else
		if gotParam \{OFF}
			Change \{screenfx_instances_state = 0}
		else
			if ($screenfx_instances_state = 1)
				Change \{screenfx_instances_state = 0}
			else
				Change \{screenfx_instances_state = 1}
			endif
		endif
	endif
	ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
	if NOT IsArray <curscreenfx>
		return
	endif
	getArraySize <curscreenfx>
	I = 0
	begin
	ScreenFX_UpdateFXInstanceParams {
		viewport = 0
		Name = (<curscreenfx> [<I>].Name)
		Time = 0
		On = ($screenfx_instances_state)
	}
	I = (<I> + 1)
	repeat <array_Size>
	save_current_screen_fx_setup
endscript

script start_viewer_screen_fx 
	Printf \{"--- start_viewer_screen_fx"}
	ScreenFX_ClearFXInstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)
		Printf \{"returned"}
		return
	endif
	printStruct ($screenfx_instances_default_state)
	temp = ($screenfx_instances_default_state)
	begin
	if GetNextArrayElement <temp>
		ScreenFX_AddFXInstance {
			viewport = 0
			<Element>
		}
	else
		break
	endif
	repeat
endscript

script save_current_screen_fx_setup 
	Printf \{"--- save_current_screen_fx_setup"}
	if LevelIs \{viewer}
		Wait \{1 Second}
		ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
		printStruct <...>
		Change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 
	Printf \{"--- good_saved_screenfx_settings"}
	if NOT IsArray ($screenfx_instances_default_state)
		Printf \{"not array"}
		return \{is_good = 0}
	else
		if checksumequals A = (($screenfx_instances_default_state) [0].Name) B = NULL
			Printf \{"null"}
			return \{is_good = 0}
		endif
	endif
	return \{is_good = 1}
endscript

script ApplyLightColorChange 
	if iscreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...> R = <Red> G = <Green> B = <Blue>
	endif
endscript

script ApplyLightIntensityChange 
	if iscreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightSpecularIntensityChange 
	if iscreated <LightChecksum>
		<LightChecksum> :Light_SetParams <...>
	endif
endscript

script ApplyLightFarAttenEndChange 
endscript

script ApplyLightFarAttenStartChange 
endscript

script UpdateLightTransform 
	if iscreated <LightChecksum>
		SetLightFlag Name = <LightChecksum> flag = Dynamic
		moveLight Name = <LightChecksum> pos = <pos>
		ClearLightFlag Name = <LightChecksum> flag = Dynamic
		CompactIntervals
	endif
endscript

script ApplyGroupIntensityChange 
	SetLightGroupIntensity Name = <GroupChecksum> I = <Intensity>
endscript

script ApplySnapshotToLight 
	if gotParam \{LightChecksum}
		if iscreated <LightChecksum>
			<LightChecksum> :Light_SetParams <...>
		endif
		elseif gotParam \{HousingChecksum}
		if iscreated <HousingChecksum>
			if <HousingChecksum> :Obj_HasComponent PositionMorph
				<HousingChecksum> :PM_SetParams <...>
			endif
			<HousingChecksum> :LightVolume_SetParams <...>
		endif
	endif
endscript

script UpdateHousingTransform 
	if iscreated <HousingChecksum>
		if <HousingChecksum> :Obj_HasComponent PositionMorph
			<HousingChecksum> :PM_SetParams <...>
		endif
	endif
endscript

script ApplyHousingStartRadiusChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingEndRadiusChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingInnerRadiusChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingRangeChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyHousingVolumeDensityChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams <...>
	endif
endscript

script ApplyVolumeColorChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams {
			VolumeColorRed = <Red>
			VolumeColorGreen = <Green>
			VolumeColorBlue = <Blue>
		}
	endif
endscript

script ApplyProjectorColorChange 
	if iscreated <HousingChecksum>
		<HousingChecksum> :LightVolume_SetParams {
			ProjectorColorRed = <Red>
			ProjectorColorGreen = <Green>
			ProjectorColorBlue = <Blue>
		}
	endif
endscript
