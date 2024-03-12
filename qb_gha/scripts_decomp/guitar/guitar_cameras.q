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
		midinote = 0
		scr = CameraCuts_EnableChangeCam
		params = {
			enable = TRUE
		}
	}
	{
		midinote = 1
		scr = CameraCuts_EnableChangeCam
		params = {
			enable = FALSE
		}
	}
	{
		midinote = 3
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_Vert_Down
		}
	}
	{
		midinote = 4
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_Vert_Up
		}
	}
	{
		midinote = 5
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_Orbit_CCW
		}
	}
	{
		midinote = 6
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_Orbit_CW
		}
	}
	{
		midinote = 7
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_CloseUp
		}
	}
	{
		midinote = 8
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_rhythm'
			changenow
			type = RHYTHM_Medium
		}
	}
	{
		midinote = 10
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = BASSIST_Vert_Down
		}
	}
	{
		midinote = 11
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = BASSIST_Vert_Up
		}
	}
	{
		midinote = 12
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = BASSIST_Orbit_CCW
		}
	}
	{
		midinote = 13
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = BASSIST_Orbit_CW
		}
	}
	{
		midinote = 14
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = bassist_closeup
		}
	}
	{
		midinote = 15
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_bassist'
			changenow
			type = BASSIST_Medium
		}
	}
	{
		midinote = 17
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = DRUMMER_Vert_Down
		}
	}
	{
		midinote = 18
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = DRUMMER_Vert_Up
		}
	}
	{
		midinote = 19
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = DRUMMER_Orbit_CCW
		}
	}
	{
		midinote = 20
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = DRUMMER_Orbit_CW
		}
	}
	{
		midinote = 21
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = drummer_closeup
		}
	}
	{
		midinote = 22
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_drummer'
			changenow
			type = DRUMMER_Medium
		}
	}
	{
		midinote = 24
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = SINGER_Vert_Down
		}
	}
	{
		midinote = 25
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = SINGER_Vert_Up
		}
	}
	{
		midinote = 26
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = SINGER_Orbit_CCW
		}
	}
	{
		midinote = 27
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = SINGER_Orbit_CW
		}
	}
	{
		midinote = 28
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = singer_closeup
		}
	}
	{
		midinote = 29
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			type = SINGER_Medium
		}
	}
	{
		midinote = 31
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = GUITARIST_Vert_Down
		}
	}
	{
		midinote = 32
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = GUITARIST_Vert_Up
		}
	}
	{
		midinote = 33
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = GUITARIST_Orbit_CCW
		}
	}
	{
		midinote = 34
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = GUITARIST_Orbit_CW
		}
	}
	{
		midinote = 35
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = guitarist_closeup
		}
	}
	{
		midinote = 36
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitarist'
			changenow
			type = GUITARIST_Medium
		}
	}
	{
		midinote = 38
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = guitar_closeup
		}
	}
	{
		midinote = 39
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = GUITAR_Solo_Neck
		}
	}
	{
		midinote = 40
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_guitar'
			changenow
			type = GUITAR_Solo_Body
		}
	}
	{
		midinote = 42
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_Vert_Down
		}
	}
	{
		midinote = 43
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_Vert_Up
		}
	}
	{
		midinote = 44
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_Orbit_CCW
		}
	}
	{
		midinote = 45
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_Orbit_CW
		}
	}
	{
		midinote = 46
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_Low
		}
	}
	{
		midinote = 47
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stage'
			changenow
			type = STAGE_High
		}
	}
	{
		midinote = 49
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_Vert_Down
		}
	}
	{
		midinote = 50
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_Vert_Up
		}
	}
	{
		midinote = 51
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_Orbit_CCW
		}
	}
	{
		midinote = 52
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_Orbit_CW
		}
	}
	{
		midinote = 53
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_Low
		}
	}
	{
		midinote = 54
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mid'
			changenow
			type = MID_High
		}
	}
	{
		midinote = 56
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_longshot'
			changenow
			type = LONGSHOT_Low
		}
	}
	{
		midinote = 57
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_longshot'
			changenow
			type = LONGSHOT_High
		}
	}
	{
		midinote = 59
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_In_Fast
		}
	}
	{
		midinote = 60
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_In_Slow
		}
	}
	{
		midinote = 61
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_Out_Fast
		}
	}
	{
		midinote = 62
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_zoom'
			changenow
			type = ZOOM_Out_Slow
		}
	}
	{
		midinote = 64
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_pan'
			changenow
			type = PAN_Singer_Guitarist
		}
	}
	{
		midinote = 65
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_pan'
			changenow
			type = PAN_Guitarist_Singer
		}
	}
	{
		midinote = 67
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = DOLLY_Front_R
		}
	}
	{
		midinote = 68
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = DOLLY_Front_L
		}
	}
	{
		midinote = 69
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = DOLLY_Rear_R
		}
	}
	{
		midinote = 70
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_dolly'
			changenow
			type = DOLLY_Rear_L
		}
	}
	{
		midinote = 72
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = SPECIAL_A
		}
	}
	{
		midinote = 73
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = SPECIAL_B
		}
	}
	{
		midinote = 74
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = SPECIAL_C
		}
	}
	{
		midinote = 75
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_special'
			changenow
			type = SPECIAL_D
		}
	}
	{
		midinote = 77
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = MOCAP01
		}
	}
	{
		midinote = 78
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = MOCAP02
		}
	}
	{
		midinote = 79
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = MOCAP03
		}
	}
	{
		midinote = 80
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_mocap'
			changenow
			name = MOCAP04
		}
	}
	{
		midinote = 82
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_audience'
			changenow
			type = audience
		}
	}
	{
		midinote = 84
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_boss_battle'
			changenow
			type = Player_CloseUp
		}
	}
	{
		midinote = 85
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_boss_battle'
			changenow
			type = Boss_CloseUp
		}
	}
	{
		midinote = 87
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = SINGER_CloseUp01
		}
	}
	{
		midinote = 88
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = SINGER_CloseUp02
		}
	}
	{
		midinote = 89
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_singer'
			changenow
			name = SINGER_CloseUp03
		}
	}
	{
		midinote = 91
		scr = CameraCuts_SetArrayPrefix
		params = {
			prefix = 'cameras_stagediver'
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
	change \{allow_4x_effect = TRUE}
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

script set_defaultcameracut_perf_debug \{perf = 'good' perf_checksum = good}
	GetPakManCurrentName \{map = zones}
	if ($current_num_players = 2)
		FormatText checksumname = Cameras_Array '%s_%p_%c_2p' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
		if globalexists name = <Cameras_Array> type = array
			FormatText textname = Cameras_Array2 '%s_%p_%c_2p' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
			printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
			return
		endif
		FormatText checksumname = Cameras_Array '%s_%p_2p' p = $CameraCuts_ArrayPrefix s = <pakname>
		if globalexists name = <Cameras_Array> type = array
			FormatText textname = Cameras_Array2 '%s_%p_2p' p = $CameraCuts_ArrayPrefix s = <pakname>
			printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
			return
		endif
	endif
	FormatText checksumname = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
	if globalexists name = <Cameras_Array> type = array
		FormatText checksumname = Cameras_Array2 '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = <pakname>
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
		return
	endif
	FormatText checksumname = Cameras_Array '%s_%p' p = $CameraCuts_ArrayPrefix s = <pakname>
	if globalexists name = <Cameras_Array> type = array
		FormatText textname = Cameras_Array2 '%s_%p' p = $CameraCuts_ArrayPrefix s = <pakname>
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
		return
	endif
	FormatText checksumname = Cameras_Array '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = 'default'
	if globalexists name = <Cameras_Array> type = array
		FormatText textname = Cameras_Array2 '%s_%p_%c' p = $CameraCuts_ArrayPrefix c = <perf> s = 'default'
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
		return
	endif
	FormatText \{checksumname = Cameras_Array '%s_%p' p = $CameraCuts_ArrayPrefix s = 'default'}
	if globalexists name = <Cameras_Array> type = array
		FormatText \{textname = Cameras_Array2 '%s_%p' p = $CameraCuts_ArrayPrefix s = 'default'}
		printf "set_defaultcameracut_perf_debug %t %i" t = <perf_checksum> i = <Cameras_Array2>
		return
	endif
	printstruct <...> prefix = ($CameraCuts_ArrayPrefix)
	scriptassert \{"CameraCut Array not found"}
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
			if NOT ($debug_camera_array = None)
				camera_time = 5.0
			else
				camera_time = RandomRange (3.0, 8.0)
				getsongtimems
				endtime = (<time> + <camera_time> * 1000)
				CameraCuts_GetNextDownbeat endtime = <endtime>
				camera_time = ((<endtime> - <time>) / 1000.0)
			endif
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
	if ($gWinportCameraLocked = 0)
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
allow_4x_effect = TRUE

script CameraCuts_HandCam \{name = None}
	CameraCuts_CalcTime
	change \{allow_4x_effect = TRUE}
	if GotParam \{locktobone}
		if (<locktobone> = BONE_GUITAR_NECK)
			hide_fourx_effect
			change \{allow_4x_effect = FALSE}
		endif
	endif
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
		amplitudeposition = 0.24000001
		amplituderotation = -0.38400003
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
	if GotParam \{locktobone}
		if (<locktobone> = BONE_GUITAR_NECK)
			show_fourx_effect
			change \{allow_4x_effect = TRUE}
		endif
	endif
endscript

script CameraCuts_HandCamSmooth \{name = None}
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
		CameraCuts_SetHandCamParams \{amplitudeposition = 0.24000001 amplituderotation = -0.38400003}
	endif
	if GotParam \{UseHandCamSmooth}
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

script CameraCuts_FastIntroHold 
	CameraCuts_SetHandCamParams \{amplitudeposition = 0.05 amplituderotation = -0.08}
	ccam_domorph {
		<cam1>
	}
	ccam_waitmorph
	ccam_domorph {
		<cam2>
		time = 1.5
		motion = smooth
	}
	ccam_waitmorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script default_camera_aerosmith_entrance 
	ccam_domorph \{LockTo = world Pos = (0.67134696, 1.0173221, 8.3327055) Quat = (-0.011763, -0.9972829, -0.071651004) FOV = 82.0}
	ccam_waitmorph
	ccam_domorph \{LockTo = world Pos = (0.71067595, 1.138438, 9.816325) Quat = (-0.011763, -0.9972829, -0.071651004) FOV = 82.0 time = 4}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (2.9936182, 1.3600678, 2.0988438) Quat = (0.096046, -0.85081804, -0.083159) FOV = 28.0}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (2.9936182, 1.3600678, 2.0988438) Quat = (0.096046, -0.85081804, -0.083159) FOV = 28.0 time = 1.5}
	ccam_waitmorph
	ccam_domorph \{LockTo = drummer Pos = (0.156794, 1.697572, 1.8627019) Quat = (0.002087, 0.98201394, -0.18847503) FOV = 72.0}
	ccam_waitmorph
	ccam_domorph \{LockTo = drummer Pos = (0.156794, 1.697572, 1.8627019) Quat = (0.002087, 0.98201394, -0.18847503) FOV = 72.0 time = 1.5}
	ccam_waitmorph
	ccam_domorph \{LockTo = guitarist Pos = (0.369664, 0.93793094, 1.2052851) Quat = (0.116242, -0.97601897, -0.173646) FOV = 63.0 lookat = guitarist lookatbone = Bone_Chest screenoffset = (-0.35383105, 0.278159)}
	ccam_waitmorph
	ccam_domorph \{LockTo = guitarist Pos = (0.369664, 0.93793094, 1.2052851) Quat = (0.116242, -0.97601897, -0.173646) FOV = 63.0 lookat = guitarist lookatbone = Bone_Chest screenoffset = (-0.35383105, 0.278159) time = 2}
	ccam_waitmorph
	ccam_domorph \{LockTo = vocalist Pos = (-0.013245, 1.287552, 2.5607681) Quat = (0.100522, 0.994561, 0.019) FOV = 48.0 lookat = vocalist lookatbone = Bone_Chest screenoffset = (0.255681, 0.201958)}
	ccam_waitmorph
	ccam_domorph \{LockTo = vocalist Pos = (-0.013245, 1.287552, 2.5607681) Quat = (0.100522, 0.994561, 0.019) FOV = 48.0 lookat = vocalist lookatbone = Bone_Chest screenoffset = (0.255681, 0.201958) time = 2}
	ccam_waitmorph
	ccam_domorph \{LockTo = world Pos = (0.71067595, 1.138438, 9.816325) Quat = (-0.011763, -0.9972829, -0.071651004) FOV = 82.0}
	ccam_waitmorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script default_camera_boss 
	ccam_domorph \{LockTo = bassist Pos = (0.415953, 0.67239296, 0.951549) Quat = (0.060255, -0.9329389, 0.29930598) FOV = 72.0}
	CameraCuts_SetHandCamParams \{amplitudeposition = 0.2 amplituderotation = -0.32000002}
	ccam_waitmorph
	wait \{0.65000004 seconds}
	ccam_domorph \{LockTo = bassist Pos = (0.415953, 0.67239296, 0.951549) Quat = (0.060255, -0.9329389, 0.29930598) FOV = 72.0}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (0.49457502, 1.167327, 1.1275209) Quat = (-0.01335, -0.977757, -0.060676996) FOV = 72.0 time = 3}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (0.49457502, 1.167327, 1.1275209) Quat = (-0.01335, -0.977757, -0.060676996) FOV = 72.0}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (0.495756, 1.1663411, 1.12688) Quat = (-0.013029, -0.97811204, -0.058653) FOV = 80.0 time = 3}
	ccam_waitmorph
	ccam_domorph \{LockTo = bassist Pos = (0.495756, 1.1663411, 1.12688) Quat = (-0.013029, -0.97811204, -0.058653) FOV = 80.0}
	ccam_waitmorph
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
]
default_cameras = [
	{
		name = CLOSEUP_01
		type = CloseUp
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
Default_cameras_longshot = [
	{
		name = LONGSHOT_High01
		type = LONGSHOT_High
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.57198894, 3.954246, 25.20223)
				Quat = (-0.000391, -0.9862749, 0.165061)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.45701203, 3.954003, 25.201323)
				Quat = (-0.000391, -0.9862749, 0.165061)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = LONGSHOT_Low01
		type = LONGSHOT_Low
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-1.2919222, -0.24732801, 26.979486)
				Quat = (0.002151, 0.99731797, -0.07157)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-1.5034659, -0.24687901, 26.973026)
				Quat = (0.002151, 0.99731797, -0.07157)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_mid = [
	{
		name = MID_High01
		type = MID_High
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_High02
		type = MID_High
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Low01
		type = MID_Low
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.238645, 1.380729, 16.519836)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.395918, 1.381063, 16.516504)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = MID_Orbit_CCW01
			type = MID_Orbit_CCW
			LockTo = drummer
			Pos = (5.8004093, 2.342972, 15.428842)
			Quat = (0.030534998, -0.968155, 0.16403799)
			FOV = 72.0
			orbitangle = -50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = MID_Orbit_CW01
			type = MID_Orbit_CW
			LockTo = drummer
			Pos = (-3.629889, 2.363242, 15.843865)
			Quat = (0.01824, 0.9812179, -0.16114299)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Vert_Up01
		type = MID_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Vert_Down01
		type = MID_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_stage = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGE_High01
			type = STAGE_High
			LockTo = guitarist
			Pos = (-0.331379, 2.1398208, -2.9350684)
			Quat = (0.21009701, -0.053707, 0.011462)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.283846, -0.06725301)
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGE_Low01
			type = STAGE_Low
			LockTo = guitarist
			Pos = (-0.381286, 0.425256, -2.519796)
			Quat = (-0.10694, -0.058470998, -0.0063960003)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.365109, -0.27589303)
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = STAGE_Orbit_CCW01
			type = STAGE_Orbit_CCW
			LockTo = guitarist
			Pos = (-1.390305, 1.247357, -2.320251)
			Quat = (0.043256998, 0.222721, -0.009962)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = STAGE_Orbit_CW01
			type = STAGE_Orbit_CW
			LockTo = guitarist
			Pos = (1.1497709, 1.5669589, -2.5368068)
			Quat = (0.093412, -0.302062, 0.029615)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = STAGE_Vert_Up01
		type = STAGE_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = STAGE_Vert_Down01
		type = STAGE_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_guitar = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Solo_Body01
			type = GUITAR_Solo_Body
			LockTo = guitarist
			locktobone = Bone_Guitar_Body
			Pos = (-0.411937, 0.25536898, 0.113419)
			Quat = (0.035701, 0.765104, -0.314193)
			FOV = 69.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Solo_Neck01
			type = GUITAR_Solo_Neck
			LockTo = guitarist
			locktobone = BONE_GUITAR_NECK
			Pos = (0.6295221, 0.141155, 0.036870994)
			Quat = (-0.515311, -0.48547202, 0.643777)
			FOV = 59.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Closeup01
			type = guitar_closeup
			LockTo = guitarist
			Pos = (1.2061551, 1.830135, 2.4996212)
			Quat = (0.032743998, -0.969021, 0.16408199)
			FOV = 23.0
			lookat = guitarist
			lookatbone = Bone_Guitar_Body
			screenoffset = (-0.308609, -0.110810995)
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_guitarist = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_Medium01
			type = GUITARIST_Medium
			LockTo = guitarist
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.023573, -0.96751004, 0.103691004)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (0.338886, -0.30280703)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_CloseUp01
			type = guitarist_closeup
			LockTo = guitarist
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Head
			screenoffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CCW01
			type = GUITARIST_Orbit_CCW
			LockTo = guitarist
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.017220998, -0.98019695, 0.108353004)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CW01
			type = GUITARIST_Orbit_CW
			LockTo = guitarist
			Pos = (-1.046432, 1.384884, 1.9220159)
			Quat = (0.029545998, 0.958008, -0.102428995)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Up01
		type = GUITARIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Down01
		type = GUITARIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
