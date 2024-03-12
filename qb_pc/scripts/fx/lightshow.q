lightshow_enabled = 1
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedradius = {
		amplitude = 0.2
		center = 1.0
		periodbase = 0.0065
		periodmultiples = [
			1
			3
			4
			7
		]
	}
	driftlerpmap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_spotlightoverrides = {
	fade_time = 0.5
	snapshot_names_to_search = [
		Solo01
	]
	default_params = {
		startradius = 0.3
		endradius = 1.5
		InnerRadius = 0.0
		range = 7.36
		volumedensity = 0.6442
		projectorcolorred = 170.0
		projectorcolorgreen = 170.0
		projectorcolorblue = 170.0
		volumecolorred = 255.0
		volumecolorgreen = 255.0
		volumecolorblue = 255.0
	}
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_housingmodels = [
	{
		Model = 'LightHousings\\GO_NoHousing01\\GO_NoHousing01.mdl'
		clonesrc = LS_GO_NoHousing01
	}
	{
		Model = 'LightHousings\\GO_NoHousing01_Flare01\\GO_NoHousing01_Flare01.mdl'
		clonesrc = LS_GO_NoHousing01_Flare01
	}
	{
		Model = 'LightHousings\\GO_NoHousing01_SmallFlare01\\GO_NoHousing01_SmallFlare01.mdl'
		clonesrc = LS_GO_NoHousing01_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_BarnHousing01\\GO_BarnHousing01.mdl'
		clonesrc = LS_GO_BarnHousing01
	}
	{
		Model = 'LightHousings\\GO_LightHousing01\\GO_LightHousing01.mdl'
		clonesrc = LS_GO_LightHousing01
	}
	{
		Model = 'LightHousings\\GO_LightHousing01_SmallFlare01\\GO_LightHousing01_SmallFlare01.mdl'
		clonesrc = LS_GO_LightHousing01_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_LightHousing02\\GO_LightHousing02.mdl'
		clonesrc = LS_GO_LightHousing02
	}
	{
		Model = 'LightHousings\\GO_LightHousing02_SmallFlare01\\GO_LightHousing02_SmallFlare01.mdl'
		clonesrc = LS_GO_LightHousing02_SmallFlare01
	}
	{
		Model = 'LightHousings\\GO_LightHousing02_Small01\\GO_LightHousing02_Small01.mdl'
		clonesrc = LS_GO_LightHousing02_Small01
	}
	{
		Model = 'LightHousings\\GO_TankHousing01\\GO_TankHousing01.mdl'
		clonesrc = LS_GO_TankHousing01
	}
]

script LightShow_CreatePermModels 
	GetArraySize \{$lightshow_housingmodels}
	<i> = 0
	begin
	<desc> = ($lightshow_housingmodels [<i>])
	<Model> = (<desc>.Model)
	<Pos> = ((-100.0, 300.0) + <i> * (0.0, 10.0))
	<src> = (<desc>.clonesrc)
	CreateCompositeObject {
		Components = [
			{
				Component = Model
				Model = <Model>
			}
		]
		params = {
			Pos = <Pos>
			name = <src>
		}
	}
	<src> :hide
	<src> :Obj_ForceUpdate
	<src> :Suspend
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script LS_AllOff 
	KillSpawnedScript \{id = lightshow}
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = zones}
endscript

