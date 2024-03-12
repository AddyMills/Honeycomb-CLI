lightshow_enabled = 1
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 0.6
lightvolume_follow = {
	allowedRadius = {
		amplitude = 0.2
		Center = 1.0
		periodBase = 0.0065
		periodMultiples = [
			1
			3
			4
			7
		]
	}
	driftLerpMap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_spotlightoverrides = {
	fade_time = 0.5
	snapshot_names_to_search = [
		solo01
	]
	default_params = {
		StartRadius = 0.3
		EndRadius = 1.5
		innerradius = 0.0
		Range = 7.36
		volumeDensity = 0.6442
		ProjectorColorRed = 170.0
		ProjectorColorGreen = 170.0
		ProjectorColorBlue = 170.0
		VolumeColorRed = 255.0
		VolumeColorGreen = 255.0
		VolumeColorBlue = 255.0
	}
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
lightshow_housingmodels = [
	{
		model = 'LightHousings\\GO_NoHousing01\\GO_NoHousing01.mdl'
		CloneSrc = LS_GO_NoHousing01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_Flare01\\GO_NoHousing01_Flare01.mdl'
		CloneSrc = LS_GO_NoHousing01_Flare01
	}
	{
		model = 'LightHousings\\GO_NoHousing01_SmallFlare01\\GO_NoHousing01_SmallFlare01.mdl'
		CloneSrc = LS_GO_NoHousing01_SmallFlare01
	}
	{
		model = 'LightHousings\\GO_BarnHousing01\\GO_BarnHousing01.mdl'
		CloneSrc = LS_GO_BarnHousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01\\GO_LightHousing01.mdl'
		CloneSrc = LS_GO_LightHousing01
	}
	{
		model = 'LightHousings\\GO_LightHousing01_SmallFlare01\\GO_LightHousing01_SmallFlare01.mdl'
		CloneSrc = LS_GO_LightHousing01_SmallFlare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02\\GO_LightHousing02.mdl'
		CloneSrc = LS_GO_LightHousing02
	}
	{
		model = 'LightHousings\\GO_LightHousing02_SmallFlare01\\GO_LightHousing02_SmallFlare01.mdl'
		CloneSrc = LS_GO_LightHousing02_SmallFlare01
	}
	{
		model = 'LightHousings\\GO_LightHousing02_Small01\\GO_LightHousing02_Small01.mdl'
		CloneSrc = LS_GO_LightHousing02_Small01
	}
	{
		model = 'LightHousings\\GO_TankHousing01\\GO_TankHousing01.mdl'
		CloneSrc = LS_GO_TankHousing01
	}
]

script LightShow_CreatePermModels 
	getArraySize \{$lightshow_housingmodels}
	<I> = 0
	begin
	<desc> = ($lightshow_housingmodels [<I>])
	<model> = (<desc>.model)
	<pos> = ((-100.0, 300.0) + <I> * (0.0, 10.0))
	<src> = (<desc>.CloneSrc)
	CreateCompositeObject {
		components = [
			{
				component = model
				model = <model>
			}
		]
		Params = {
			pos = <pos>
			Name = <src>
		}
	}
	<src> :Hide
	<src> :obj_forceupdate
	<src> :suspend
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script LS_AllOff 
	killspawnedScript \{Id = Lightshow}
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = Zones}
endscript

script LS_KillFX 
endscript
LightShow_ColorOverrides = {
	Red = (255.0, 0.0, 0.0)
	Blue = (20.0, 132.0, 247.0)
	Yellow = (252.0, 227.0, 61.0)
	White = (255.0, 255.0, 255.0)
	Magenta = (240.0, 79.0, 255.0)
	Green = (66.0, 228.0, 97.0)
	Purple = (162.0, 80.0, 232.0)
	Orange = (248.0, 142.0, 56.0)
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
	Z_Hell_GFX_L_Band_Fire_Direct01
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
	ls_perf_poor
	ls_perf_medium
	ls_perf_good
	ls_perf_poor_medium
	ls_perf_medium_good
	ls_perf_poor_medium_good
	ls_perf_poor_noblackout
	LS_PERF_MEDIUM_NOBLACKOUT
	LS_PERF_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_NOBLACKOUT
	ls_perf_medium_good_noblackout
	LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
	LS_MOOD_SPECIAL
]
LightShow_StateNodeFlagMapping = {
	performance = {
		Poor = [
			{
				ls_perf_poor
				1
			}
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_poor_noblackout
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
		MEDIUM = [
			{
				ls_perf_poor_medium
				1
			}
			{
				ls_perf_medium
				1
			}
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_poor_medium_good
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
				ls_perf_medium_good_noblackout
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		GOOD = [
			{
				ls_perf_medium_good
				1
			}
			{
				ls_perf_good
				1
			}
			{
				ls_perf_poor_medium_good
				1
			}
			{
				ls_perf_medium_good_noblackout
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
		BlackOut = [
			{
				LS_MOOD_BLACKOUT
				1
			}
			{
				ls_perf_poor
				0
			}
			{
				ls_perf_medium
				0
			}
			{
				ls_perf_good
				0
			}
			{
				ls_perf_poor_medium
				0
			}
			{
				ls_perf_medium_good
				0
			}
			{
				ls_perf_poor_medium_good
				0
			}
		]
		Flare = [
			{
				LS_MOOD_FLARE
				1
			}
			{
				ls_perf_poor
				0
			}
			{
				ls_perf_medium
				0
			}
			{
				ls_perf_good
				0
			}
			{
				ls_perf_poor_medium
				0
			}
			{
				ls_perf_medium_good
				0
			}
			{
				ls_perf_poor_medium_good
				0
			}
		]
		Strobe = [
			{
				LS_MOOD_STROBE
				1
			}
		]
	}
}
LightShow_NoteMapping = [
	{
		MidiNote = 76
		Scr = lightshow_setparams
		Params = {
			mood = INTRO
		}
	}
	{
		MidiNote = 75
		Scr = lightshow_setparams
		Params = {
			mood = verse
		}
	}
	{
		MidiNote = 74
		Scr = lightshow_setparams
		Params = {
			mood = Chorus
		}
	}
	{
		MidiNote = 73
		Scr = lightshow_setparams
		Params = {
			mood = solo
		}
	}
	{
		MidiNote = 72
		Scr = lightshow_setparams
		Params = {
			mood = BlackOut
		}
	}
	{
		MidiNote = 71
		Scr = lightshow_setparams
		Params = {
			mood = Flare
		}
	}
	{
		MidiNote = 70
		Scr = lightshow_setparams
		Params = {
			mood = Strobe
		}
	}
	{
		MidiNote = 69
		Scr = LightShow_OverrideColor
		Params = {
			Color = Green
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		Params = {
			Color = Red
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		Params = {
			Color = Blue
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		Params = {
			Color = Yellow
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		Params = {
			Color = White
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		Params = {
			Color = Magenta
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		Params = {
			OFF
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		Params = {
			Color = Orange
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		Params = {
			Color = Purple
		}
	}
	{
		MidiNote = 60
		Event = strobetoggle
		Params = {
			UseSnapshotPositions = FALSE
		}
	}
	{
		MidiNote = 58
		Event = snapshotChange
		Params = {
			UseSnapshotPositions = TRUE
		}
	}
	{
		MidiNote = 57
		Event = snapshotChange
		Params = {
			UseSnapshotPositions = FALSE
		}
	}
	{
		MidiNote = 56
		Scr = LightShow_PyroEvent
		Params = {
		}
	}
	{
		MidiNote = 53
		Scr = Lightshow_settime
		Params = {
			Time = 1.0
		}
	}
	{
		MidiNote = 52
		Scr = Lightshow_settime
		Params = {
			Time = 0.9
		}
	}
	{
		MidiNote = 51
		Scr = Lightshow_settime
		Params = {
			Time = 0.8
		}
	}
	{
		MidiNote = 50
		Scr = Lightshow_settime
		Params = {
			Time = 0.7
		}
	}
	{
		MidiNote = 49
		Scr = Lightshow_settime
		Params = {
			Time = 0.6
		}
	}
	{
		MidiNote = 48
		Scr = Lightshow_settime
		Params = {
			Time = 0.5
		}
	}
	{
		MidiNote = 47
		Scr = Lightshow_settime
		Params = {
			Time = 0.4
		}
	}
	{
		MidiNote = 46
		Scr = Lightshow_settime
		Params = {
			Time = 0.3
		}
	}
	{
		MidiNote = 45
		Scr = Lightshow_settime
		Params = {
			Time = 0.25
		}
	}
	{
		MidiNote = 44
		Scr = Lightshow_settime
		Params = {
			Time = 0.2
		}
	}
	{
		MidiNote = 43
		Scr = Lightshow_settime
		Params = {
			Time = 0.15
		}
	}
	{
		MidiNote = 42
		Scr = Lightshow_settime
		Params = {
			Time = 0.1
		}
	}
	{
		MidiNote = 41
		Scr = Lightshow_settime
		Params = {
			Time = 0.05
		}
	}
	{
		MidiNote = 40
		Scr = Lightshow_settime
		Params = {
			Time = 0.0
		}
	}
	{
		MidiNote = 39
		Scr = Lightshow_settime
		Params = {
			DEFAULT
		}
	}
]
LightShow_SharedProcessors = [
	{
		Name = Poor_Generic
		ScrEnter = LightShow_Poor_Enter
		ScrEvent = LightShow_Poor_Event
		ScrExit = LightShow_Poor_Exit
	}
	{
		Name = Intro_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Verse_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Chorus_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Solo_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Fail_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Win_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		Name = Blackout_Generic
		ScrEnter = LightShow_Blackout_Enter
		ScrEvent = LightShow_Blackout_Event
		ScrExit = LightShow_Blackout_Exit
	}
	{
		Name = Flare_Generic
		ScrEnter = LightShow_Flare_Enter
		ScrEvent = LightShow_Flare_Event
		ScrExit = LightShow_Flare_Exit
	}
	{
		Name = Strobe_Generic
		ScrEnter = LightShow_Strobe_Enter
		ScrEvent = LightShow_Strobe_Event
		ScrExit = LightShow_Strobe_Exit
	}
]

script lightshow_iterator 
	Printf "LightShow Iterator started with time %d" D = <time_offset>
	LightShow_SetActive \{Active = FALSE}
	if ($lightshow_enabled = 0)
		Printf \{"LIGHTSHOW DISABLED: By script variable"}
		return
	endif
	get_song_prefix Song = <song_name>
	formatText Checksumname = event_array '%s_lightshow_notes' S = <song_prefix> AddToStringLookup
	if NOT Globalexists Name = <event_array> Type = Array
		Printf \{"LIGHTSHOW DISABLED: No midi events found for this song"}
		return
	endif
	if NOT LightShow_InitEventMappings <...>
		return
	endif
	array_entry = 0
	fretbar_count = 0
	getArraySize $<event_array>
	GetSongtimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if NOT (<array_Size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			LightShow_Update
			if TimeMarkerReached
				GetSongtimeMS time_offset = <time_offset>
				break
			endif
			Wait \{1 GameFrame}
			repeat
			TimeMarkerReached_ClearParams
			if LightShow_BeginProcessBlock {Time = ($<event_array> [<array_entry>] [0])
					note = ($<event_array> [<array_entry>] [1])
					length = ($<event_array> [<array_entry>] [2])}
				switch <process_mode>
					case Event
					LightShow_PassEvent
					case Scr
					<eventscr> <eventParams>
				endswitch
				LightShow_EndProcessBlock
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		LightShow_GetParams
		<Pyro_Script> performance = <performance>
	else
		Printf \{"pyro!"}
	endif
endscript

script LightShow_Poor_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = TRUE save = TRUE}
endscript

script LightShow_Poor_Exit 
endscript

script LightShow_Poor_Event 
	begin
	LightShow_WaitForNextEvent \{events = [snapshotChange]}
	repeat
endscript

script LightShow_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = TRUE save = TRUE}
endscript

script LightShow_GenericMood_Exit 
endscript

script LightShow_GenericMood_Event 
	begin
	LightShow_WaitForNextEvent \{events = [snapshotChange]}
	LightShow_CycleNextSnapshot UseSnapshotPositions = <UseSnapshotPositions> save = TRUE
	repeat
endscript

script LightShow_Blackout_Enter 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25 SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE UseSnapshotPositions = TRUE}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{Intensity = 0.25 SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = FALSE UseSnapshotPositions = TRUE}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_Soundcheck
		case z_training
		case Z_Viewer
		LightShow_AppendSnapshotParams \{CLEAR}
	endswitch
endscript

script LightShow_Strobe_Enter 
	Lightshow_settime \{Enable = FALSE}
endscript

script LightShow_Strobe_Event 
	LightShow_GetParams
	<original_snapshot> = <previous_snapshot>
	begin
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = FALSE save = FALSE}
	LightShow_WaitForNextEvent \{events = [strobetoggle]}
	LightShow_AppendSnapshotParams \{Intensity = 1.0}
	if gotParam \{original_snapshot}
		LightShow_PlaySnapshot Name = <original_snapshot> save = FALSE UseSnapshotPositions = FALSE
	else
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = FALSE save = TRUE}
	endif
	LightShow_WaitForNextEvent \{events = [strobetoggle]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{CLEAR}
	Lightshow_settime \{Enable = TRUE}
endscript

script LightShow_AddNodeFlags 
	getArraySize \{$LightShow_StateNodeFlags}
	<I> = 0
	begin
	CreateNodeFlag ($LightShow_StateNodeFlags [<I>])
	<I> = (<I> + 1)
	repeat <array_Size>
	CreateNodeFlag \{LS_ALWAYS}
	CreateNodeFlag \{LS_3_5_PRE}
	CreateNodeFlag \{LS_3_5_POST}
	CreateNodeFlag \{LS_ENCORE_PRE}
	CreateNodeFlag \{LS_ENCORE_POST}
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
endscript

script LightShow_InitEventMappings 
	LightShow_AppendSnapshotParams \{CLEAR}
	LightShow_OverrideColor \{OFF}
	Lightshow_settime \{DEFAULT Enable = TRUE}
	changenodeflag \{LS_SPOTLIGHT_GUITARIST 1}
	if ($current_num_players = 1)
		changenodeflag \{LS_SPOTLIGHT_BASSIST 0}
	else
		changenodeflag \{LS_SPOTLIGHT_BASSIST 1}
	endif
	GetPakManCurrentName \{map = Zones}
	formatText Checksumname = event_struct '%s_lightshow_mapping' S = <pakname> AddToStringLookup
	formatText Checksumname = snapshot_struct '%s_snapshots' S = <pakname> AddToStringLookup
	formatText Checksumname = processors_struct '%s_lightshow_processors' S = <pakname> AddToStringLookup
	if NOT Globalexists Name = <event_struct> Type = Structure
		Printf \{"LIGHTSHOW DISABLED: No event mapping found for this venue"}
		printStruct <...>
		return \{FALSE}
	endif
	if NOT Globalexists Name = <snapshot_struct> Type = Structure
		Printf \{"LIGHTSHOW DISABLED: No snapshots found for this venue"}
		printStruct <...>
		return \{FALSE}
	endif
	if Globalexists Name = <processors_struct> Type = Array
		Printf \{"LIGHTSHOW: Adding venue processor definitions"}
		LightShow_SetProcessors Venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{Active = TRUE}
	lightshow_setparams {
		performance = MEDIUM
		mood = INTRO
		VenueSnapshots = $<snapshot_struct>
	}
	LightShow_RefreshSpotlightOverrideParams
	if NOT ($debug_forcescore = OFF)
		CrowdIncrease \{player_status = player1_status}
	endif
	return \{TRUE}
endscript

script LightShow_Shutdown 
	Printf \{"LightShow_Shutdown starting"}
	LightShow_SetActive \{Active = FALSE}
	LightShow_SetProcessors \{CLEAR}
	LightShow_SetMapping \{CLEAR}
	killspawnedScript \{Name = lightshow_iterator}
	killspawnedScript \{Id = Lightshow}
	killspawnedScript \{Id = ScreenFlash}
	Printf \{"LightShow_Shutdown finished"}
endscript

script Kill_LightShow_FX 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case z_wikker
		DestroyParticlesByGroupID \{groupID = Z_Wikker_FX}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX11}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX12}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX13}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX21}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX22}
		deleteTeslaEffectObject \{Name = Z_Wikker_TeslaFX23}
		deleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX1}
		deleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX2}
		deleteTeslaEffectObject \{Name = Z_Wikker_Encore_TeslaFX3}
	endswitch
endscript

script LightShow_WaitAndEnableSpotlights 
	Requireparams \{[Enable Time] All}
	Printf "LightShow - spotlight toggle %s" S = <Enable>
	Wait <Time> Seconds
	LightShow_EnableSpotlights <Enable>
endscript

script Venue_PulseOnEvents \{Amount = 1.12 Time = 0.1}
	if gotParam \{Delay}
		Requireparams \{[events] All}
		Obj_EnableScaling
		Obj_GetScaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <Amount>)
		begin
		block anytypes = <events>
		Wait <Delay> Seconds
		Obj_ApplyScaling scale = <end_scale>
		Wait \{1 gameframes}
		Obj_MorphScaling target_Scale = <start_scale> Blend_Duration = <Time>
		repeat
	else
		AddPulseEvent events = <events> Amount = <Amount> Time = <Time>
	endif
endscript

script Venue_PulseGreen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green]}
endscript