default_cameras_singer = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = SINGER_Medium01
			type = SINGER_Medium
			LockTo = vocalist
			Pos = (0.76937497, 1.058248, 2.108929)
			Quat = (0.0024680002, -0.975066, 0.015652)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (0.38290703, -0.371808)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = SINGER_CloseUp01
			type = singer_closeup
			LockTo = vocalist
			Pos = (0.51758003, 1.618211, 0.616831)
			Quat = (0.012169001, -0.9712839, 0.055753)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Head
			screenoffset = (0.417869, -0.345862)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = SINGER_Orbit_CCW01
			type = SINGER_Orbit_CCW
			LockTo = vocalist
			Pos = (1.064897, 1.4607079, 1.941088)
			Quat = (0.02007, -0.96802, 0.087443)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = SINGER_Orbit_CW01
			type = SINGER_Orbit_CW
			LockTo = vocalist
			Pos = (-0.99324894, 1.5038509, 1.7319051)
			Quat = (0.032038998, 0.937449, -0.086307)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = SINGER_Vert_Up01
		type = SINGER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
			cam2 = {
				LockTo = vocalist
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = SINGER_Vert_Down01
		type = SINGER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
			cam2 = {
				LockTo = vocalist
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
default_cameras_drummer = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = DRUMMER_Medium01
			type = DRUMMER_Medium
			LockTo = drummer
			Pos = (0.222421, 1.513564, 2.327249)
			Quat = (0.013893999, -0.983884, 0.147923)
			FOV = 72.0
			lookat = drummer
			lookatbone = Bone_Chest
			screenoffset = (0.224311, -0.229782)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = DRUMMER_CloseUp01
			type = drummer_closeup
			LockTo = drummer
			Pos = (-0.20566, 1.3390739, 1.4644548)
			Quat = (0.012424001, 0.98862296, -0.102515)
			FOV = 72.0
			lookat = drummer
			lookatbone = Bone_Chest
			screenoffset = (-0.061589997, 0.036165)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = DRUMMER_Orbit_CCW01
			type = DRUMMER_Orbit_CCW
			LockTo = drummer
			Pos = (1.1982142, 2.287699, 2.516386)
			Quat = (0.071181, -0.927455, 0.27218598)
			FOV = 72.0
			lookat = drummer
			lookatbone = Bone_Chest
			screenoffset = (0.17088601, -0.39122102)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = DRUMMER_Orbit_CW01
			type = DRUMMER_Orbit_CW
			LockTo = drummer
			Pos = (-1.033128, 2.2700999, 2.4955552)
			Quat = (0.067911, 0.93188894, -0.276048)
			FOV = 72.0
			lookat = drummer
			lookatbone = Bone_Chest
			screenoffset = (-0.10158, -0.42090502)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = DRUMMER_Vert_Up01
		type = DRUMMER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.200713, 0.22366, 2.602559)
				Quat = (-0.019181, 0.97748697, 0.11121701)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.24826102, 1.752702, 2.738014)
				Quat = (0.038087, 0.9626029, -0.20308802)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = DRUMMER_Vert_Down01
		type = DRUMMER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.24826102, 1.752702, 2.738014)
				Quat = (0.038087, 0.9626029, -0.20308802)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.200713, 0.22366, 2.602559)
				Quat = (-0.019181, 0.97748697, 0.11121701)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