script LS_KillFX 
endscript
lightshow_coloroverrides = {
	red = (255.0, 0.0, 0.0)
	blue = (20.0, 132.0, 247.0)
	yellow = (252.0, 227.0, 61.0)
	white = (255.0, 255.0, 255.0)
	magenta = (240.0, 79.0, 255.0)
	green = (66.0, 228.0, 97.0)
	purple = (162.0, 80.0, 232.0)
	orange = (248.0, 142.0, 56.0)
}
LightShow_ColorOverrideExcludeLights = [
	Z_Budokan_GFX_L_Band_Ambient01
	Z_Budokan_GFX_L_Band_Guitarist_Spot01
	Z_Budokan_GFX_L_Band_Up_Direct01
	Z_Budokan_GFX_L_Crowd_Ambient01
	Z_Budokan_GFX_L_NeonSigns_Ambient01
	Z_Budokan_GFX_L_Periph_Ambient01
	Z_Budokan_GFX_L_Periph_Up_Direct01
	Z_Budokan_GFX_L_Stage_Ambient01
	Z_Budokan_GFX_L_Stage_Up_Direct01
	Z_Budokan_GFX_VC_Flames_Omni01
	Z_Budokan_GFX_VC_Flames_Omni02
	Z_Budokan_GFX_VC_Flames_Omni03
	Z_Budokan_GFX_VC_Flames_Omni04
	Z_Dive_GFX_L_Ambient01
	Z_Dive_GFX_L_Band_Ambient01
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Up_Direct01
	Z_Dive_GFX_L_Crowd_Ambient01
	Z_Dive_GFX_L_Stage_Dancer_Omni01
	Z_Dive_GFX_L_Stage_Up_Direct01
	Z_Dive_GFX_VC_Arcade_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni02
	Z_Dive_GFX_VC_Corner_Omni01
	Z_Dive_GFX_VC_Exit_Omni01
	Z_Dive_GFX_VC_Exit_Omni02
	Z_Dive_GFX_VC_Fill_Omni01
	Z_Dive_GFX_VC_Neon_Omni01
	Z_Dive_GFX_VC_Periph_Back_Direct01
	Z_Dive_GFX_VC_Periph_Back_Direct02
	Z_Hell_GFX_L_Band_Ambient01
	Z_HEll_GFX_L_Band_Fire_Direct01
	Z_Hell_GFX_L_Band_Up_Direct01
	Z_Hell_GFX_L_Crowd_Ambient01
	Z_Hell_GFX_L_Stage_Ambient01
	Z_Hell_GFX_L_Stage_Up_Direct01
	Z_Party_GFX_L_Band_Back_Direct01
	Z_Party_GFX_L_Band_Center_Direct01
	Z_Party_GFX_L_Stage_Back_Direct01
	Z_Party_GFX_L_Stage_Center_Direct01
	Z_Party_GFX_TRG_Flare_Back01
	Z_Party_GFX_TRG_Flare_Center01
	Z_Party_GFX_TRG_Flare_Chimney01
	Z_Party_GFX_TRG_Flare_Chimney02
	Z_Party_GFX_TRG_Flare_Chimney03
	Z_Party_GFX_VC_Viewer_Ambient01
	Z_Party_GFX_VC_Viewer_Center_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct02
	Z_Party_GFX_VC_Viewer_Right_Direct01
	Z_Party_GFX_VC_Viewer_Right_Direct02
	Z_Party_GFX_VC_Viewer_Up_Direct01
	Z_Prison_GFX_L_Band_Ambient01
	Z_Prison_GFX_L_Band_Guitarist_Spot01
	Z_Prison_GFX_L_Band_Sky_FDirect01
	Z_Prison_GFX_L_Band_Up_Direct01
	Z_Prison_GFX_L_Crowd_Ambient01
	Z_Prison_GFX_L_Crowd_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Ambient01
	Z_Prison_GFX_L_Stage_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Sky_FDirect02
	Z_Prison_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_L_BackDrop_Ambient01
	Z_Video_GFX_L_Band_Ambient01
	Z_Video_GFX_L_Band_Up_Direct01
	Z_Video_GFX_L_Crowd_Ambient01
	Z_Video_GFX_L_Stage_Ambient01
	Z_Video_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_VC_Cola_Omni01
	Z_Video_GFX_VC_Exit_Omni01
	Z_Video_GFX_VC_Exit_Omni02
	Z_Video_GFX_VC_Exit_Omni03
	Z_Video_GFX_VC_Exit_Omni04
	Z_Video_GFX_VC_Periph_Left_Direct01
	Z_Video_GFX_VC_Periph_Right_Direct01
	Z_Wikker_GFX_L_Ambient01
	Z_Wikker_GFX_L_Band_Ambient01
	Z_Wikker_GFX_L_Band_Up_Direct01
	Z_Wikker_GFX_L_Crowd_Ambient01
	Z_Wikker_GFX_L_Stage_Up_Direct01
]
LightShow_StateNodeFlags = [
	LS_PERF_POOR
	LS_PERF_MEDIUM
	LS_PERF_GOOD
	LS_PERF_POOR_MEDIUM
	LS_PERF_MEDIUM_GOOD
	LS_PERF_POOR_MEDIUM_GOOD
	LS_PERF_POOR_NOBLACKOUT
	LS_PERF_MEDIUM_NOBLACKOUT
	LS_PERF_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_NOBLACKOUT
	LS_PERF_MEDIUM_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
	ls_mood_blackout
	ls_mood_flare
	ls_mood_strobe
	LS_MOOD_SPECIAL
]
lightshow_statenodeflagmapping = {
	performance = {
		poor = [
			{
				LS_PERF_POOR
				1
			}
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		medium = [
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		good = [
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
	}
	mood = {
		blackout = [
			{
				ls_mood_blackout
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		flare = [
			{
				ls_mood_flare
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		strobe = [
			{
				ls_mood_strobe
				1
			}
		]
	}
}
LightShow_NoteMapping = [
	{
		midinote = 76
		scr = LightShow_SetParams
		params = {
			mood = intro
		}
	}
	{
		midinote = 75
		scr = LightShow_SetParams
		params = {
			mood = Verse
		}
	}
	{
		midinote = 74
		scr = LightShow_SetParams
		params = {
			mood = chorus
		}
	}
	{
		midinote = 73
		scr = LightShow_SetParams
		params = {
			mood = Solo
		}
	}
	{
		midinote = 72
		scr = LightShow_SetParams
		params = {
			mood = blackout
		}
	}
	{
		midinote = 71
		scr = LightShow_SetParams
		params = {
			mood = flare
		}
	}
	{
		midinote = 70
		scr = LightShow_SetParams
		params = {
			mood = strobe
		}
	}
	{
		midinote = 69
		scr = LightShow_OverrideColor
		params = {
			color = green
		}
	}
	{
		midinote = 68
		scr = LightShow_OverrideColor
		params = {
			color = red
		}
	}
	{
		midinote = 67
		scr = LightShow_OverrideColor
		params = {
			color = blue
		}
	}
	{
		midinote = 66
		scr = LightShow_OverrideColor
		params = {
			color = yellow
		}
	}
	{
		midinote = 65
		scr = LightShow_OverrideColor
		params = {
			color = white
		}
	}
	{
		midinote = 64
		scr = LightShow_OverrideColor
		params = {
			color = magenta
		}
	}
	{
		midinote = 63
		scr = LightShow_OverrideColor
		params = {
			Off
		}
	}
	{
		midinote = 62
		scr = LightShow_OverrideColor
		params = {
			color = orange
		}
	}
	{
		midinote = 61
		scr = LightShow_OverrideColor
		params = {
			color = purple
		}
	}
	{
		midinote = 60
		event = strobetoggle
		params = {
			usesnapshotpositions = FALSE
		}
	}
	{
		midinote = 58
		event = snapshotchange
		params = {
			usesnapshotpositions = TRUE
		}
	}
	{
		midinote = 57
		event = snapshotchange
		params = {
			usesnapshotpositions = FALSE
		}
	}
	{
		midinote = 56
		scr = LightShow_PyroEvent
		params = {
		}
	}
	{
		midinote = 53
		scr = LightShow_SetTime
		params = {
			time = 1.0
		}
	}
	{
		midinote = 52
		scr = LightShow_SetTime
		params = {
			time = 0.9
		}
	}
	{
		midinote = 51
		scr = LightShow_SetTime
		params = {
			time = 0.8
		}
	}
	{
		midinote = 50
		scr = LightShow_SetTime
		params = {
			time = 0.7
		}
	}
	{
		midinote = 49
		scr = LightShow_SetTime
		params = {
			time = 0.6
		}
	}
	{
		midinote = 48
		scr = LightShow_SetTime
		params = {
			time = 0.5
		}
	}
	{
		midinote = 47
		scr = LightShow_SetTime
		params = {
			time = 0.4
		}
	}
	{
		midinote = 46
		scr = LightShow_SetTime
		params = {
			time = 0.3
		}
	}
	{
		midinote = 45
		scr = LightShow_SetTime
		params = {
			time = 0.25
		}
	}
	{
		midinote = 44
		scr = LightShow_SetTime
		params = {
			time = 0.2
		}
	}
	{
		midinote = 43
		scr = LightShow_SetTime
		params = {
			time = 0.15
		}
	}
	{
		midinote = 42
		scr = LightShow_SetTime
		params = {
			time = 0.1
		}
	}
	{
		midinote = 41
		scr = LightShow_SetTime
		params = {
			time = 0.05
		}
	}
	{
		midinote = 40
		scr = LightShow_SetTime
		params = {
			time = 0.0
		}
	}
	{
		midinote = 39
		scr = LightShow_SetTime
		params = {
			`default`
		}
	}
]
LightShow_SharedProcessors = [
	{
		name = Poor_Generic
		screnter = LightShow_Poor_Enter
		screvent = LightShow_Poor_Event
		screxit = LightShow_Poor_Exit
	}
	{
		name = Intro_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Verse_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Chorus_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Solo_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Fail_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Win_Generic
		screnter = LightShow_GenericMood_Enter
		screvent = LightShow_GenericMood_Event
		screxit = LightShow_GenericMood_Exit
	}
	{
		name = Blackout_Generic
		screnter = LightShow_Blackout_Enter
		screvent = LightShow_Blackout_Event
		screxit = LightShow_Blackout_Exit
	}
	{
		name = Flare_Generic
		screnter = LightShow_Flare_Enter
		screvent = LightShow_Flare_Event
		screxit = LightShow_Flare_Exit
	}
	{
		name = Strobe_Generic
		screnter = LightShow_Strobe_Enter
		screvent = LightShow_Strobe_Event
		screxit = LightShow_Strobe_Exit
	}
]

script lightshow_iterator 
	printf "LightShow Iterator started with time %d" d = <time_offset>
	LightShow_SetActive \{active = FALSE}
	if ($lightshow_enabled = 0)
		printf \{"LIGHTSHOW DISABLED: By script variable"}
		return
	endif
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		printf \{"LIGHTSHOW DISABLED: No midi events found for this song"}
		return
	endif
	if NOT lightshow_initeventmappings <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		array_size = (<array_size> - <array_entry>)
		if NOT (<array_size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			LightShow_Update
			if TimeMarkerReached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1 gameframe}
			repeat
			TimeMarkerReached_ClearParams
			if LightShow_BeginProcessBlock {time = ($<event_array> [<array_entry>] [0])
					note = ($<event_array> [<array_entry>] [1])
					Length = ($<event_array> [<array_entry>] [2])}
				switch <process_mode>
					case event
					LightShow_PassEvent
					case scr
					<eventscr> <eventparams>
				endswitch
				LightShow_EndProcessBlock
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_size>
		endif
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		LightShow_GetParams
		<pyro_script> performance = <performance>
	else
		printf \{"pyro!"}
	endif
endscript

script LightShow_Poor_Enter 
	LightShow_CycleNextSnapshot \{usesnapshotpositions = TRUE save = TRUE}
endscript

script LightShow_Poor_Exit 
endscript

script LightShow_Poor_Event 
	begin
	LightShow_WaitForNextEvent \{events = [snapshotchange]}
	repeat
endscript

script LightShow_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{usesnapshotpositions = TRUE save = TRUE}
endscript

script LightShow_GenericMood_Exit 
endscript

script LightShow_GenericMood_Event 
	begin
	LightShow_WaitForNextEvent \{events = [snapshotchange]}
	LightShow_CycleNextSnapshot usesnapshotpositions = <usesnapshotpositions> save = TRUE
	repeat
endscript

script LightShow_Blackout_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{intensity = 0.25 specularintensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE usesnapshotpositions = TRUE}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{intensity = 0.25 specularintensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE usesnapshotpositions = TRUE}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Strobe_Enter 
	LightShow_SetTime \{enable = FALSE}
endscript

script LightShow_Strobe_Event 
	LightShow_GetParams
	<original_snapshot> = <previous_snapshot>
	begin
	LightShow_CycleNextSnapshot \{usesnapshotpositions = FALSE save = FALSE}
	LightShow_WaitForNextEvent \{events = [strobetoggle]}
	LightShow_AppendSnapshotParams \{intensity = 1.0}
	if GotParam \{original_snapshot}
		LightShow_PlaySnapshot name = <original_snapshot> save = FALSE usesnapshotpositions = FALSE
	else
		LightShow_CycleNextSnapshot \{usesnapshotpositions = FALSE save = TRUE}
	endif
	LightShow_WaitForNextEvent \{events = [strobetoggle]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_SetTime \{enable = TRUE}
endscript

script LightShow_AddNodeFlags 
	GetArraySize \{$LightShow_StateNodeFlags}
	<i> = 0
	begin
	createnodeflag ($LightShow_StateNodeFlags [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	createnodeflag \{LS_ALWAYS}
	createnodeflag \{LS_3_5_PRE}
	createnodeflag \{LS_3_5_POST}
	createnodeflag \{LS_ENCORE_PRE}
	createnodeflag \{ls_encore_post}
	createnodeflag \{LS_SPOTLIGHT_GUITARIST}
	createnodeflag \{LS_SPOTLIGHT_BASSIST}
endscript

script lightshow_initeventmappings 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_OverrideColor \{Off}
	LightShow_SetTime \{`default` enable = TRUE}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST 1}
	if ($current_num_players = 1)
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST 0}
	else
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST 1}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = event_struct '%s_lightshow_mapping' s = <pakname> addtostringlookup
	FormatText checksumname = snapshot_struct '%s_snapshots' s = <pakname> addtostringlookup
	FormatText checksumname = processors_struct '%s_lightshow_processors' s = <pakname> addtostringlookup
	if NOT globalexists name = <event_struct> type = structure
		printf \{"LIGHTSHOW DISABLED: No event mapping found for this venue"}
		printstruct <...>
		return \{FALSE}
	endif
	if NOT globalexists name = <snapshot_struct> type = structure
		printf \{"LIGHTSHOW DISABLED: No snapshots found for this venue"}
		printstruct <...>
		return \{FALSE}
	endif
	if globalexists name = <processors_struct> type = array
		printf \{"LIGHTSHOW: Adding venue processor definitions"}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{active = TRUE}
	LightShow_SetParams {
		performance = medium
		mood = intro
		venuesnapshots = $<snapshot_struct>
	}
	LightShow_RefreshSpotlightOverrideParams
	if NOT ($debug_forcescore = Off)
		crowdincrease \{player_status = player1_status}
	endif
	return \{TRUE}
endscript

script LightShow_Shutdown 
	printf \{"LightShow_Shutdown starting"}
	LightShow_SetActive \{active = FALSE}
	LightShow_SetProcessors \{Clear}
	LightShow_SetMapping \{Clear}
	KillSpawnedScript \{name = lightshow_iterator}
	KillSpawnedScript \{id = lightshow}
	KillSpawnedScript \{id = screenflash}
	printf \{"LightShow_Shutdown finished"}
endscript

script Kill_LightShow_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case Z_Wikker
		DestroyParticlesByGroupID \{groupid = Z_Wikker_FX}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX11}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX12}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX13}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX21}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX22}
		DeleteTeslaEffectObject \{name = Z_Wikker_TeslaFX23}
		DeleteTeslaEffectObject \{name = Z_Wikker_Encore_TeslaFX1}
		DeleteTeslaEffectObject \{name = Z_Wikker_Encore_TeslaFX2}
		DeleteTeslaEffectObject \{name = Z_Wikker_Encore_TeslaFX3}
	endswitch
endscript

script LightShow_WaitAndEnableSpotlights 
	RequireParams \{[enable time] all}
	printf "LightShow - spotlight toggle %s" s = <enable>
	wait <time> seconds
	LightShow_EnableSpotlights <enable>
endscript

script Venue_PulseOnEvents \{amount = 1.12 time = 0.1}
	if GotParam \{delay}
		RequireParams \{[events] all}
		obj_enablescaling
		obj_getscaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <amount>)
		begin
		Block anytypes = <events>
		wait <delay> seconds
		obj_applyscaling Scale = <end_scale>
		wait \{1 gameframes}
		obj_morphscaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		AddPulseEvent events = <events> amount = <amount> time = <time>
	endif
endscript

script Venue_PulseGreen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green]}
endscript