script Venue_PulseRed 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Red]}
endscript

script Venue_PulseYellow 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Yellow]}
endscript

script Venue_PulseBlue 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Blue]}
endscript

script Venue_PulseOrange 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Orange]}
endscript

script Venue_PulseOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	setSpawnInstanceLimits \{MAX = 2 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [drumkick_left] Amount = 1.1 Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	setSpawnInstanceLimits \{MAX = 2 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [drumkick_right] Amount = 1.1 Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	setSpawnInstanceLimits \{MAX = 4 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [drumkick_left drumkick_right] Amount = 1.1 Delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green HitNote_Red HitNote_Yellow HitNote_Blue HitNote_Orange]}
endscript

script Venue_PulseGreenRed 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green HitNote_Red]}
endscript

script Venue_PulseGreenYellow 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green HitNote_Yellow]}
endscript

script Venue_PulseGreenBlue 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green HitNote_Blue]}
endscript

script Venue_PulseGreenOrange 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green HitNote_Orange]}
endscript

script Venue_PulseGreenOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Green]}
endscript

script Venue_PulseRedYellow 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Red HitNote_Yellow]}
endscript

script Venue_PulseRedBlue 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Red HitNote_Blue]}
endscript

script Venue_PulseRedOrange 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Red HitNote_Orange]}
endscript

script Venue_PulseRedOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Red]}
endscript

script Venue_PulseYellowBlue 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Yellow HitNote_Blue]}
endscript

script Venue_PulseYellowOrange 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Yellow HitNote_Orange]}
endscript

script Venue_PulseYellowOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Yellow]}
endscript

script Venue_PulseBlueOrange 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Blue HitNote_Orange]}
endscript

script Venue_PulseBlueOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Blue]}
endscript

script Venue_PulseOrangeOpen 
	setSpawnInstanceLimits \{MAX = 8 management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [HitNote_Orange]}
endscript
