CameraCuts_Good_Array = Default_Cameras_Good
CameraCuts_Normal_Array = Default_Cameras_Normal
CameraCuts_Poor_Array = Default_Cameras_Poor
CameraCuts_Performance = good
cameracuts_lastarray = CameraCuts_Good_Array
CameraCuts_LastPerformance = good
CameraCuts_Enabled = FALSE
cameracuts_lastindex = 0
cameracuts_lasttype = None
CameraCuts_LastDownbeatIndex = 0
CameraCuts_ChangeTime = 0
CameraCuts_ChangeNow = FALSE
CameraCuts_ForceTime = 0
CameraCuts_NextTime = 0
CameraCuts_ArrayPrefix = 'Cameras'
CameraCuts_ForceType = None
CameraCuts_NextName = None
CameraCuts_ChangeCamEnable = TRUE
CameraCuts_AllowNoteScripts = TRUE
CameraCuts_LastCameraStartTime = 0.0
CameraCuts_ForceChangeTime = 0.0
cameracuts_shadowcasters = None
CameraCuts_NextNoteCameraTime = -1
CameraCuts_NoteMapping = [
	{
		midinote = 77
		scr = CameraCuts_EnableChangeCam
		params = {
			enable = TRUE
		}
	}
	{
		midinote = 78
		scr = CameraCuts_EnableChangeCam
		params = {
			enable = FALSE
		}
	}
	{
		midinote = 79
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
		}
	}
	{
		midinote = 80
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_intro'
			changenow
		}
	}
	{
		midinote = 81
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		midinote = 82
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			name = Dolly_StageFront
		}
	}
	{
		midinote = 83
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
		}
	}
	{
		midinote = 84
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = CloseUp
		}
	}
	{
		midinote = 85
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = mid
		}
	}
	{
		midinote = 86
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = longshot
		}
	}
	{
		midinote = 87
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras'
			changenow
			type = stage
		}
	}
	{
		midinote = 88
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
		}
	}
	{
		midinote = 89
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
		}
	}
	{
		midinote = 90
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_solo'
			selectguitartype
			changenow
		}
	}
	{
		midinote = 91
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_stage
		}
	}
	{
		midinote = 92
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_drummer
		}
	}
	{
		midinote = 93
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_closeup
		}
	}
	{
		midinote = 94
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_mid
		}
	}
	{
		midinote = 95
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitar_closeup'
			changenow
			name = guitar_closeup
		}
	}
	{
		midinote = 96
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_starpower'
			changenow
		}
	}
	{
		midinote = 97
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
		}
	}
	{
		midinote = 98
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_walk'
			changenow
		}
	}
	{
		midinote = 99
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_guitarist'
			changenow
		}
	}
	{
		midinote = 100
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_drummer'
			changenow
		}
	}
	{
		midinote = 101
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_stagefront'
			changenow
		}
	}
	{
		midinote = 102
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_vert_stagerear'
			changenow
		}
	}
	{
		midinote = 103
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_orbit'
			changenow
			name = orbit_singer
		}
	}
	{
		midinote = 104
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer_closeup'
			changenow
		}
	}
	{
		midinote = 105
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
		}
	}
	{
		midinote = 106
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special01
		}
	}
	{
		midinote = 107
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special02
		}
	}
	{
		midinote = 108
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special03
		}
	}
	{
		midinote = 109
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			name = special04
		}
	}
	{
		midinote = 110
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			name = Dolly_StageRear
		}
	}
	{
		midinote = 111
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_slow'
			changenow
		}
	}
	{
		midinote = 112
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_fast'
			changenow
		}
	}
	{
		midinote = 113
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom_out'
			changenow
		}
	}
	{
		midinote = 114
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_pan'
			changenow
		}
	}
	{
		midinote = 115
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_boss_closeup'
			changenow
		}
	}
	{
		midinote = 116
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_player_closeup'
			changenow
		}
	}
	{
		midinote = 117
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stagedive'
			changenow
		}
	}
]

script cameracuts_iterator 
	printf "Cameras Iterator started with time %d" d = <time_offset>
	change \{CameraCuts_NextNoteCameraTime = -1}
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_cameras_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
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
			change CameraCuts_NextNoteCameraTime = ($<event_array> [<array_entry>] [0] - <time_offset>)
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry> arrayofarrays
			begin
			if TimeMarkerReached
				getsongtimems time_offset = <time_offset>
				break
			endif
			wait \{1 gameframe}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if ($CameraCuts_AllowNoteScripts = TRUE)
				if GetNoteMapping section = cameras note = <note>
					spawnscriptnow (<note_data>.scr) params = {(<note_data>.params) Length = ($<event_array> [<array_entry>] [2])}
				endif
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_size>
		endif
	endif
	change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script CameraCuts_GetNextNoteCameraTime 
	return camera_time = ($CameraCuts_NextNoteCameraTime)
endscript