default_cameras_bassist = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = BASSIST_Medium01
			type = BASSIST_Medium
			LockTo = bassist
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = BASSIST_CloseUp01
			type = bassist_closeup
			LockTo = bassist
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = BASSIST_Orbit_CCW01
			type = BASSIST_Orbit_CCW
			LockTo = bassist
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = BASSIST_Orbit_CW01
			type = BASSIST_Orbit_CW
			LockTo = bassist
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = BASSIST_Vert_Up01
		type = BASSIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = BASSIST_Vert_Down01
		type = BASSIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
Default_cameras_rhythm = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = RHYTHM_Medium01
			type = RHYTHM_Medium
			LockTo = world
			Pos = (-2.303154, 0.764982, 4.8603663)
			Quat = (-0.012736999, 0.9809339, 0.112639)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.40689602, -0.21984601)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = RHYTHM_CloseUp01
			type = RHYTHM_CloseUp
			LockTo = world
			Pos = (-1.700512, 0.235937, 4.5619025)
			Quat = (-0.074879, -0.929315, -0.231359)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (0.39920303, -0.28451303)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = RHYTHM_Orbit_CCW01
			type = RHYTHM_Orbit_CCW
			LockTo = bassist
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = RHYTHM_Orbit_CW01
			type = RHYTHM_Orbit_CW
			LockTo = bassist
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = RHYTHM_Vert_Up01
		type = RHYTHM_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = RHYTHM_Vert_Down01
		type = RHYTHM_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