script Venue_PulseRed 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_red]}
endscript

script Venue_PulseYellow 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_yellow]}
endscript

script Venue_PulseBlue 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_blue]}
endscript

script Venue_PulseOrange 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_orange]}
endscript

script Venue_PulseOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	SetSpawnInstanceLimits \{max = 2 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [DrumKick_Left] amount = 1.1 delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	SetSpawnInstanceLimits \{max = 2 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [DrumKick_Right] amount = 1.1 delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	SetSpawnInstanceLimits \{max = 4 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [DrumKick_Left DrumKick_Right] amount = 1.1 delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green hitnote_red hitnote_yellow hitnote_blue hitnote_orange]}
endscript

script Venue_PulseGreenRed 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green hitnote_red]}
endscript

script Venue_PulseGreenYellow 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green hitnote_yellow]}
endscript

script Venue_PulseGreenBlue 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green hitnote_blue]}
endscript

script Venue_PulseGreenOrange 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green hitnote_orange]}
endscript

script Venue_PulseGreenOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_green]}
endscript

script Venue_PulseRedYellow 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_red hitnote_yellow]}
endscript

script Venue_PulseRedBlue 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_red hitnote_blue]}
endscript

script Venue_PulseRedOrange 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_red hitnote_orange]}
endscript

script Venue_PulseRedOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_red]}
endscript

script Venue_PulseYellowBlue 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_yellow hitnote_blue]}
endscript

script Venue_PulseYellowOrange 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_yellow hitnote_orange]}
endscript

script Venue_PulseYellowOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_yellow]}
endscript

script Venue_PulseBlueOrange 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_blue hitnote_orange]}
endscript

script Venue_PulseBlueOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_blue]}
endscript

script Venue_PulseOrangeOpen 
	SetSpawnInstanceLimits \{max = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [hitnote_orange]}
endscript