script CameraCuts_SetArray \{type = good array = Default_Cameras_Good}
	if (<type> = good)
		change CameraCuts_Good_Array = <array>
	endif
	if (<type> = medium)
		change CameraCuts_Normal_Array = <array>
	endif
	if (<type> = poor)
		change CameraCuts_Poor_Array = <array>
	endif
endscript

script cameracuts_setparams \{performance = medium}
	change CameraCuts_Performance = <performance>
endscript

script CameraCuts_SetArrayPrefix \{prefix = 'cameras' type = None name = None Length = 0}
	if GotParam \{selectguitartype}
		if ($player1_status.instrument_id = Instrument_Guitar_Demonik)
			type = demonik
		else
			type = normal
		endif
	endif
	change CameraCuts_ArrayPrefix = <prefix>
	change CameraCuts_ForceType = <type>
	change CameraCuts_NextName = <name>
	set_defaultcameracuts
	if GotParam \{changetime}
		change CameraCuts_ForceChangeTime = <changetime>
	endif
	if GotParam \{changenow}
		if (<Length> > 200)
			change CameraCuts_NextTime = <Length>
		endif
		CameraCuts_EnableChangeCam \{enable = TRUE}
	endif
endscript

script set_defaultcameracut_perf \{perf = 'good' perf_checksum = good}
	GetPakManCurrentName \{map = zones}
	if ($current_num_players = 2)
		FormatText checksumname = Cameras_Array '%s_%p_%c_2p' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
		if globalexists name = <Cameras_Array> type = array
			CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
			return
		endif
		FormatText checksumname = Cameras_Array '%s_%p_2p' p = $CameraCuts_ArrayPrefix s = <pakname>
		if globalexists name = <Cameras_Array> type = array
			CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
			return
		endif
	endif
	FormatText checksumname = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
	if globalexists name = <Cameras_Array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	FormatText checksumname = Cameras_Array '%s_%p' p = $CameraCuts_ArrayPrefix s = <pakname>
	if globalexists name = <Cameras_Array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	FormatText checksumname = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = 'default'
	if globalexists name = <Cameras_Array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	FormatText \{checksumname = Cameras_Array '%s_%p' p = $CameraCuts_ArrayPrefix s = 'default'}
	if globalexists name = <Cameras_Array> type = array
		CameraCuts_SetArray type = <perf_checksum> array = <Cameras_Array>
		return
	endif
	printstruct <...> prefix = ($CameraCuts_ArrayPrefix)
	scriptassert \{"CameraCut Array not found"}
endscript

script set_defaultcameracuts 
	set_defaultcameracut_perf \{perf = 'good' perf_checksum = good}
	set_defaultcameracut_perf \{perf = 'normal' perf_checksum = medium}
	set_defaultcameracut_perf \{perf = 'poor' perf_checksum = poor}
endscript

script create_cameracuts 
	change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	SetNoteMappings \{section = cameras mapping = $CameraCuts_NoteMapping}
	kill_dummy_bg_camera
	change \{cameracuts_lasttype = None}
	change \{CameraCuts_LastDownbeatIndex = 0}
	change \{CameraCuts_ForceChangeTime = 0.0}
	change \{CameraCuts_ForceType = None}
	change \{CameraCuts_NextName = None}
	if ($game_mode = training)
		change \{CameraCuts_ChangeCamEnable = FALSE}
		change \{CameraCuts_AllowNoteScripts = FALSE}
	else
		change \{CameraCuts_ChangeCamEnable = TRUE}
		change \{CameraCuts_AllowNoteScripts = TRUE}
	endif
	change \{CameraCuts_Enabled = TRUE}
	CameraCuts_StartCallback
endscript

script CameraCuts_GetNextDownbeat 
	get_song_prefix song = ($current_song)
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> addtostringlookup
	if NOT globalexists name = <event_array> type = array
		return endtime = <endtime>
	endif
	GetArraySize $<event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_size = (<array_size> - <array_count>)
	if (<array_size> > 0)
		begin
		if ($<event_array> [<array_count>] [1] = 58)
			if ($<event_array> [<array_count>] [0] > <endtime>)
				change CameraCuts_LastDownbeatIndex = <array_count>
				return endtime = ($<event_array> [<array_count>] [0])
			endif
		endif
		array_count = (<array_count> + 1)
		repeat <array_size>
	endif
	return endtime = <endtime>
endscript