default_cameras_dolly = [
	{
		name = DOLLY_Rear_L01
		type = DOLLY_Rear_L
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Rear_R01
		type = DOLLY_Rear_R
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Front_L01
		type = DOLLY_Front_L
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Front_R01
		type = DOLLY_Front_R
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
default_cameras_pan = [
	{
		name = PAN_Guitarist_Singer01
		type = PAN_Guitarist_Singer
		ControlScript = CameraCuts_Pan
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (-0.42091504, 0.147356)
			}
			cam2 = {
				LockTo = vocalist
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				lookat = vocalist
				lookatbone = Bone_Chest
				screenoffset = (0.358489, -0.170862)
			}
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		name = PAN_Singer_Guitarist01
		type = PAN_Singer_Guitarist
		ControlScript = CameraCuts_Pan
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				lookat = vocalist
				lookatbone = Bone_Chest
				screenoffset = (0.358489, -0.170862)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (-0.42091504, 0.147356)
			}
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
default_cameras_zoom = [
	{
		name = ZOOM_Out_Slow01
		type = ZOOM_Out_Slow
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = ZOOM_Out_Fast01
		type = ZOOM_Out_Fast
		ControlScript = CameraCuts_QuickZoom
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium02_tod_manager
	}
	{
		name = ZOOM_In_Slow01
		type = ZOOM_In_Slow
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = ZOOM_In_Fast01
		type = ZOOM_In_Fast
		ControlScript = CameraCuts_QuickZoom
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium02_tod_manager
	}
]
default_cameras_special = [
	{
		name = special01
		type = SPECIAL_A
		ControlScript = CameraCuts_ThreePos
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (7.91994, 4.0722446, 15.780664)
				Quat = (0.043356, -0.954315, 0.156901)
				FOV = 52.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (4.605281, 1.9775009, 9.89547)
				Quat = (0.037202, -0.957874, 0.13346401)
				FOV = 52.0
			}
			Cam3 = {
				LockTo = guitarist
				Pos = (1.5902342, 1.2208471, 4.5518465)
				Quat = (0.016259, -0.9656329, 0.053746)
				FOV = 52.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = special02
			type = SPECIAL_B
			orbitangle = 90
			cam1 = {
				LockTo = guitarist
				Pos = (-3.7134671, 1.561098, 5.2489767)
				Quat = (0.022261, 0.94396603, -0.111006)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-1.6345519, 0.98434895, 2.433505)
				Quat = (-0.013397, 0.950469, -0.0021470003)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = special03
			type = SPECIAL_C
			orbitangle = -40
			cam1 = {
				LockTo = guitarist
				Pos = (2.1238008, 3.287695, 5.0177402)
				Quat = (0.076614, -0.92003894, 0.22002399)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.615803, 1.9095379, 2.403839)
				Quat = (0.043414995, -0.957317, 0.186884)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_SpecialStepMove
		params = {
			name = special04
			type = SPECIAL_D
			cam1 = {
				LockTo = guitarist
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			stepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Off_tod_manager
		}
	}
]
Default_cameras_mocap = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP01
			type = MOCAP
			LockTo = guitarist
			Pos = (-0.24607702, 3.316178, 0.92423993)
			Quat = (0.021933999, 0.868847, -0.49323303)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP02
			type = MOCAP
			LockTo = vocalist
			Pos = (0.0024010001, 3.3782017, 1.199096)
			Quat = (0.009012999, 0.84305805, -0.53760797)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP03
			type = MOCAP
			LockTo = bassist
			Pos = (-0.0057200002, 3.355163, 2.1156142)
			Quat = (0.008965001, 0.8438061, -0.53643596)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP04
			type = MOCAP
			LockTo = drummer
			Pos = (0.107346, 3.4477382, 1.783761)
			Quat = (0.008895, 0.84684604, -0.53162295)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
default_cameras_stagedive = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGEDIVER01
			type = stagediver
			LockTo = world
			Pos = (0.161384, -0.255694, 7.6203847)
			Quat = (-0.019520998, 0.9806339, 0.12749502)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_audience = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = AUDIENCE01
			type = audience
			LockTo = guitarist
			Pos = (-2.8780198, 1.042694, -0.18393801)
			Quat = (0.074025996, 0.014415, -0.0029910002)
			FOV = 52.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
default_cameras_starpower = [
	{
		name = starpower
		type = starpower
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (2.58572, 1.1694639, 6.018505)
				Quat = (-0.001818, -0.97748, 0.008785)
				FOV = 72.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.33652902, -0.198419)
			}
			cam2 = {
				LockTo = world
				Pos = (2.126417, 1.151183, 5.003499)
				Quat = (-0.003998, -0.97537994, -0.0012250001)
				FOV = 104.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.43471202, -0.20290701)
			}
			DOF = $DOF_CloseUp02_tod_manager
			CrowdOff
		}
	}
]
default_cameras_intro = [
	{
		name = intro
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
default_cameras_fastintro = [
	{
		name = fastintro
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_preboss = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_boss = [
	{
		ControlScript = default_camera_boss
		DOF = $DOF_Medium02_tod_manager
	}
]
default_cameras_preencore = [
	{
		name = preencore
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_preaerosmith = [
	{
		name = PREAEROSMITH
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
default_cameras_encore = [
	{
		name = encore
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_aerosmith_entrance = [
	{
		ControlScript = default_camera_aerosmith_entrance
		DOF = $DOF_Medium02_tod_manager
	}
]
default_cameras_walk = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Walk01
			type = walk
			LockTo = world
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_win = [
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = win
			orbitangle = 10
			cam1 = {
				LockTo = guitarist
				Pos = (0.206255, 0.082557, 3.0024462)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.96568394, -0.40605003, 4.6806836)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium02_tod_manager
		CrowdOff
	}
]
default_cameras_lose = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			name = lose
			cam1 = {
				LockTo = world
				Pos = (-1.7738701, 2.2631419, 2.070564)
				Quat = (0.19757299, 0.477018, -0.111905)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-4.2446136, 4.020077, 0.17742501)
				Quat = (0.214849, 0.45659703, -0.11555701)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_stagediver = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGEDIVER01
			type = stagediver
			LockTo = world
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
default_cameras_boss_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Boss_CloseUp_Center
			type = Boss_CloseUp
			LockTo = world
			Pos = (1.9525208, 1.3101209, 5.1531973)
			Quat = (0.000106, 0.9994329, -0.033504)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.18728602, -0.056658)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
]
default_cameras_player_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Player_CloseUp_Center
			type = Player_CloseUp
			LockTo = world
			Pos = (-1.4694958, 1.3221949, 5.2663136)
			Quat = (0.000139, 0.99899393, -0.044736)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (0.132887, 0.027633999)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
]
Default_cameras_2p = [
	{
		name = CLOSEUP_01
		type = CloseUp
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
	}
]
Default_cameras_mid_2p = [
	{
		name = MID_High01
		type = MID_High
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Low01
		type = MID_Low
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (-0.238645, 1.380729, 16.519836)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (-0.395918, 1.381063, 16.516504)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = MID_Orbit_CCW01
			type = MID_Orbit_CCW
			LockTo = drummer
			Pos = (5.8004093, 2.342972, 15.428842)
			Quat = (0.030534998, -0.968155, 0.16403799)
			FOV = 72.0
			orbitangle = -50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = MID_Orbit_CW01
			type = MID_Orbit_CW
			LockTo = drummer
			Pos = (-3.629889, 2.363242, 15.843865)
			Quat = (0.01824, 0.9812179, -0.16114299)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Vert_Up01
		type = MID_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = MID_Vert_Down01
		type = MID_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = drummer
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
			cam2 = {
				LockTo = drummer
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_stage_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGE_High01
			type = STAGE_High
			LockTo = guitarist
			Pos = (-0.331379, 2.1398208, -2.9350684)
			Quat = (0.21009701, -0.053707, 0.011462)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.283846, -0.06725301)
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGE_Low01
			type = STAGE_Low
			LockTo = guitarist
			Pos = (-0.381286, 0.425256, -2.519796)
			Quat = (-0.10694, -0.058470998, -0.0063960003)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.365109, -0.27589303)
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = STAGE_Orbit_CCW01
			type = STAGE_Orbit_CCW
			LockTo = guitarist
			Pos = (-1.390305, 1.247357, -2.320251)
			Quat = (0.043256998, 0.222721, -0.009962)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = STAGE_Orbit_CW01
			type = STAGE_Orbit_CW
			LockTo = guitarist
			Pos = (1.1497709, 1.5669589, -2.5368068)
			Quat = (0.093412, -0.302062, 0.029615)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = STAGE_Vert_Up01
		type = STAGE_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = STAGE_Vert_Down01
		type = STAGE_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_guitar_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Solo_Body01
			type = GUITAR_Solo_Body
			LockTo = guitarist
			locktobone = Bone_Guitar_Body
			Pos = (-0.411937, 0.25536898, 0.113419)
			Quat = (0.035701, 0.765104, -0.314193)
			FOV = 69.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Solo_Neck01
			type = GUITAR_Solo_Neck
			LockTo = guitarist
			locktobone = BONE_GUITAR_NECK
			Pos = (0.6295221, 0.141155, 0.036870994)
			Quat = (-0.515311, -0.48547202, 0.643777)
			FOV = 59.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITAR_Closeup01
			type = guitar_closeup
			LockTo = guitarist
			Pos = (1.2061551, 1.830135, 2.4996212)
			Quat = (0.032743998, -0.969021, 0.16408199)
			FOV = 23.0
			lookat = guitarist
			lookatbone = Bone_Guitar_Body
			screenoffset = (-0.308609, -0.110810995)
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
Default_cameras_guitarist_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_Medium01
			type = GUITARIST_Medium
			player = 1
			LockTo = guitarist
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.023573, -0.96751004, 0.103691004)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (0.338886, -0.30280703)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_Medium01
			type = GUITARIST_Medium
			player = 2
			LockTo = bassist
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_CloseUp01
			type = guitarist_closeup
			player = 1
			LockTo = guitarist
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Head
			screenoffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = GUITARIST_CloseUp01
			type = guitarist_closeup
			player = 2
			LockTo = bassist
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CCW01
			type = GUITARIST_Orbit_CCW
			player = 1
			LockTo = guitarist
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.017220998, -0.98019695, 0.108353004)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CCW01
			type = GUITARIST_Orbit_CCW
			player = 2
			LockTo = bassist
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CW01
			type = GUITARIST_Orbit_CW
			player = 1
			LockTo = guitarist
			Pos = (-1.046432, 1.384884, 1.9220159)
			Quat = (0.029545998, 0.958008, -0.102428995)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Chest
			screenoffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = GUITARIST_Orbit_CW01
			type = GUITARIST_Orbit_CW
			player = 2
			LockTo = bassist
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Up01
		type = GUITARIST_Vert_Up
		player = 1
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Up01
		type = GUITARIST_Vert_Up
		player = 2
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Down01
		type = GUITARIST_Vert_Down
		player = 1
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = GUITARIST_Vert_Down01
		type = GUITARIST_Vert_Down
		player = 2
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
Default_cameras_singer_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = SINGER_Medium01
			type = SINGER_Medium
			LockTo = vocalist
			Pos = (0.76937497, 1.058248, 2.108929)
			Quat = (0.0024680002, -0.975066, 0.015652)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (0.38290703, -0.371808)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = SINGER_CloseUp01
			type = singer_closeup
			LockTo = vocalist
			Pos = (0.51758003, 1.618211, 0.616831)
			Quat = (0.012169001, -0.9712839, 0.055753)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Head
			screenoffset = (0.417869, -0.345862)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = SINGER_Orbit_CCW01
			type = SINGER_Orbit_CCW
			LockTo = vocalist
			Pos = (1.064897, 1.4607079, 1.941088)
			Quat = (0.02007, -0.96802, 0.087443)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = SINGER_Orbit_CW01
			type = SINGER_Orbit_CW
			LockTo = vocalist
			Pos = (-0.99324894, 1.5038509, 1.7319051)
			Quat = (0.032038998, 0.937449, -0.086307)
			FOV = 72.0
			lookat = vocalist
			lookatbone = Bone_Chest
			screenoffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = SINGER_Vert_Up01
		type = SINGER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
			cam2 = {
				LockTo = vocalist
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = SINGER_Vert_Down01
		type = SINGER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
			cam2 = {
				LockTo = vocalist
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
Default_cameras_bassist_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = BASSIST_Medium01
			type = BASSIST_Medium
			LockTo = bassist
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = BASSIST_CloseUp01
			type = bassist_closeup
			LockTo = bassist
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = BASSIST_Orbit_CCW01
			type = BASSIST_Orbit_CCW
			LockTo = bassist
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = BASSIST_Orbit_CW01
			type = BASSIST_Orbit_CW
			LockTo = bassist
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Chest
			screenoffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = BASSIST_Vert_Up01
		type = BASSIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = BASSIST_Vert_Down01
		type = BASSIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = bassist
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			cam2 = {
				LockTo = bassist
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
Default_cameras_rhythm_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = RHYTHM_Medium01
			type = RHYTHM_Medium
			LockTo = world
			Pos = (-2.303154, 0.764982, 4.8603663)
			Quat = (-0.012736999, 0.9809339, 0.112639)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.40689602, -0.21984601)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = RHYTHM_CloseUp01
			type = RHYTHM_CloseUp
			LockTo = world
			Pos = (-1.700512, 0.235937, 4.5619025)
			Quat = (-0.074879, -0.929315, -0.231359)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (0.39920303, -0.28451303)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = RHYTHM_Orbit_CCW01
			type = RHYTHM_Orbit_CCW
			LockTo = bassist
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		params = {
			name = RHYTHM_Orbit_CW01
			type = RHYTHM_Orbit_CW
			LockTo = bassist
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			lookat = rhythm
			lookatbone = Bone_Chest
			screenoffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		name = RHYTHM_Vert_Up01
		type = RHYTHM_Vert_Up
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
	{
		name = RHYTHM_Vert_Down01
		type = RHYTHM_Vert_Down
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_tod_manager
		CrowdOff
	}
]
Default_cameras_dolly_2p = [
	{
		name = DOLLY_Rear_L01
		type = DOLLY_Rear_L
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Rear_R01
		type = DOLLY_Rear_R
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Front_L01
		type = DOLLY_Front_L
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = DOLLY_Front_R01
		type = DOLLY_Front_R
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_pan_2p = [
	{
		name = PAN_Guitarist_Singer01
		type = PAN_Guitarist_Singer
		ControlScript = CameraCuts_Pan
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (-0.42091504, 0.147356)
			}
			cam2 = {
				LockTo = vocalist
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				lookat = vocalist
				lookatbone = Bone_Chest
				screenoffset = (0.358489, -0.170862)
			}
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
	{
		name = PAN_Singer_Guitarist01
		type = PAN_Singer_Guitarist
		ControlScript = CameraCuts_Pan
		params = {
			cam1 = {
				LockTo = vocalist
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				lookat = vocalist
				lookatbone = Bone_Chest
				screenoffset = (0.358489, -0.170862)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (-0.42091504, 0.147356)
			}
		}
		DOF = $DOF_CloseUp01_tod_manager
	}
]
Default_cameras_zoom_2p = [
	{
		name = ZOOM_Out_Slow01
		type = ZOOM_Out_Slow
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = ZOOM_Out_Fast01
		type = ZOOM_Out_Fast
		ControlScript = CameraCuts_QuickZoom
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium02_tod_manager
	}
	{
		name = ZOOM_In_Slow01
		type = ZOOM_In_Slow
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		name = ZOOM_In_Fast01
		type = ZOOM_In_Fast
		ControlScript = CameraCuts_QuickZoom
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.303226, -0.470842)
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium02_tod_manager
	}
]
Default_cameras_special_2p = [
	{
		name = special01
		type = SPECIAL_A
		ControlScript = CameraCuts_ThreePos
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (7.91994, 4.0722446, 15.780664)
				Quat = (0.043356, -0.954315, 0.156901)
				FOV = 52.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (4.605281, 1.9775009, 9.89547)
				Quat = (0.037202, -0.957874, 0.13346401)
				FOV = 52.0
			}
			Cam3 = {
				LockTo = guitarist
				Pos = (1.5902342, 1.2208471, 4.5518465)
				Quat = (0.016259, -0.9656329, 0.053746)
				FOV = 52.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = special02
			type = SPECIAL_B
			orbitangle = 90
			cam1 = {
				LockTo = guitarist
				Pos = (-3.7134671, 1.561098, 5.2489767)
				Quat = (0.022261, 0.94396603, -0.111006)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (-1.6345519, 0.98434895, 2.433505)
				Quat = (-0.013397, 0.950469, -0.0021470003)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = special03
			type = SPECIAL_C
			orbitangle = -40
			cam1 = {
				LockTo = guitarist
				Pos = (2.1238008, 3.287695, 5.0177402)
				Quat = (0.076614, -0.92003894, 0.22002399)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.615803, 1.9095379, 2.403839)
				Quat = (0.043414995, -0.957317, 0.186884)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_SpecialStepMove
		params = {
			name = special04
			type = SPECIAL_D
			cam1 = {
				LockTo = guitarist
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			stepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_Off_tod_manager
		}
	}
]
Default_cameras_mocap_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP01
			type = MOCAP
			LockTo = guitarist
			Pos = (-0.24607702, 3.316178, 0.92423993)
			Quat = (0.021933999, 0.868847, -0.49323303)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP02
			type = MOCAP
			LockTo = vocalist
			Pos = (0.0024010001, 3.3782017, 1.199096)
			Quat = (0.009012999, 0.84305805, -0.53760797)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP03
			type = MOCAP
			LockTo = bassist
			Pos = (-0.0057200002, 3.355163, 2.1156142)
			Quat = (0.008965001, 0.8438061, -0.53643596)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = MOCAP04
			type = MOCAP
			LockTo = drummer
			Pos = (0.107346, 3.4477382, 1.783761)
			Quat = (0.008895, 0.84684604, -0.53162295)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_stagedive_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = STAGEDIVER01
			type = stagediver
			LockTo = world
			Pos = (0.161384, -0.255694, 7.6203847)
			Quat = (-0.019520998, 0.9806339, 0.12749502)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
Default_cameras_starpower_2p = [
	{
		name = starpower
		type = starpower
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = world
				Pos = (2.58572, 1.1694639, 6.018505)
				Quat = (-0.001818, -0.97748, 0.008785)
				FOV = 72.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.33652902, -0.198419)
			}
			cam2 = {
				LockTo = world
				Pos = (2.126417, 1.151183, 5.003499)
				Quat = (-0.003998, -0.97537994, -0.0012250001)
				FOV = 104.0
				lookat = guitarist
				lookatbone = Bone_Chest
				screenoffset = (0.43471202, -0.20290701)
			}
			DOF = $DOF_CloseUp02_tod_manager
			CrowdOff
		}
	}
]
Default_cameras_intro_2p = [
	{
		name = intro
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_fastintro_2p = [
	{
		name = fastintro
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
Default_cameras_boss_2p = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
Default_cameras_encore_2p = [
	{
		name = encore
		ControlScript = CameraCuts_TwoCam
		params = {
			cam1 = {
				LockTo = guitarist
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_walk_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = Walk01
			type = walk
			LockTo = world
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_tod_manager
		CrowdOff
	}
]
Default_cameras_win_2p = [
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		params = {
			name = win
			orbitangle = 10
			cam1 = {
				LockTo = guitarist
				Pos = (0.206255, 0.082557, 3.0024462)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
			cam2 = {
				LockTo = guitarist
				Pos = (0.96568394, -0.40605003, 4.6806836)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium02_tod_manager
		CrowdOff
	}
]
Default_cameras_lose_2p = [
	{
		ControlScript = CameraCuts_TwoCam
		params = {
			name = lose
			cam1 = {
				LockTo = world
				Pos = (-1.7738701, 2.2631419, 2.070564)
				Quat = (0.19757299, 0.477018, -0.111905)
				FOV = 72.0
			}
			cam2 = {
				LockTo = world
				Pos = (-4.2446136, 4.020077, 0.17742501)
				Quat = (0.214849, 0.45659703, -0.11555701)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_tod_manager
	}
]
Default_cameras_boss_battle_2p = [
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = PLAYER_CloseUp01
			type = Player_CloseUp
			LockTo = guitarist
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			lookat = guitarist
			lookatbone = Bone_Head
			screenoffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		params = {
			name = BOSS_CloseUp01
			type = Boss_CloseUp
			LockTo = bassist
			Pos = (-0.145081, 1.3932941, 1.119517)
			Quat = (-0.0023100001, 0.9869389, 0.020386)
			FOV = 72.0
			lookat = bassist
			lookatbone = Bone_Head
			screenoffset = (-0.36468503, -0.38086903)
		}
		DOF = $DOF_CloseUp01_tod_manager
		CrowdOff
	}
]
gWinportCameraLocked = 0

script winportLockCamera 
	change \{gWinportCameraLocked = 1}
endscript

script winportUnlockCamera 
	change \{gWinportCameraLocked = 0}
endscript
