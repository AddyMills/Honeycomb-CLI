
script run_windows_light_tool_commands 
	GetArraySize <commands>
	i = 0
	if (<array_size> > 0)
		begin
		(<commands> [<i>].ScriptName) (<commands> [<i>].params)
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script global_fx_unlock_and_set_temp_tod 
	tod_manager_apply_perm_light_settings <...>
endscript
screenfx_instances_state = 1
screenfx_instances_default_state = [
	{
		name = null
	}
]

script toggle_screenfx_instances 
	if GotParam \{on}
		change \{screenfx_instances_state = 1}
	else
		if GotParam \{Off}
			change \{screenfx_instances_state = 0}
		else
			if ($screenfx_instances_state = 1)
				change \{screenfx_instances_state = 0}
			else
				change \{screenfx_instances_state = 1}
			endif
		endif
	endif
	ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
	if NOT IsArray <curscreenfx>
		return
	endif
	GetArraySize <curscreenfx>
	i = 0
	begin
	ScreenFX_UpdateFXInstanceParams {
		viewport = 0
		name = (<curscreenfx> [<i>].name)
		time = 0
		on = ($screenfx_instances_state)
	}
	i = (<i> + 1)
	repeat <array_size>
	save_current_screen_fx_setup
endscript

script start_viewer_screen_fx 
	printf \{"--- start_viewer_screen_fx"}
	ScreenFX_ClearFXInstances \{viewport = 0}
	good_saved_screenfx_settings
	if (<is_good> = 0)
		printf \{"returned"}
		return
	endif
	printstruct ($screenfx_instances_default_state)
	temp = ($screenfx_instances_default_state)
	begin
	if GetNextArrayElement <temp>
		ScreenFX_AddFXInstance {
			viewport = 0
			<element>
		}
	else
		break
	endif
	repeat
endscript

script save_current_screen_fx_setup 
	printf \{"--- save_current_screen_fx_setup"}
	if LevelIs \{viewer}
		wait \{1 second}
		ScreenFX_GetActiveScreenFXInstances \{viewport = 0}
		printstruct <...>
		change screenfx_instances_default_state = (<curscreenfx>)
	endif
endscript

script good_saved_screenfx_settings 
	printf \{"--- good_saved_screenfx_settings"}
	if NOT IsArray ($screenfx_instances_default_state)
		printf \{"not array"}
		return \{is_good = 0}
	else
		if ChecksumEquals a = (($screenfx_instances_default_state) [0].name) b = null
			printf \{"null"}
			return \{is_good = 0}
		endif
	endif
	return \{is_good = 1}
endscript

script ApplyLightColorChange 
	if IsCreated <lightchecksum>
		<lightchecksum> :light_setparams <...> r = <red> g = <green> b = <blue>
	endif
endscript

script ApplyLightIntensityChange 
	if IsCreated <lightchecksum>
		<lightchecksum> :light_setparams <...>
	endif
endscript

script ApplyLightSpecularIntensityChange 
	if IsCreated <lightchecksum>
		<lightchecksum> :light_setparams <...>
	endif
endscript

script ApplyLightFarAttenEndChange 
endscript

script ApplyLightFarAttenStartChange 
endscript

script UpdateLightTransform 
	if IsCreated <lightchecksum>
		SetLightFlag name = <lightchecksum> flag = dynamic
		MoveLight name = <lightchecksum> Pos = <Pos>
		ClearLightFlag name = <lightchecksum> flag = dynamic
		CompactIntervals
	endif
endscript

script ApplyGroupIntensityChange 
	SetLightGroupIntensity name = <GroupChecksum> i = <intensity>
endscript

script ApplySnapshotToLight 
	if GotParam \{lightchecksum}
		if IsCreated <lightchecksum>
			<lightchecksum> :light_setparams <...>
		endif
		elseif GotParam \{housingchecksum}
		if IsCreated <housingchecksum>
			if <housingchecksum> :obj_hascomponent positionmorph
				<housingchecksum> :pm_setparams <...>
			endif
			<housingchecksum> :lightvolume_setparams <...>
		endif
	endif
endscript

script UpdateHousingTransform 
	if IsCreated <housingchecksum>
		if <housingchecksum> :obj_hascomponent positionmorph
			<housingchecksum> :pm_setparams <...>
		endif
	endif
endscript

script ApplyHousingStartRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script ApplyHousingEndRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script ApplyHousingInnerRadiusChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script ApplyHousingRangeChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script ApplyHousingVolumeDensityChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams <...>
	endif
endscript

script ApplyVolumeColorChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams {
			volumecolorred = <red>
			volumecolorgreen = <green>
			volumecolorblue = <blue>
		}
	endif
endscript

script ApplyProjectorColorChange 
	if IsCreated <housingchecksum>
		<housingchecksum> :lightvolume_setparams {
			projectorcolorred = <red>
			projectorcolorgreen = <green>
			projectorcolorblue = <blue>
		}
	endif
endscript