script CameraCuts_StartCallback 
	change \{CameraCuts_ChangeNow = FALSE}
	if ($CameraCuts_Enabled = FALSE)
		return
	endif
	if ($CameraCuts_Performance = poor)
		camera_array = CameraCuts_Poor_Array
	else
		if ($CameraCuts_Performance = good)
			camera_array = CameraCuts_Good_Array
		else
			camera_array = CameraCuts_Normal_Array
		endif
	endif
	if CompositeObjectExists \{name = guitarist}
		guitarist :get_target_node
	endif
	if NOT ($CameraCuts_NextName = None)
		CameraCut_GetArraySize camera_array = <camera_array> name = ($CameraCuts_NextName) target_node = <target_node>
		elseif NOT ($CameraCuts_ForceType = None)
		CameraCut_GetArraySize camera_array = <camera_array> includetype = $CameraCuts_ForceType target_node = <target_node>
	else
		CameraCut_GetArraySize camera_array = <camera_array> excludetype = $cameracuts_lasttype target_node = <target_node>
	endif
	if (<array_size> = 0)
		newindex = 0
	else
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		CameraCut_GetCameraIndex camera_array = <camera_array> newindex = <newindex>
	endif
	debug_flags = None
	if NOT ($debug_camera_array = None)
		found = 0
		FormatText \{checksumname = New_Camera_Array '%s_%p' s = $debug_camera_array_pakname p = $debug_camera_array}
		if globalexists name = <New_Camera_Array>
			GetArraySize $<New_Camera_Array>
			index = ($debug_camera_array_count)
			if (<index> < <array_size>)
				camera_array = <New_Camera_Array>
				newindex = ($debug_camera_array_count)
				found = 1
				debug_flags = update_when_paused
			endif
		endif
		if (found = 0)
			change \{debug_camera_array = None}
			change \{debug_camera_array_pakname = None}
			change \{debug_camera_array_count = None}
		endif
	endif
	change cameracuts_lastarray = <camera_array>
	change \{CameraCuts_LastPerformance = $CameraCuts_Performance}
	change cameracuts_lastindex = <newindex>
	if StructureContains structure = (<camera_array> [<newindex>]) type
		change cameracuts_lasttype = ($<camera_array> [<newindex>].type)
		elseif StructureContains structure = (<camera_array> [<newindex>]) params
		if StructureContains structure = (<camera_array> [<newindex>].params) type
			change cameracuts_lasttype = ($<camera_array> [<newindex>].params.type)
		else
			change \{cameracuts_lasttype = None}
		endif
	else
		change \{cameracuts_lasttype = None}
	endif
	if ($debug_showcameraname = on)
		CameraCuts_UpdateDebugCameraName
	endif
	if ($output_gpu_log = 1)
		CameraCuts_OutputGPULog
	endif
	if StructureContains structure = (<camera_array> [<newindex>]) params
		camStruct = ((<camera_array> [<newindex>]).params)
		if NOT StructureContains structure = <camStruct> DOF
			camStruct = (<camera_array> [<newindex>])
		endif
	endif
	if StructureContains structure = <camStruct> DOF
		if StructureContains structure = (<camStruct>.DOF) screen_FX
			dofType = (<camStruct>.DOF)
			dofParam = (<dofType>.screen_FX [0])
		endif
	else
		dofParam = ($DOF_Off_tod_manager.screen_FX [0])
	endif
	if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = venue_DOF
			<dofParam>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = venue_DOF
			<dofParam>
		}
	endif
	if StructureContains structure = (<camera_array> [<newindex>]) CrowdOff
		enable_crowd_models_cfunc \{active = FALSE}
	else
		enable_crowd_models_cfunc \{active = TRUE}
	endif
	if StructureContains structure = (<camera_array> [<newindex>]) ShadowCasters
		change cameracuts_shadowcasters = (<camera_array> [<newindex>].ShadowCasters)
	else
		change \{cameracuts_shadowcasters = None}
	endif
	change \{structurename = guitarist_info waiting_for_cameracut = FALSE}
	change \{structurename = bassist_info waiting_for_cameracut = FALSE}
	getsongtimems
	change CameraCuts_LastCameraStartTime = <time>
	camparams = (<camera_array> [<newindex>])
	CameraCut_SwapLookAts
	PlayIGCCam {
		time = <camera_time>
		viewport = bg_viewport
		ControlScript = CameraCuts_StaticCamControl
		params = {camparams = <camparams>}
		<camparams>
		exitscript = CameraCuts_StartCallback
		Play_hold = 0
		name = CameraCutCam
		<debug_flags>
	}
endscript

script CameraCuts_UpdateDebugCameraName 
	if ScreenElementExists \{id = debug_camera_name_text}
		GetArraySize ($cameracuts_lastarray)
		cameraname = None
		if ($cameracuts_lastindex < <array_size>)
			if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) params
				if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex].params) name
					cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].params.name)
				endif
			endif
			if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) name
				cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].name)
			endif
		endif
		<crowd> = 1
		if StructureContains structure = ($cameracuts_lastarray [$cameracuts_lastindex]) CrowdOff
			<crowd> = 0
		endif
		FormatText textname = cameraname "%s type=%t crowd=%c" s = <cameraname> t = $cameracuts_lasttype c = <crowd> DontAssertForChecksums
		debug_camera_name_text :setprops text = <cameraname>
	endif
endscript

script CameraCuts_OutputGPULog 
	GetArraySize ($cameracuts_lastarray)
	cameraname = None
	if ($cameracuts_lastindex < <array_size>)
		if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) params
			if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex].params) name
				cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].params.name)
			endif
		endif
		if StructureContains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) name
			cameraname = ($cameracuts_lastarray [$cameracuts_lastindex].name)
		endif
	endif
	<crowd> = 1
	if StructureContains structure = ($cameracuts_lastarray [$cameracuts_lastindex]) CrowdOff
		<crowd> = 0
	endif
	FormatText textname = text "Cam: %s, type: %t, crowd: %c ; ; ; 16.667" s = <cameraname> t = $cameracuts_lasttype c = <crowd> DontAssertForChecksums
	TextOutput text = <text>
endscript

script destroy_cameracuts 
	change \{CameraCuts_Enabled = FALSE}
	KillSpawnedScript \{name = CameraCuts_StartCallback}
	KillCamAnim \{name = CameraCutCam}
	kill_dummy_bg_camera
	ClearNoteMappings \{section = cameras}
	KillSpawnedScript \{name = cameracuts_iterator}
endscript
profiling_cameracuts = FALSE

script profile_camera_cuts \{filename = "ProfileCameras"}
	if ($profiling_cameracuts = TRUE)
		return
	endif
	change \{profiling_cameracuts = TRUE}
	hide_analog_options
	setslomo \{0.001}
	setslomo_song \{slomo = 0.001}
	dumpprofilestart
	GetPakManCurrentName \{map = zones}
	camera_count = 0
	begin
	switch <camera_count>
		case 0
		suffix = "cameras_good"
		case 1
		suffix = "cameras_normal"
		case 2
		suffix = "cameras_poor"
		case 3
		suffix = "cameras_good_2p"
		case 4
		suffix = "cameras_normal_2p"
		case 5
		suffix = "cameras_poor_2p"
	endswitch
	FormatText checksumname = camera_array '%s_%p' s = <pakname> p = <suffix>
	if globalexists name = <camera_array>
		GetArraySize $<camera_array>
		array_count = 0
		begin
		profile_cameracut Camera_Array_pakname = <pakname> camera_array = <suffix> array_count = <array_count>
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
	camera_count = (<camera_count> + 1)
	repeat 6
	change \{debug_camera_array = None}
	destroy_cameracuts
	wait \{3 gameframes}
	create_cameracuts
	dumpprofileend output_text output_file filename = <filename>
	setslomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	change \{profiling_cameracuts = FALSE}
endscript

script profile_cameracut 
	change debug_camera_array = <camera_array>
	change debug_camera_array_pakname = <Camera_Array_pakname>
	change debug_camera_array_count = <array_count>
	cpu = $current_cpu
	ToggleMetrics \{mode = 2}
	change \{current_cpu = 6}
	destroy_cameracuts
	wait \{2 gameframes}
	create_cameracuts
	wait \{3 gameframes}
	profile_camera_gpu
	ToggleMetrics \{mode = 0}
	change current_cpu = <cpu>
endscript

script profile_camera_gpu 
	FormatText \{checksumname = New_Camera_Array '%s_%p' s = $debug_camera_array_pakname p = $debug_camera_array}
	camera_array = $<New_Camera_Array>
	if StructureContains structure = (<camera_array> [$debug_camera_array_count]) name
		FormatText textname = Title "Camera %n Profile Dump" n = ((<camera_array> [$debug_camera_array_count]).name) DontAssertForChecksums
	else
		FormatText textname = Title "Camera %n Profile Dump" n = ((<camera_array> [$debug_camera_array_count]).params.name) DontAssertForChecksums
	endif
	dumpprofile cpu = 6 Title = <Title> current_time_only
endscript

script CameraCuts_EnableChangeCam 
	change CameraCuts_ChangeCamEnable = <enable>
	change \{CameraCuts_ChangeNow = TRUE}
endscript

script CameraCuts_CalcTime 
	if ($CameraCuts_ChangeNow = TRUE)
		camera_time = 0
		getsongtimems
		camera_songtime = (<time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($CameraCuts_ForceTime = 0)
		if ($CameraCuts_NextTime = 0)
			camera_time = RandomRange (3.0, 8.0)
			getsongtimems
			endtime = (<time> + <camera_time> * 1000)
			CameraCuts_GetNextDownbeat endtime = <endtime>
			camera_time = ((<endtime> - <time>) / 1000.0)
		else
			camera_time = ($CameraCuts_NextTime / 1000.0)
			change \{CameraCuts_NextTime = 0}
		endif
	else
		camera_time = ($CameraCuts_ForceTime)
	endif
	getsongtimems
	camera_songtime = (<time> + <camera_time> * 1000)
	return camera_time = <camera_time> camera_songtime = <camera_songtime>
endscript

script CameraCuts_WaitScript \{camera_time = 0 camera_songtime = 0}
	getsongtimems
	change CameraCuts_ChangeTime = <camera_songtime>
	begin
	getsongtimems
	if (<time> >= $CameraCuts_ChangeTime ||
			$CameraCuts_ChangeNow = TRUE)
		if ($CameraCuts_ChangeCamEnable = TRUE)
			break
		endif
	endif
	if NOT ($CameraCuts_ForceChangeTime = 0.0)
		if ($CameraCuts_ForceChangeTime < (<time> - $CameraCuts_LastCameraStartTime))
			change \{CameraCuts_ForceChangeTime = 0.0}
			break
		endif
	endif
	if GotParam \{nowait}
		return \{FALSE}
	endif
	wait \{1 gameframe}
	repeat
	return \{TRUE}
endscript

script CameraCuts_StaticCamControl 
	CameraCuts_CalcTime
	ccam_domorph {
		<camparams>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_HandCam \{name = None}
	CameraCuts_CalcTime
	ccam_domorph <...>
	zooming = FALSE
	if GotParam \{type}
		if (<type> = longshot)
			getrandomvalue \{name = random_value integer a = 0 b = 100}
			if (<random_value> < 25)
				ccam_domorph <...> FOV = 62 time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 95)
				ccam_domorph <...> FOV = 78 time = <camera_time>
				zooming = TRUE
			endif
		endif
		if (<type> = mid)
			getrandomvalue \{name = random_value integer a = 0 b = 100}
			if (<random_value> < 5)
				ccam_domorph <...> FOV = 64 time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 85)
				ccam_domorph <...> FOV = 82 time = <camera_time>
				zooming = TRUE
			endif
		endif
	endif
	if (<zooming> = TRUE)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_TwoCam 
	if GotParam \{UseHandCam}
		CameraCuts_SetHandCamParams \{amplitudeposition = 0.05 amplituderotation = -0.08}
	endif
	CameraCuts_CalcTime
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Encore 
	CameraCuts_CalcTime
	ccam_domorph {
		<cam1>
	}
	wait \{3 seconds}
	ccam_domorph {
		<cam2>
	}
	wait \{2.5 seconds}
	ccam_domorph {
		<Cam3>
	}
	wait \{3 seconds}
	ccam_domorph {
		<Cam4>
	}
	wait \{2 seconds}
	ccam_domorph {
		<Cam5>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Orbit 
	CameraCuts_CalcTime
	ccam_domorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		ccam_orbit axis = (0.0, 1.0, 0.0) Speed = (<orbitangle> / <camera_time>)
	endif
	CameraCuts_SetHandCamDriftOnly
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_OrbitAndMorphTwoCam 
	CameraCuts_CalcTime
	if (<camera_time> > 0)
		<orbitangle> = (3.1409998 * <orbitangle> / 180.0)
		<orbitparams> = {axis = (0.0, 1.0, 0.0) Speed = (<orbitangle> / <camera_time>)}
	endif
	ccam_domorph {
		<cam1>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit1}
			ccam_orbit \{Off}
		else
			ccam_orbit <orbitparams>
		endif
	endif
	CameraCuts_SetHandCamDriftOnly
	ccam_domorph {
		<cam2>
		time = <camera_time>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit2}
			ccam_orbit \{Off}
		else
			ccam_orbit <orbitparams>
		endif
	endif
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SplineMorph 
	CameraCuts_CalcTime
	ccam_splinemorph {
		<...>
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SpecialStepMove 
	ccam_setsmoothing \{type = all on = 1 slow_lerp_factor = 0.7 fast_lerp_factor = 0.7 lerp_dropoff = 2.0}
	CameraCuts_CalcTime
	ccam_domorph {
		<cam1>
	}
	CameraCuts_SetHandCamParams \{amplitudeposition = 0.0 amplituderotation = -0.8}
	origpos = (<cam1>.Pos)
	diry = <StepDir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <stepTime>)
	num_jumps = <StepNum>
	dirx = ((<cam2>.Pos) - (<cam1>.Pos))
	printf "timestep %i" i = <timestep>
	jump_multiplier = (<num_jumps> * 360.0)
	count = (<count> + <step>)
	begin
	if (<count> >= 1.0)
		break
	endif
	sin (<count> * <jump_multiplier>)
	Pos = (<origpos> + <dirx> * <count> + <diry> * <sin>)
	ccam_domorph {
		<...>
		time = <timestep>
		motion = linear
	}
	ccam_waitmorph
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> nowait
		return
	endif
	count = (<count> + <step>)
	repeat
	ccam_domorph {
		<cam2>
		time = <FinalRotTime>
		motion = smooth
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ApplyDOF \{DOF = $DOF_Medium02_tod_manager time = 0.0}
	dofType = <DOF>
	dofParam = (<dofType>.screen_FX [0])
	if NOT ScreenFX_FXInstanceExists \{viewport = bg_viewport name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = venue_DOF
			<dofParam>
			time = <time>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = venue_DOF
			<dofParam>
			time = <time>
		}
	endif
endscript

script CameraCuts_SetHandCamDriftOnly 
	ccam_enablehandcam \{shakeenabled = FALSE driftenabled = TRUE}
	driftslerpmap = [
		(0.1, 0.3)
		(0.2, 0.3)
	]
	if GotParam \{DriftZoneAngles}
		SetArrayElement arrayName = driftslerpmap index = 1 newValue = <DriftZoneAngles>
	endif
	ccam_sethandcamparams {
		$cinematic_camera_default_handcam_params
		driftslerpmap = <driftslerpmap>
	}
endscript

script CameraCuts_SetHandCamParams \{amplitudeposition = 0.01 amplituderotation = -0.01}
	ccam_enablehandcam \{shakeenabled = TRUE driftenabled = TRUE}
	ccam_sethandcamparams {
		motionx = {
			amplitude = 0.033999998
			center = 0.0
			periodbase = 0.012999999
			periodmultiples = [
				1 , 3 , 4
			]
		}
		motiony = {
			amplitude = 0.04
			center = 0.0
			periodbase = 0.016999999
			periodmultiples = [
				1 , 3 , 4
			]
		}
		amplitudeposition = {
			amplitude = <amplitudeposition>
			center = 0.0
			periodbase = 0.0023
			periodmultiples = [
				1 , 16
			]
		}
		amplituderotation = {
			amplitude = <amplituderotation>
			center = 0.0
			periodbase = 0.0023
			periodmultiples = [
				1
			]
		}
		zoomstabilitymap = [
			(1.3, 0.7)
			(30.0, 100.0)
		]
		driftslerpmap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
		zoomdriftmap = [
			(1.2, 0.6)
			(30.0, 100.0)
		]
		driftallowedamplitude = {
			amplitude = 0.4
			center = 1.0
			periodbase = 0.02
			periodmultiples = [
				1
			]
		}
	}
endscript

script CameraCuts_HandCamZoom2 
	ccam_domorph <...>
	zooming = FALSE
	if (<zooming> = TRUE)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	wait \{2 seconds}
	ccam_domorph <...> FOV = 50 time = 0.6 motion = smooth
	ccam_waitmorph
	wait \{0.1 seconds}
	ccam_domorph <...> FOV = 53 time = 0.25 motion = smooth
	ccam_waitmorph
	wait \{0.03 seconds}
	ccam_domorph <...> FOV = 51 time = 0.3 motion = smooth
	ccam_waitmorph
	ccam_domorph <...> FOV = 51
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_QuickZoom 
	ccam_domorph <...>
	zooming = FALSE
	if (<zooming> = TRUE)
		amplitudeposition = 0.01
		amplituderotation = -0.01
	else
		amplitudeposition = 0.05
		amplituderotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	wait \{2 seconds}
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = 0.75
		motion = smooth
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
	}
	ccam_waitmorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Pan 
	CameraCuts_SetHandCamParams \{amplitudeposition = 0.05 amplituderotation = -0.08}
	ccam_domorph {
		<cam1>
		time = 0
	}
	wait \{2 seconds}
	ccam_domorph {
		<cam2>
		time = 1
		motion = smooth
	}
	ccam_waitmorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ThreePos 
	CameraCuts_CalcTime
	ccam_splinemorph {
		keyframes =
		[
			{
				<cam1>
			}
			{
				<cam2>
			}
			{
				<Cam3>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_FourPos 
	CameraCuts_CalcTime
	ccam_splinemorph {
		keyframes =
		[
			{
				<cam1>
			}
			{
				<cam2>
			}
			{
				<Cam3>
			}
			{
				<Cam4>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript
Default_Cameras_Good = [
	{
		name = good_from_stage
		Play_hold = 1
		LockTo = guitarist
		Pos = (1.5175159, 4.1361775, -4.089658)
		Quat = (0.130047, -0.018706, 0.0024160002)
		FOV = 72.0
	}
	{
		name = good_center_stage
		Play_hold = 1
		LockTo = guitarist
		Pos = (2.102435, 1.999219, 7.695495)
		Quat = (-2.6E-05, 0.9999869, -0.0043200003)
		FOV = 72.0
	}
	{
		name = good_stage_left
		Play_hold = 1
		LockTo = guitarist
		Pos = (8.62121, 4.4717703, 6.8967915)
		Quat = (0.093209006, -0.903863, 0.254238)
		FOV = 72.0
	}
	{
		name = good_stage_right
		Play_hold = 1
		LockTo = guitarist
		Pos = (-7.182758, 2.553803, 8.634896)
		Quat = (0.048714, 0.90134895, -0.105318)
		FOV = 72.0
	}
]
Default_Cameras_Normal = [
	{
		name = normal_crowd_center
		Play_hold = 1
		LockTo = guitarist
		Pos = (5.108431, 1.485993, 13.082112)
		Quat = (0.0025400002, -0.9918739, 0.019756)
		FOV = 72.0
	}
	{
		name = normal_crowd_right
		Play_hold = 1
		LockTo = guitarist
		Pos = (10.656881, 1.486412, 12.041036)
		Quat = (0.00589, -0.95563596, 0.019026998)
		FOV = 72.0
	}
	{
		name = normal_crowd_left
		Play_hold = 1
		LockTo = guitarist
		Pos = (-4.8624063, 1.3204769, 14.310162)
		Quat = (0.001153, 0.98261094, -0.006309)
		FOV = 72.0
	}
]
Default_Cameras_Poor = [
	{
		name = poor_crowd_center
		Play_hold = 1
		LockTo = guitarist
		Pos = (-1.573781, 1.4759071, 20.610792)
		Quat = (-0.00064900005, 0.998182, 0.010279999)
		FOV = 72.0
	}
	{
		name = poor_crowd_right
		Play_hold = 1
		LockTo = guitarist
		Pos = (10.420851, 1.5101589, 18.768383)
		Quat = (-0.0024040001, -0.97147197, -0.010015999)
		FOV = 72.0
	}
	{
		name = poor_crowd_left
		Play_hold = 1
		LockTo = guitarist
		Pos = (-9.160233, 1.604391, 20.10081)
		Quat = (-0.0018660001, 0.984061, 0.010129999)
		FOV = 72.0
	}
]
default_cameras_intro = [
	{
		name = crowd_center_zoom
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (0.35540104, 1.766598, 9.495748)
				Quat = (0.00019699999, -0.999465, 0.032123)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (0.30482104, 3.097976, 5.3770776)
				Quat = (0.0012020001, -0.98061997, 0.195825)
				FOV = 72.0
			}
		}
	}
]
default_cameras_fastintro = [
	{
		name = crowd_center_zoom
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (0.30482104, 3.097976, 5.3770776)
				Quat = (0.0012020001, -0.98061997, 0.195825)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (0.35540104, 1.766598, 9.495748)
				Quat = (0.00019699999, -0.999465, 0.032123)
				FOV = 72.0
			}
		}
	}
]
default_cameras_dolly = [
	{
		name = Dolly_StageFront
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
	{
		name = Dolly_StageRear
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_fast = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_slow = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_zoom_out = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_pan = [
	{
		ControlScript = CameraCuts_Pan
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.467382, 1.2211041, 2.731025)
				Quat = (0.027345998, 0.774946, -0.033513)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (5.1025147, 1.024014, 1.060797)
				Quat = (-0.021949, -0.780419, -0.026007999)
				FOV = 72.0
			}
		}
	}
]
default_cameras_preencore = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-2.4889898, 2.2800958, 9.589442)
				Quat = (0.033784002, 0.965961, -0.164262)
				FOV = 72.0
				lookat = drummer
				lookatbone = Bone_Chest
				screenoffset = (-0.225398, -0.579956)
			}
			cam2 = {
				LockTo = drummer
				Pos = (4.951395, 2.2763019, 9.435161)
				Quat = (0.050596002, -0.9369719, 0.15382701)
				FOV = 72.0
				lookat = drummer
				lookatbone = Bone_Chest
				screenoffset = (0.26263002, -0.568209)
			}
		}
	}
]
default_cameras_encore = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.8748507, 2.11633, 3.001765)
				Quat = (0.055925, 0.88826996, -0.112448)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (6.485794, 2.790986, 6.2345123)
				Quat = (0.081708, -0.7229049, 0.08677899)
				FOV = 72.0
			}
		}
	}
]
default_cameras_preboss = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-2.4889898, 2.2800958, 9.589442)
				Quat = (0.033784002, 0.965961, -0.164262)
				FOV = 72.0
				lookat = drummer
				lookatbone = Bone_Chest
				screenoffset = (-0.225398, -0.579956)
			}
			cam2 = {
				LockTo = drummer
				Pos = (4.951395, 2.2763019, 9.435161)
				Quat = (0.050596002, -0.9369719, 0.15382701)
				FOV = 72.0
				lookat = drummer
				lookatbone = Bone_Chest
				screenoffset = (0.26263002, -0.568209)
			}
		}
	}
]
default_cameras_boss = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-2.8748507, 2.11633, 3.001765)
				Quat = (0.055925, 0.88826996, -0.112448)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (6.485794, 2.790986, 6.2345123)
				Quat = (0.081708, -0.7229049, 0.08677899)
				FOV = 72.0
			}
		}
	}
]
default_cameras_guitar_closeup = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			LockTo = world
			lookat = guitarist
			lookatbone = Bone_Guitar_Body
			Pos = (-0.073745, 0.7753869, 0.023635)
			Quat = (0.047147997, -0.9942729, -0.005626)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_drummer = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Drummer_Center
			LockTo = world
			Pos = (-3.3800898, 1.184646, -5.141132)
			Quat = (0.00305, -0.97887796, 0.013742999)
			FOV = 85.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_singer = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Singer_Left
			LockTo = world
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Singer_Center
			LockTo = world
			Pos = (-4.3443885, 0.950269, -0.84059906)
			Quat = (1.9E-05, 0.99112797, -0.001512)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Singer_Right
			LockTo = world
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_singer_closeup = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = singer_closeup
			LockTo = world
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_bassist = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Bassist_Center
			LockTo = world
			Pos = (-3.3800898, 1.184646, -5.141132)
			Quat = (0.00305, -0.97887796, 0.013742999)
			FOV = 85.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_solo = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Guitar_Neck_Normal
			type = normal
			LockTo = guitarist
			locktobone = BONE_GUITAR_NECK
			Pos = (0.742165, 0.095542006, 0.027762)
			Quat = (-0.31134596, -0.632061, 0.42270902)
			FOV = 57.0
		}
		DOF = $DOF_CloseUp03_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Guitar_Body_Normal
			type = normal
			LockTo = guitarist
			locktobone = BONE_GUITAR_NECK
			Pos = (-0.52196294, 0.206606, 0.228494)
			Quat = (0.066760994, 0.80269796, -0.260841)
			FOV = 76.0
		}
		DOF = $DOF_CloseUp03_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Guitar_Neck_Demonik
			type = demonik
			LockTo = guitarist
			locktobone = Bone_Guitar_Body
			Pos = (1.305142, 0.289514, 0.028687)
			Quat = (-0.260674, -0.64566904, 0.48475105)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp03_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Guitar_Body_Demonik
			type = demonik
			LockTo = guitarist
			locktobone = Bone_Guitar_Body
			Pos = (-0.35794002, 0.470057, 0.060370997)
			Quat = (-0.086646, 0.686242, -0.476262)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp03_tod_manager
		CrowdOff
	}
]
default_cameras_orbit = [
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = orbit_stage
			LockTo = guitarist
			Pos = (0.61307204, 0.85457504, -1.556369)
			Quat = (-0.055081, -0.325498, -0.019047)
			FOV = 72.0
			orbitangle = 80
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = orbit_closeup
			LockTo = guitarist
			Pos = (-0.623458, 1.762923, 1.452922)
			Quat = (0.058131002, 0.9316849, -0.172848)
			FOV = 72.0
			orbitangle = 40
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = orbit_mid
			LockTo = guitarist
			Pos = (1.8531569, 1.402983, 2.3796542)
			Quat = (0.047396, -0.89235497, 0.096345)
			FOV = 72.0
			orbitangle = 70
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = orbit_drummer
			LockTo = drummer
			Pos = (-1.155043, 2.428414, 3.3713057)
			Quat = (0.039694, 0.95921797, -0.21765)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = orbit_singer
			LockTo = vocalist
			Pos = (-1.155043, 2.428414, 3.3713057)
			Quat = (0.039694, 0.95921797, -0.21765)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_starpower = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Star_Power
			LockTo = world
			Pos = (0.622013, 0.681226, 1.318936)
			Quat = (-0.016913, -0.92676395, -0.041992996)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_boss_finish = [
	{
		name = boss_devil_finish
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (0.962169, 0.53960097, 3.2702482)
				Quat = (-0.023288, 0.977894, 0.18821001)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (0.87311107, 1.4404389, 2.421501)
				Quat = (-0.06923701, 0.920361, 0.168251)
				FOV = 72.0
			}
		}
	}
]
default_cameras_boss_dead = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			LockTo = world
			Pos = (3.557984, 1.241251, 3.824588)
			Quat = (-0.024045, -0.90200096, 0.010152999)
			FOV = 72.0
		}
	}
]
default_cameras_walk = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Walk01
			LockTo = world
			Pos = (0.373905, 0.631563, 4.8783784)
			Quat = (-0.016905999, 0.9827779, 0.14206801)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_stagedive = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = StageDive
			LockTo = world
			Pos = (0.373905, 0.631563, 4.8783784)
			Quat = (-0.016905999, 0.9827779, 0.14206801)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_win = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = win
			LockTo = world
			Pos = (0.622013, 0.681226, 1.318936)
			Quat = (-0.016913, -0.92676395, -0.041992996)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_lose = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = lose
			LockTo = world
			Pos = (-0.97144395, 0.90905, 0.850675)
			Quat = (-0.00064100005, -0.99934596, -0.02286)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
default_cameras_vert_drummer = [
	{
		name = VertDrummer01
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			cam2 = {
				LockTo = world
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_vert_guitarist = [
	{
		name = VertGuitarist01
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			cam2 = {
				LockTo = world
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_vert_stagerear = [
	{
		name = VertStageRear
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			cam2 = {
				LockTo = world
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_vert_stagefront = [
	{
		name = VertStageFront
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (3.039751, 1.553329, 2.9490602)
				Quat = (0.024109, -0.89691794, 0.049145)
				FOV = 71.0
			}
			cam2 = {
				LockTo = world
				Pos = (-7.7150383, 1.4195828, 2.9341018)
				Quat = (0.00736, 0.93007594, -0.018824998)
				FOV = 71.0
			}
		}
	}
]
default_cameras_special = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = special01
			LockTo = world
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = special02
			LockTo = world
			Pos = (-4.3443885, 0.950269, -0.84059906)
			Quat = (1.9E-05, 0.99112797, -0.001512)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = special03
			LockTo = world
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = special04
			LockTo = world
			Pos = (-1.543603, 0.87668294, -1.361017)
			Quat = (-0.008355001, -0.953027, -0.027003)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_boss_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Boss_CloseUp
			LockTo = world
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_player_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Player_CloseUp
			LockTo = world
			Pos = (-6.321385, 0.924312, -2.6622968)
			Quat = (-0.026229998, 0.784364, 0.032947995)
			FOV = 72.0
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
