Menu_pos = (675.0, 100.0)

script create_debugging_menu 
	create_generic_backdrop
	createScreenElement \{Type = VScrollingMenu PARENT = pause_menu Id = debug_scrolling_menu just = [Left top] Dims = (400.0, 480.0) pos = $Menu_pos}
	createScreenElement \{Type = VMenu PARENT = debug_scrolling_menu Id = debug_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back back_to_retail_ui_flow}]}
	disable_pause
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Unlock All" z_priority = 100.0 just = [Left top] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose playday_unlockall}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Repeat Last Song" z_priority = 100.0 just = [Left top] Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose select_start_song Params = {uselaststarttime}}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu Id = toggle_playermode_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Play Song: 1p_quickplay" z_priority = 100.0 just = [Left top] Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{PAD_LEFT toggle_playermode_left}{pad_right toggle_playermode_right}{pad_choose select_playermode}]}
	toggle_playermode_setprop
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Settings" z_priority = 100.0 just = [Left top] Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_settings_menu}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Character Select" just = [Left top] z_priority = 100.0 Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_character_viewer_menu}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Skip Into Song" just = [Left top] z_priority = 100.0 Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipintosong_menu}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Save Replay Buffer" just = [Left top] z_priority = 100.0 Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose save_replay}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Load Replay" just = [Left top] z_priority = 100.0 Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_replay_menu}]}
	createScreenElement \{Type = textElement PARENT = debug_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Play Credits" just = [Left top] z_priority = 100.0 Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose debug_playcredits}]}
	launchevent \{Type = focus Target = debug_vmenu}
endscript

script destroy_debugging_menu 
	if ScreenelementExists \{Id = debug_scrolling_menu}
		DestroyScreenelement \{Id = debug_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script back_to_debug_menu 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	create_debugging_menu
endscript

script destroy_all_debug_menus 
	destroy_replay_menu
	destroy_songversion_menu
	destroy_settings_menu
	destroy_character_viewer_menu
	destroy_skipintosong_menu
	destroy_cameracut_menu
	destroy_difficulty_menu
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	destroy_debugging_menu
endscript
debug_playcredits_active = 0

script debug_playcredits 
	kill_gem_scroller
	destroy_debugging_menu
	reset_score \{player_status = player1_status}
	Change \{end_credits = 1}
	Change \{debug_playcredits_active = 1}
	Progression_EndCredits
endscript

script back_to_online_menu 
	Printf \{"---back_to_online_menu"}
	quit_network_game
	destroy_create_session_menu
	create_online_menu
endscript

script create_songversion_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = songversion_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (40.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = songversion_scrolling_menu Id = songversion_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_debug_menu}}]}
	createScreenElement \{Type = textElement PARENT = songversion_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Play GH3 Song" z_priority = 100.0 just = [Left top] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_song_menu Params = {version = gh3}}]}
	createScreenElement \{Type = textElement PARENT = songversion_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Play GH2 Song" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_song_menu Params = {version = gh2}}]}
	createScreenElement \{Type = textElement PARENT = songversion_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Play GH1 Song" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_song_menu Params = {version = gh1}}]}
	launchevent \{Type = focus Target = songversion_vmenu}
endscript

script back_to_songversion_menu 
	destroy_song_menu
	create_songversion_menu
endscript

script destroy_songversion_menu 
	if ScreenelementExists \{Id = songversion_scrolling_menu}
		DestroyScreenelement \{Id = songversion_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_song_menu \{version = gh3}
	ui_menu_select_sfx
	destroy_songversion_menu
	create_generic_backdrop
	x_pos = 450
	if (<version> = gh1)
		<x_pos> = 455
	endif
	if (<version> = gh2)
		<x_pos> = 520
	endif
	if (<version> = gh3)
		<x_pos> = 500
	endif
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = song_scrolling_menu
		just = [Left top]
		Dims = (400.0, 250.0)
		pos = ($Menu_pos - (520.0, 0.0) + (<x_pos> * (1.0, 0.0)))
	}
	createScreenElement \{Type = VMenu PARENT = song_scrolling_menu Id = song_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_songversion_menu}}]}
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum Index = <array_entry>
	get_song_struct Song = <song_checksum>
	if ((<song_struct>.version) = <version>)
		get_song_title Song = <song_checksum>
		createScreenElement {
			Type = textElement
			PARENT = song_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <Song_Title>
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_difficulty_menu Params = {song_name = <song_checksum> version = <version> Player = 1}}
			]
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = song_vmenu}
endscript

script back_to_song_menu 
	destroy_difficulty_menu
	create_song_menu version = <version>
endscript

script destroy_song_menu 
	if ScreenelementExists \{Id = song_scrolling_menu}
		DestroyScreenelement \{Id = song_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_difficulty_menu 
	destroy_song_menu
	destroy_difficulty_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = difficulty_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement {
		Type = VMenu
		PARENT = difficulty_menu
		Id = difficulty_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back generic_menu_pad_back Params = {callback = back_to_song_menu version = <version>}}
		]
	}
	array_entry = 0
	getArraySize \{$difficulty_list}
	begin
	difficulty_count = ($difficulty_list [<array_entry>])
	get_difficulty_text DIFFICULTY = <difficulty_count>
	if (<Player> = 2)
		createScreenElement {
			Type = textElement
			PARENT = difficulty_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <difficulty_text>
			z_priority = 100.0
			just = [Left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_start_song Params = {song_name = <song_name> difficulty2 = ($difficulty_list [<array_entry>]) DIFFICULTY = <DIFFICULTY>}}
			]
		}
	else
		if ($current_num_players = 2)
			createScreenElement {
				Type = textElement
				PARENT = difficulty_vmenu
				font = text_A1
				scale = 0.75
				rgba = [210 210 210 250]
				Text = <difficulty_text>
				just = [Left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose create_difficulty_menu Params = {song_name = <song_name> version = <version> DIFFICULTY = ($difficulty_list [<array_entry>]) Player = 2}}
				]
			}
		else
			createScreenElement {
				Type = textElement
				PARENT = difficulty_vmenu
				font = text_A1
				scale = 0.75
				rgba = [210 210 210 250]
				Text = <difficulty_text>
				just = [Left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose select_start_song Params = {DIFFICULTY = ($difficulty_list [<array_entry>]) song_name = <song_name>}}
				]
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = difficulty_vmenu}
endscript

script destroy_difficulty_menu 
	if ScreenelementExists \{Id = difficulty_menu}
		DestroyScreenelement \{Id = difficulty_menu}
	endif
	destroy_generic_backdrop
endscript

script create_settings_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = settings_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos - (30.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = settings_scrolling_menu Id = settings_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_debug_menu}}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Venue" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changevenue_menu}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Guitar" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changeguitar_menu Params = {Type = GUITAR}}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Bass" just = [Left top] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changeguitar_menu Params = {Type = BASS}}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_visibility_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle visibility" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_togglevisibility_menu}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = select_slomo_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Select Slomo : 1.0" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose select_slomo}]}
	select_slomo_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_showmeasures_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Show Measures" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_showmeasures}]}
	toggle_showmeasures_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_showcameraname_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Show Camera Name" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_showcameraname}]}
	toggle_showcameraname_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_inputlog_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Show Input Log" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_inputlog}]}
	toggle_inputlog_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_botp1_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle Bot P1" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_botp1}]}
	toggle_botp1_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_botp2_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle Bot P2" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_botp2}]}
	toggle_botp2_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = edit_inputlog_lines_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Input Log Lines" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{PAD_LEFT edit_inputlog_lines_left}{pad_right edit_inputlog_lines_right}]}
	edit_inputlog_lines_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_tilt_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Show Input Log" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_tilt}]}
	toggle_tilt_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_leftyflip_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Leftyflip" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_leftyflip}]}
	toggle_leftyflip_setprop
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = create_cameracut_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Select CameraCut" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_cameracut_menu}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle GPU Time" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_global Params = {global_toggle = show_gpu_time}}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle CPU Time" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_global Params = {global_toggle = show_cpu_time}}]}
	createScreenElement \{Type = textElement PARENT = settings_vmenu Id = toggle_forcescore_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Force Score" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_forcescore}]}
	toggle_forcescore_setprop
	launchevent \{Type = focus Target = settings_vmenu}
endscript

script playday_unlockall 
	difficulties = [EASY MEDIUM HARD EXPERT]
	stored_difficulty1 = ($current_difficulty)
	stored_difficulty2 = ($current_difficulty2)
	stored_band = ($current_band)
	stored_gamemode = ($game_mode)
	if ($progression_pop_count = 1)
		popped = 1
		progression_push_current
	else
		popped = 0
	endif
	diff_index = 0
	begin
	Change current_difficulty = (<difficulties> [<diff_index>])
	Change current_difficulty2 = (<difficulties> [<diff_index>])
	band_index = 1
	begin
	Change current_band = <band_index>
	Change \{game_mode = p1_career}
	progression_pop_current
	get_progression_globals \{game_mode = p1_career}
	GlobalTags_UnlockAll Songlist = <tier_global>
	progression_push_current
	Change \{game_mode = p2_career}
	progression_pop_current
	get_progression_globals \{game_mode = p2_career}
	GlobalTags_UnlockAll Songlist = <tier_global>
	progression_push_current
	band_index = (<band_index> + 1)
	repeat 5
	GlobalTags_UnlockAll \{Songlist = GH3_General_Songs}
	GlobalTags_UnlockAll \{Songlist = GH3_GeneralP2_Songs}
	GlobalTags_UnlockAll \{Songlist = GH3_Bonus_Songs}
	<diff_index> = (<diff_index> + 1)
	repeat 4
	getArraySize ($GH3_Bonus_Songs.tier1.songs)
	I = 0
	begin
	setGlobalTags ($GH3_Bonus_Songs.tier1.songs [<I>]) Params = {unlocked = 1}
	<I> = (<I> + 1)
	repeat <array_Size>
	I = 5
	getArraySize ($bv_text_array)
	begin
	video_checksum = ($bv_text_array [<I>].Id)
	setGlobalTags <video_checksum> Params = {unlocked = 1}
	<I> = (<I> + 1)
	repeat (<array_Size> - 5)
	Change \{StructureName = player1_status new_cash = 0}
	Change \{progression_play_completion_movie = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change current_difficulty = <stored_difficulty1>
	Change current_difficulty2 = <stored_difficulty2>
	Change current_band = <stored_band>
	Change game_mode = <stored_gamemode>
	if (<popped> = 1)
		progression_pop_current
	endif
endscript

script back_to_settings_menu 
	destroy_changevenue_menu
	destroy_changehighway_menu
	destroy_changeguitar_menu
	destroy_togglevisibility_menu
	destroy_cameracut_menu
	create_settings_menu
endscript

script destroy_settings_menu 
	if ScreenelementExists \{Id = settings_scrolling_menu}
		DestroyScreenelement \{Id = settings_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
CameraCutPrefixArray = [
	'cameras'
	'cameras_good'
	'cameras_normal'
	'cameras_poor'
	'cameras_good_2p'
	'cameras_normal_2p'
	'cameras_poor_2p'
	'cameras_solo'
	'cameras_guitar_closeup'
	'cameras_closeup'
	'cameras_drummer'
	'cameras_singer'
	'cameras_singer_closeup'
	'cameras_bassist'
	'cameras_orbit'
	'cameras_pan'
	'cameras_dolly'
	'cameras_zoom_slow'
	'cameras_zoom_fast'
	'cameras_zoom_out'
	'cameras_vert_drummer'
	'cameras_vert_guitarist'
	'cameras_vert_stagerear'
	'cameras_vert_stagefront'
	'cameras_intro'
	'cameras_fastintro'
	'cameras_boss'
	'cameras_encore'
	'cameras_walk'
	'cameras_starpower'
	'cameras_special'
	'cameras_stagedive'
	'cameras_win'
	'cameras_lose'
	'cameras_preencore'
	'cameras_preboss'
	'cameras_2p'
	'cameras_boss_closeup_2p'
	'cameras_player_closeup_2p'
	'cameras_solo_2p'
	'cameras_guitar_closeup_2p'
	'cameras_drummer_2p'
	'cameras_singer_2p'
	'cameras_singer_closeup_2p'
	'cameras_bassist_2p'
	'cameras_orbit_2p'
	'cameras_pan_2p'
	'cameras_intro_2p'
	'cameras_fastintro_2p'
	'cameras_starpower_2p'
	'cameras_win_2p'
	'cameras_lose_2p'
]

script create_cameracut_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = selectcameracut_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos - (30.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = selectcameracut_scrolling_menu Id = selectcameracut_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_settings_menu}}]}
	createScreenElement \{Type = textElement PARENT = selectcameracut_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "off" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose select_cameracut Params = {Camera_Array_pakname = NONE Camera_Array = NONE array_count = NONE}}]}
	GetPakManCurrentName \{map = Zones}
	camera_count = 0
	getArraySize \{$CameraCutPrefixArray}
	camera_array_size = <array_Size>
	begin
	formatText Checksumname = Camera_Array '%s_%p' S = <pakname> P = ($CameraCutPrefixArray [<camera_count>])
	if Globalexists Name = <Camera_Array>
		getArraySize $<Camera_Array>
		array_count = 0
		begin
		formatText Textname = Camera_Name "%s_%p_%i" S = <pakname> P = ($CameraCutPrefixArray [<camera_count>]) I = <array_count>
		if structureContains Structure = ($<Camera_Array> [<array_count>]) Name
			formatText Textname = Camera_Name "%s" S = ($<Camera_Array> [<array_count>].Name) dontassertforchecksums
			elseif structureContains Structure = ($<Camera_Array> [<array_count>]) Params
			if structureContains Structure = ($<Camera_Array> [<array_count>].Params) Name
				formatText Textname = Camera_Name "%s" S = ($<Camera_Array> [<array_count>].Params.Name) dontassertforchecksums
			endif
		endif
		createScreenElement {
			Type = textElement
			PARENT = selectcameracut_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <Camera_Name>
			z_priority = 100.0
			just = [Left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_cameracut Params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count>}}
				{pad_square select_cameracut Params = {Camera_Array_pakname = <pakname> Camera_Array = ($CameraCutPrefixArray [<camera_count>]) array_count = <array_count> jumptoviewer}}
			]
		}
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
	camera_count = (<camera_count> + 1)
	repeat <camera_array_size>
	launchevent \{Type = focus Target = selectcameracut_vmenu}
endscript

script back_to_cameracut_menu 
	create_cameracut_menu
endscript

script destroy_cameracut_menu 
	if ScreenelementExists \{Id = selectcameracut_scrolling_menu}
		DestroyScreenelement \{Id = selectcameracut_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
debug_camera_array = NONE
debug_camera_array_pakname = NONE
debug_camera_array_count = 0

script select_cameracut 
	ui_menu_select_sfx
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	destroy_cameracuts
	Wait \{3 gameframes}
	create_cameracuts
	if gotParam \{jumptoviewer}
		destroy_all_debug_menus
		unpausegh3
		enable_pause
		Change \{viewer_buttons_enabled = 1}
		ToggleViewMode
	endif
endscript

script create_character_viewer_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = character_viewer_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos - (30.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = character_viewer_scrolling_menu Id = character_viewer_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_debug_menu}}]}
	createScreenElement \{Type = textElement PARENT = character_viewer_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Guitarist" z_priority = 100.0 just = [Left top] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changeguitarist_menu}]}
	createScreenElement \{Type = textElement PARENT = character_viewer_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Bassist" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changebassist_menu}]}
	createScreenElement \{Type = textElement PARENT = character_viewer_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Vocalist" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changevocalist_menu}]}
	createScreenElement \{Type = textElement PARENT = character_viewer_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Change Drummer" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_changedrummer_menu}]}
	launchevent \{Type = focus Target = character_viewer_vmenu}
endscript

script back_to_character_viewer_menu 
	destroy_changeguitarist_menu
	destroy_changebassist_menu
	destroy_changevocalist_menu
	destroy_changedrummer_menu
	create_character_viewer_menu
endscript

script destroy_character_viewer_menu 
	if ScreenelementExists \{Id = character_viewer_scrolling_menu}
		DestroyScreenelement \{Id = character_viewer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitarist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changeguitarist_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changeguitarist_scrolling_menu Id = changeguitarist_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_character_viewer_menu}}]}
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	Type = (<profile_struct>.Type)
	if ((<Type> = GUITARIST) || (<Type> = Any))
		createScreenElement {
			Type = textElement
			PARENT = changeguitarist_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = (<profile_struct>.fullname)
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose debug_menu_choose_guitarist Params = {Index = <Index>}}
			]
		}
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changeguitarist_vmenu}
endscript

script destroy_changeguitarist_menu 
	if ScreenelementExists \{Id = changeguitarist_scrolling_menu}
		DestroyScreenelement \{Id = changeguitarist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script debug_menu_choose_guitarist 
	kill_gem_scroller
	get_musician_profile_struct Index = <Index>
	formatText Checksumname = guitarist_id '%s' S = (<profile_struct>.Name)
	Change StructureName = player1_status character_id = <guitarist_id>
	if NOT create_guitarist \{useOldPos}
		DownloadContentLost
	endif
	restart_gem_scroller song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = ($current_starttime) device_num = <device_num>
endscript

script create_changebassist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changebassist_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changebassist_scrolling_menu Id = changebassist_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_character_viewer_menu}}]}
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	Type = (<profile_struct>.Type)
	if ((<Type> = BASSIST) || (<Type> = Any))
		createScreenElement {
			Type = textElement
			PARENT = changebassist_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = (<profile_struct>.Name)
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_bassist Params = {profile_name = (<info_struct>.Name) useOldPos}}
			]
		}
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changebassist_vmenu}
endscript

script destroy_changebassist_menu 
	if ScreenelementExists \{Id = changebassist_scrolling_menu}
		DestroyScreenelement \{Id = changebassist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changevocalist_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changevocalist_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changevocalist_scrolling_menu Id = changevocalist_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_character_viewer_menu}}]}
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	Type = (<profile_struct>.Type)
	if ((<Type> = VOCALIST) || (<Type> = Any))
		createScreenElement {
			Type = textElement
			PARENT = changevocalist_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = (<profile_struct>.Name)
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_vocalist Params = {profile_name = (<info_struct>.Name) useOldPos}}
			]
		}
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changevocalist_vmenu}
endscript

script destroy_changevocalist_menu 
	if ScreenelementExists \{Id = changevocalist_scrolling_menu}
		DestroyScreenelement \{Id = changevocalist_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changedrummer_menu 
	ui_menu_select_sfx
	destroy_character_viewer_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changedrummer_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changedrummer_scrolling_menu Id = changedrummer_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_character_viewer_menu}}]}
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	Type = (<profile_struct>.Type)
	if ((<Type> = DRUMMER) || (<Type> = Any))
		createScreenElement {
			Type = textElement
			PARENT = changedrummer_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = (<profile_struct>.Name)
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose create_drummer Params = {profile_name = (<info_struct>.Name) useOldPos}}
			]
		}
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changedrummer_vmenu}
endscript

script destroy_changedrummer_menu 
	if ScreenelementExists \{Id = changedrummer_scrolling_menu}
		DestroyScreenelement \{Id = changedrummer_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_playermode 
	Change player1_device = <device_num>
	translate_gamemode
	create_songversion_menu
endscript

script translate_gamemode 
	switch $game_mode
		case p1_quickplay
		Change \{StructureName = player1_status part = GUITAR}
		Change \{current_num_players = 1}
		case p1_career
		Change \{StructureName = player1_status part = GUITAR}
		Change \{current_num_players = 1}
		case p1_improv
		Change \{StructureName = player1_status part = GUITAR}
		Change \{current_num_players = 1}
		case p1_boss
		Change \{StructureName = player1_status part = GUITAR}
		Change \{current_num_players = 1}
		case p2_faceoff
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = GUITAR}
		Change \{current_num_players = 2}
		case p2_coop
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = RHYTHM}
		Change \{current_num_players = 2}
		case p2_battle
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = GUITAR}
		Change \{current_num_players = 2}
		case p2_career
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = RHYTHM}
		Change \{current_num_players = 2}
		case training
		Change \{StructureName = player1_status part = GUITAR}
		Change \{current_num_players = 1}
	endswitch
endscript

script toggle_playermode_left 
	switch $game_mode
		case p1_quickplay
		Change \{game_mode = training}
		case p1_career
		Change \{game_mode = p1_quickplay}
		case p1_improv
		Change \{game_mode = p1_career}
		case p1_boss
		Change \{game_mode = p1_improv}
		case p2_faceoff
		Change \{game_mode = p1_boss}
		case p2_coop
		Change \{game_mode = p2_faceoff}
		case p2_battle
		Change \{game_mode = p2_coop}
		case p2_career
		Change \{game_mode = p2_battle}
		case training
		Change \{game_mode = p2_career}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_right 
	switch $game_mode
		case p1_quickplay
		Change \{game_mode = p1_career}
		case p1_career
		Change \{game_mode = p1_improv}
		case p1_improv
		Change \{game_mode = p1_boss}
		case p1_boss
		Change \{game_mode = p2_faceoff}
		case p2_faceoff
		Change \{game_mode = p2_coop}
		case p2_coop
		Change \{game_mode = p2_battle}
		case p2_battle
		Change \{game_mode = p2_career}
		case p2_career
		Change \{game_mode = training}
		case training
		Change \{game_mode = p1_quickplay}
	endswitch
	toggle_playermode_setprop
endscript

script toggle_playermode_setprop 
	switch $game_mode
		case p1_quickplay
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p1_quickplay"}
		case p1_career
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p1_career"}
		case p1_improv
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p1_improv"}
		case p1_boss
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p1_boss"}
		case p2_faceoff
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p2_faceoff"}
		case p2_coop
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p2_coop"}
		case p2_battle
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p2_battle"}
		case p2_career
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: p2_career"}
		case training
		toggle_playermode_menuitem :SetProps \{Text = "Play Song: training"}
	endswitch
endscript

script select_slomo 
	ui_menu_select_sfx
	speedfactor = ($current_speedfactor * 10.0)
	castToInteger \{speedfactor}
	speedfactor = (<speedfactor> + 1)
	if (<speedfactor> > 10)
		speedfactor = 1
	endif
	if (<speedfactor> < 1)
		speedfactor = 1
	endif
	Change current_speedfactor = (<speedfactor> / 10.0)
	update_slomo
	select_slomo_setprop
endscript

script update_slomo 
	SetSlomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	Change StructureName = <player_status> check_time_early = ($check_time_early * $current_speedfactor)
	Change StructureName = <player_status> check_time_late = ($check_time_late * $current_speedfactor)
	Player = (<Player> + 1)
	repeat $current_num_players
endscript

script select_slomo_setprop 
	formatText \{Textname = slomo_text "Select Slomo : %s" S = $current_speedfactor}
	select_slomo_menuitem :SetProps Text = <slomo_text>
endscript
debug_showmeasures = OFF

script toggle_showmeasures 
	ui_menu_select_sfx
	if ($debug_showmeasures = OFF)
		Change \{debug_showmeasures = On}
	else
		Change \{debug_showmeasures = OFF}
	endif
	toggle_showmeasures_setprop
endscript

script toggle_showmeasures_setprop 
	if ($debug_showmeasures = OFF)
		toggle_showmeasures_menuitem :SetProps \{Text = "Show Measures : off"}
	else
		toggle_showmeasures_menuitem :SetProps \{Text = "Show Measures : on"}
	endif
endscript
debug_showcameraname = OFF

script toggle_showcameraname 
	ui_menu_select_sfx
	if ScreenelementExists \{Id = debug_camera_name_text}
		DestroyScreenelement \{Id = debug_camera_name_text}
	endif
	if ($debug_showcameraname = OFF)
		Change \{debug_showcameraname = On}
		createScreenElement \{Type = textElement PARENT = root_window Id = debug_camera_name_text font = text_A1 pos = (640.0, 32.0) just = [Center top] scale = 1.0 rgba = [210 210 210 250] Text = "Camera Name" z_priority = 100.0 z_priority = 1.0 Alpha = 1}
	else
		Change \{debug_showcameraname = OFF}
	endif
	toggle_showcameraname_setprop
	CameraCuts_UpdateDebugCameraName
endscript

script toggle_inputlog 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_play_log = 0)
		Change \{show_play_log = 1}
	else
		Change \{show_play_log = 0}
	endif
	toggle_inputlog_setprop
	init_play_log
endscript

script toggle_botp1 
	ui_menu_select_sfx
	kill_debug_elements
	Change StructureName = player1_status bot_play = (1 - ($player1_status.bot_play))
	toggle_botp1_setprop
endscript

script toggle_botp2 
	ui_menu_select_sfx
	kill_debug_elements
	Change StructureName = player2_status bot_play = (1 - ($player2_status.bot_play))
	toggle_botp2_setprop
endscript

script edit_inputlog_lines_left 
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines -1)
	if ($play_log_lines < 1)
		Change \{play_log_lines = 1}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script edit_inputlog_lines_right 
	ui_menu_select_sfx
	kill_debug_elements
	Change play_log_lines = ($play_log_lines + 1)
	if ($play_log_lines > 10)
		Change \{play_log_lines = 10}
	endif
	edit_inputlog_lines_setprop
	init_play_log
endscript

script toggle_tilt 
	ui_menu_select_sfx
	kill_debug_elements
	if ($show_guitar_tilt = 0)
		Change \{show_guitar_tilt = 1}
	else
		Change \{show_guitar_tilt = 0}
	endif
	toggle_tilt_setprop
	init_play_log
endscript

script toggle_showcameraname_setprop 
	if ($debug_showcameraname = OFF)
		toggle_showcameraname_menuitem :SetProps \{Text = "Show Camera Name : off"}
	else
		toggle_showcameraname_menuitem :SetProps \{Text = "Show Camera Name : on"}
	endif
endscript

script toggle_inputlog_setprop 
	if ($show_play_log = 0)
		toggle_inputlog_menuitem :SetProps \{Text = "Show Input Log : off"}
	else
		toggle_inputlog_menuitem :SetProps \{Text = "Show Input Log : on"}
	endif
endscript

script toggle_botp1_setprop 
	if (($player1_status.bot_play) = 0)
		toggle_botp1_menuitem :SetProps \{Text = "Toggle Bot P1: Off"}
	else
		toggle_botp1_menuitem :SetProps \{Text = "Toggle Bot P1: On"}
	endif
endscript

script toggle_botp2_setprop 
	if (($player2_status.bot_play) = 0)
		toggle_botp2_menuitem :SetProps \{Text = "Toggle Bot P2: Off"}
	else
		toggle_botp2_menuitem :SetProps \{Text = "Toggle Bot P2: On"}
	endif
endscript

script edit_inputlog_lines_setprop 
	formatText Textname = Text "Input Log Lines: %l" L = ($play_log_lines) dontassertforchecksums
	edit_inputlog_lines_menuitem :SetProps Text = <Text>
endscript

script toggle_tilt_setprop 
	if ($show_guitar_tilt = 0)
		toggle_tilt_menuitem :SetProps \{Text = "Show Tilt : off"}
	else
		toggle_tilt_menuitem :SetProps \{Text = "Show Tilt : on"}
	endif
endscript

script toggle_leftyflip 
	ui_menu_select_sfx
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		setGlobalTags \{user_options Params = {lefty_flip_p1 = 1}}
	else
		setGlobalTags \{user_options Params = {lefty_flip_p1 = 0}}
	endif
	getglobaltags \{user_options}
	Change StructureName = <player_status> lefthanded_gems = <lefty_flip_p1>
	Change StructureName = <player_status> lefthanded_button_ups = <lefty_flip_p1>
	toggle_leftyflip_setprop
endscript

script toggle_leftyflip_setprop 
	getglobaltags \{user_options}
	if (<lefty_flip_p1> = 0)
		toggle_leftyflip_menuitem :SetProps \{Text = "Lefty Flip : off"}
	else
		toggle_leftyflip_menuitem :SetProps \{Text = "Lefty Flip : on"}
	endif
endscript
debug_forcescore = OFF

script toggle_forcescore 
	ui_menu_select_sfx
	switch $debug_forcescore
		case OFF
		Change \{debug_forcescore = Poor}
		case Poor
		Change \{debug_forcescore = MEDIUM}
		case MEDIUM
		Change \{debug_forcescore = GOOD}
		case GOOD
		Change \{debug_forcescore = OFF}
		default
		Change \{debug_forcescore = OFF}
	endswitch
	CrowdIncrease \{player_status = player1_status}
	toggle_forcescore_setprop
endscript

script toggle_forcescore_setprop 
	switch $debug_forcescore
		case OFF
		toggle_forcescore_menuitem :SetProps \{Text = "Force Score : off"}
		case Poor
		toggle_forcescore_menuitem :SetProps \{Text = "Force Score : poor"}
		case MEDIUM
		toggle_forcescore_menuitem :SetProps \{Text = "Force Score : medium"}
		case GOOD
		toggle_forcescore_menuitem :SetProps \{Text = "Force Score : good"}
		default
		toggle_forcescore_menuitem :SetProps \{Text = "Force Score : off"}
	endswitch
endscript

script create_changevenue_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changevenue_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changevenue_scrolling_menu Id = changevenue_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_settings_menu}}]}
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum Index = <array_count>
	createScreenElement {
		Type = textElement
		PARENT = changevenue_vmenu
		font = text_A1
		scale = 0.75
		rgba = [210 210 210 250]
		Text = ($levelzones.<level_checksum>.title)
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose select_venue Params = {Level = <level_checksum> NoRestart}}
		]
	}
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changevenue_vmenu}
endscript

script back_to_changevenue_menu 
	create_changevenue_menu
endscript

script destroy_changevenue_menu 
	if ScreenelementExists \{Id = changevenue_scrolling_menu}
		DestroyScreenelement \{Id = changevenue_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_venue 
	ui_menu_select_sfx
	kill_gem_scroller
	ResetWaypoints
	if gotParam \{Level}
		Change current_level = <Level>
	endif
	SetPakManCurrentBlock \{map = Zones pak = NONE block_scripts = 1}
	changenodeflag \{LS_3_5_PRE 1}
	changenodeflag \{LS_3_5_POST 0}
	changenodeflag \{LS_ENCORE_PRE 1}
	changenodeflag \{LS_ENCORE_POST 0}
	Load_Venue \{block_scripts = 1}
	setup_bg_viewport
	restore_dummy_bg_camera
	disable_bg_viewport_properties
	create_movie_viewport
	if ($current_level = load_z_testlevel_peds)
		SpawnScriptNOw \{testlevel_debug}
	else
		if NOT create_band
			DownloadContentLost
		endif
		create_crowd_models
		crowd_reset \{player_status = player1_status Player = 1}
	endif
	enable_pause
	restore_start_key_binding
	if NOT gotParam \{NoRestart}
		gh3_start_pressed
		restart_gem_scroller song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = ($current_starttime) device_num = <device_num>
	else
		ToggleViewMode
		ToggleViewMode
	endif
endscript

script testlevel_debug 
	begin
	if ControllerMake \{CIRCLE 0}
		next_peds
	endif
	if ControllerMake \{CIRCLE 1}
		next_peds
	endif
	Wait \{1 GameFrame}
	repeat
endscript
debug_ped_row = 0

script next_peds 
	kill \{Prefix = Z_TestLevel_Peds_Row0}
	kill \{Prefix = Z_TestLevel_Peds_Row1}
	kill \{Prefix = Z_TestLevel_Peds_Row2}
	kill \{Prefix = Z_TestLevel_Peds_Row3}
	kill \{Prefix = Z_TestLevel_Peds_Row4}
	kill \{Prefix = Z_TestLevel_Peds_Row5}
	kill \{Prefix = Z_TestLevel_Peds_Row6}
	kill \{Prefix = Z_TestLevel_Peds_Row7}
	Wait \{1 GameFrame}
	begin
	Change debug_ped_row = ($debug_ped_row + 1)
	formatText Checksumname = row 'Z_TestLevel_Peds_row%r' R = ($debug_ped_row)
	create Prefix = <row>
	if IsAlive Prefix = <row>
		break
	else
		Change \{debug_ped_row = -1}
	endif
	repeat
endscript

script back_to_changehighway_menu 
	create_changehighway_menu
endscript

script destroy_changehighway_menu 
	if ScreenelementExists \{Id = changehighway_scrolling_menu}
		DestroyScreenelement \{Id = changehighway_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_changeguitar_menu \{Type = GUITAR}
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = changeguitar_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = changeguitar_scrolling_menu Id = changeguitar_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_settings_menu}}]}
	get_musician_instrument_size
	array_count = 0
	begin
	get_musician_instrument_struct Index = <array_count>
	if (<Type> = (<info_struct>.Type))
		Printf "Creating %i" I = (<info_struct>.Name)
		createScreenElement {
			Type = textElement
			PARENT = changeguitar_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = (<info_struct>.Name)
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose select_guitar Params = {GUITAR = <array_count> Type = <Type>}}
			]
		}
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = changeguitar_vmenu}
endscript

script back_to_changeguitar_menu 
	create_changeguitar_menu
endscript

script destroy_changeguitar_menu 
	if ScreenelementExists \{Id = changeguitar_scrolling_menu}
		DestroyScreenelement \{Id = changeguitar_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_guitar \{Type = GUITAR}
	ui_menu_select_sfx
	kill_gem_scroller
	if (<Type> = GUITAR)
		get_musician_instrument_struct Index = <GUITAR>
		Change StructureName = player1_status instrument_id = (<info_struct>.desc_id)
	else
		get_musician_instrument_struct Index = <GUITAR>
		Change current_bass_model = (<info_struct>.desc_id)
	endif
	select_start_song
endscript
HideByType_List = [
	'real_crowd'
	'stage'
	'scene_ped'
]
HideByType_Visible = [
	On
	On
	On
]

script create_togglevisibility_menu 
	ui_menu_select_sfx
	destroy_settings_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = togglevisibility_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = togglevisibility_scrolling_menu Id = togglevisibility_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_settings_menu}}]}
	createScreenElement \{Type = textElement PARENT = togglevisibility_vmenu Id = toggle_bandvisible_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle band" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_bandvisible}]}
	toggle_bandvisible_setprop
	getArraySize \{$HideByType_List}
	array_count = 0
	begin
	formatText Checksumname = type_checksum '%s' S = ($HideByType_List [<array_count>])
	formatText Checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' S = ($HideByType_List [<array_count>])
	createScreenElement {
		Type = textElement
		PARENT = togglevisibility_vmenu
		Id = <menuitem_checksum>
		font = text_A1
		scale = 0.75
		rgba = [210 210 210 250]
		Text = ""
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose toggle_hidebytype Params = {Type = type_checksum array_count = <array_count>}}
		]
	}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	toggle_hidebytype_setprop
	createScreenElement \{Type = textElement PARENT = togglevisibility_vmenu Id = toggle_highway_menuitem font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Toggle highway" z_priority = 100.0 just = [Left top] event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose toggle_highway}]}
	toggle_highway_setprop
	launchevent \{Type = focus Target = togglevisibility_vmenu}
endscript

script back_to_togglevisibility_menu 
	create_togglevisibility_menu
endscript

script destroy_togglevisibility_menu 
	if ScreenelementExists \{Id = togglevisibility_scrolling_menu}
		DestroyScreenelement \{Id = togglevisibility_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript
highwayvisible = On

script toggle_highway 
	ui_menu_select_sfx
	if ($highwayvisible = OFF)
		if ScreenelementExists \{Id = gem_containerp1}
			DoScreenElementMorph \{Id = gem_containerp1 Alpha = 1}
		endif
		if ScreenelementExists \{Id = gem_containerp2}
			DoScreenElementMorph \{Id = gem_containerp2 Alpha = 1}
		endif
		enable_highway_prepass
		Change \{highwayvisible = On}
	else
		if ScreenelementExists \{Id = gem_containerp1}
			DoScreenElementMorph \{Id = gem_containerp1 Alpha = 0}
		endif
		if ScreenelementExists \{Id = gem_containerp2}
			DoScreenElementMorph \{Id = gem_containerp2 Alpha = 0}
		endif
		disable_highway_prepass
		Change \{highwayvisible = OFF}
	endif
	toggle_highway_setprop
endscript

script toggle_highway_setprop 
	if ($highwayvisible = OFF)
		toggle_highway_menuitem :SetProps \{Text = "Toggle highway : off"}
	else
		toggle_highway_menuitem :SetProps \{Text = "Toggle highway : on"}
	endif
endscript
bandvisible = On

script toggle_bandvisible 
	ui_menu_select_sfx
	if ($bandvisible = OFF)
		Change \{bandvisible = On}
	else
		Change \{bandvisible = OFF}
	endif
	set_bandvisible
	toggle_bandvisible_setprop
endscript

script set_bandvisible 
	if ($bandvisible = OFF)
		if compositeObjectexists \{GUITARIST}
			GUITARIST :Hide
		endif
		if compositeObjectexists \{VOCALIST}
			VOCALIST :Hide
		endif
		if compositeObjectexists \{BASSIST}
			BASSIST :Hide
		endif
		if compositeObjectexists \{DRUMMER}
			DRUMMER :Hide
		endif
	else
		if compositeObjectexists \{GUITARIST}
			GUITARIST :Unhide
		endif
		if compositeObjectexists \{VOCALIST}
			VOCALIST :Unhide
		endif
		if compositeObjectexists \{BASSIST}
			BASSIST :Unhide
		endif
		if compositeObjectexists \{DRUMMER}
			DRUMMER :Unhide
		endif
	endif
endscript

script toggle_bandvisible_setprop 
	if ($bandvisible = OFF)
		toggle_bandvisible_menuitem :SetProps \{Text = "Toggle band : off"}
	else
		toggle_bandvisible_menuitem :SetProps \{Text = "Toggle band : on"}
	endif
endscript

script toggle_hidebytype 
	ui_menu_select_sfx
	if (($HideByType_Visible [<array_count>]) = OFF)
		setarrayelement Arrayname = HideByType_Visible globalArray Index = <array_count> NewValue = On
	else
		setarrayelement Arrayname = HideByType_Visible globalArray Index = <array_count> NewValue = OFF
	endif
	set_hidebytype
	toggle_hidebytype_setprop
endscript

script set_hidebytype 
	getArraySize \{$HideByType_List}
	array_count = 0
	begin
	formatText Checksumname = type_checksum '%s' S = ($HideByType_List [<array_count>])
	if (($HideByType_Visible [<array_count>]) = OFF)
		HideObjectByType Type = <type_checksum>
	else
		HideObjectByType Type = <type_checksum> Unhide
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script toggle_hidebytype_setprop 
	getArraySize \{$HideByType_List}
	array_count = 0
	begin
	if (($HideByType_Visible [<array_count>]) = OFF)
		formatText Textname = menutext "Toggle %s : off" S = ($HideByType_List [<array_count>])
	else
		formatText Textname = menutext "Toggle %s : on" S = ($HideByType_List [<array_count>])
	endif
	formatText Checksumname = menuitem_checksum 'toggle_hidebytype_menuitem_%s' S = ($HideByType_List [<array_count>])
	<menuitem_checksum> :SetProps Text = <menutext>
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script create_skipintosong_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = skipintosong_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (20.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = skipintosong_scrolling_menu Id = skipintosong_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_debug_menu}}]}
	createScreenElement \{Type = textElement PARENT = skipintosong_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Skip By Time" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbytime_menu}]}
	createScreenElement \{Type = textElement PARENT = skipintosong_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Skip By Marker" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbymarker_menu}]}
	createScreenElement \{Type = textElement PARENT = skipintosong_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Skip By Measure" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbymeasure_menu}]}
	createScreenElement \{Type = textElement PARENT = skipintosong_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Set Loop Point" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_looppoint_menu}]}
	launchevent \{Type = focus Target = skipintosong_vmenu}
endscript

script back_to_skipintosong_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	destroy_looppoint_menu
	create_skipintosong_menu
endscript

script destroy_skipintosong_menu 
	if ScreenelementExists \{Id = skipintosong_scrolling_menu}
		DestroyScreenelement \{Id = skipintosong_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbytime_menu 
	ui_menu_select_sfx
	if gotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = skipbytime_scrolling_menu
		just = [Left top]
		Dims = (400.0, 250.0)
		pos = ($Menu_pos + (70.0, 0.0))
	}
	createScreenElement {
		Type = VMenu
		PARENT = skipbytime_scrolling_menu
		Id = skipbytime_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back generic_menu_pad_back Params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotParam \{looppoint}
		menu_func = set_looppoint
		createScreenElement {
			Type = textElement
			PARENT = skipbytime_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = "No Loop Point"
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> Params = {startTime = -1000000}}
			]
		}
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = fretbar_array '%s_fretbars' S = <song_prefix> AddToStringLookup
	getArraySize $<fretbar_array>
	max_time = (($<fretbar_array> [(<array_Size> - 1)]) / 1000)
	current_time = 0
	begin
	formatText Textname = menu_itemname "Time %ss" S = <current_time>
	if (<current_time> < <max_time>)
		createScreenElement {
			Type = textElement
			PARENT = skipbytime_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <menu_itemname>
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> Params = {song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = (<current_time> * 1000)}}
			]
		}
	else
		break
	endif
	current_time = (<current_time> + 5)
	repeat
	launchevent \{Type = focus Target = skipbytime_vmenu}
endscript

script back_to_skipbytime_menu 
	create_skipbytime_menu
endscript

script destroy_skipbytime_menu 
	if ScreenelementExists \{Id = skipbytime_scrolling_menu}
		DestroyScreenelement \{Id = skipbytime_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymarker_menu 
	ui_menu_select_sfx
	if gotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = skipbymarker_scrolling_menu
		just = [Left top]
		Dims = (400.0, 250.0)
		pos = ($Menu_pos + (30.0, 0.0))
	}
	createScreenElement {
		Type = VMenu
		PARENT = skipbymarker_scrolling_menu
		Id = skipbymarker_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back generic_menu_pad_back Params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotParam \{looppoint}
		menu_func = set_looppoint
		createScreenElement {
			Type = textElement
			PARENT = skipbymarker_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = "No Loop Point"
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> Params = {startTime = -1000000}}
			]
		}
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = marker_array '%s_markers' S = <song_prefix>
	getArraySize $<marker_array>
	if (<array_Size> = 0)
		createScreenElement {
			Type = textElement
			PARENT = skipbymarker_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = "start"
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> Params = {song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = -1000000}}
			]
		}
	else
		marker_count = 0
		begin
		formatText Textname = menu_itemname "%m (%ss)" M = ($<marker_array> [<marker_count>].marker) S = (($<marker_array> [<marker_count>].Time) / 1000)
		createScreenElement {
			Type = textElement
			PARENT = skipbymarker_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = <menu_itemname>
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose restart_gem_scroller Params = {song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = ($<marker_array> [<marker_count>].Time) startmarker = <marker_count>}}
			]
		}
		marker_count = (<marker_count> + 1)
		repeat <array_Size>
	endif
	launchevent \{Type = focus Target = skipbymarker_vmenu}
endscript

script back_to_skipbymarker_menu 
	create_skipbymarker_menu
endscript

script destroy_skipbymarker_menu 
	if ScreenelementExists \{Id = skipbymarker_scrolling_menu}
		DestroyScreenelement \{Id = skipbymarker_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_skipbymeasure_menu 
	ui_menu_select_sfx
	if gotParam \{looppoint}
		destroy_looppoint_menu
		callback = back_to_looppoint_menu
	else
		destroy_skipintosong_menu
		callback = back_to_skipintosong_menu
	endif
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = skipbymeasure_scrolling_menu
		just = [Left top]
		Dims = (400.0, 250.0)
		pos = ($Menu_pos + (-30.0, 0.0))
	}
	createScreenElement {
		Type = VMenu
		PARENT = skipbymeasure_scrolling_menu
		Id = skipbymeasure_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back generic_menu_pad_back Params = {callback = <callback>}}
		]
	}
	menu_func = select_start_song
	if gotParam \{looppoint}
		menu_func = set_looppoint
		createScreenElement {
			Type = textElement
			PARENT = skipbymeasure_vmenu
			font = text_A1
			scale = 0.75
			rgba = [210 210 210 250]
			Text = "No Loop Point"
			just = [Left top]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose <menu_func> Params = {startTime = -1000000}}
			]
		}
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = fretbar_array '%s_fretbars' S = <song_prefix> AddToStringLookup
	formatText Checksumname = timesig '%s_timesig' S = <song_prefix> AddToStringLookup
	getArraySize $<timesig>
	timesig_entry = 0
	timesig_size = <array_Size>
	timesig_num = 0
	measure_count = 0
	getArraySize $<fretbar_array>
	array_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (<measure_count> > 150)
		measures_per_menuitem = 2
	else
		measures_per_menuitem = 1
	endif
	timesig_entry = 0
	measure_count = 0
	array_entry = 0
	fretbar_count = 0
	measures_per_menuitem_count = 0
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<fretbar_array> [<array_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		measures_per_menuitem_count = (<measures_per_menuitem_count> + 1)
		if (<measures_per_menuitem_count> = <measures_per_menuitem>)
			Time = ($<fretbar_array> [(<array_entry>)])
			formatText Textname = menu_itemname "Measure %m (%ss)" S = (<Time> / 1000.0) M = <measure_count>
			Printf "%m" M = <menu_itemname>
			createScreenElement {
				Type = textElement
				PARENT = skipbymeasure_vmenu
				font = text_A1
				scale = 0.75
				rgba = [210 210 210 250]
				Text = <menu_itemname>
				just = [Left top]
				z_priority = 100.0
				event_handlers = [
					{focus menu_focus}
					{unfocus menu_unfocus}
					{pad_choose <menu_func> Params = {song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) startTime = <Time>}}
				]
			}
			measures_per_menuitem_count = 0
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	launchevent \{Type = focus Target = skipbymeasure_vmenu}
endscript

script back_to_skipbymeasure_menu 
	create_skipbymeasure_menu
endscript

script destroy_skipbymeasure_menu 
	if ScreenelementExists \{Id = skipbymeasure_scrolling_menu}
		DestroyScreenelement \{Id = skipbymeasure_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script create_looppoint_menu 
	ui_menu_select_sfx
	destroy_skipintosong_menu
	create_generic_backdrop
	createScreenElement {
		Type = VScrollingMenu
		PARENT = pause_menu
		Id = looppoint_scrolling_menu
		just = [Left top]
		Dims = (400.0, 480.0)
		pos = ($Menu_pos + (20.0, 0.0))
	}
	createScreenElement \{Type = VMenu PARENT = looppoint_scrolling_menu Id = looppoint_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_skipintosong_menu}}]}
	createScreenElement \{Type = textElement PARENT = looppoint_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Loop By Time" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbytime_menu Params = {looppoint}}]}
	createScreenElement \{Type = textElement PARENT = looppoint_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Loop By Marker" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbymarker_menu Params = {looppoint}}]}
	createScreenElement \{Type = textElement PARENT = looppoint_vmenu font = text_A1 scale = 0.75 rgba = [210 210 210 250] Text = "Loop By Measure" just = [Left top] z_priority = 100.0 event_handlers = [{focus menu_focus}{unfocus menu_unfocus}{pad_choose create_skipbymeasure_menu Params = {looppoint}}]}
	launchevent \{Type = focus Target = looppoint_vmenu}
endscript

script back_to_looppoint_menu 
	destroy_skipbytime_menu
	destroy_skipbymarker_menu
	destroy_skipbymeasure_menu
	create_looppoint_menu
endscript

script destroy_looppoint_menu 
	if ScreenelementExists \{Id = looppoint_scrolling_menu}
		DestroyScreenelement \{Id = looppoint_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script set_looppoint 
	ui_menu_select_sfx
	Change current_looppoint = <startTime>
	gh3_start_pressed
endscript

script create_replay_menu 
	ui_menu_select_sfx
	destroy_debugging_menu
	create_generic_backdrop
	x_pos = 450
	createScreenElement \{Type = VScrollingMenu PARENT = pause_menu Id = replay_scrolling_menu just = [Left top] Dims = (400.0, 250.0) pos = (450.0, 120.0)}
	createScreenElement \{Type = VMenu PARENT = replay_scrolling_menu Id = replay_vmenu pos = (0.0, 0.0) just = [Left top] event_handlers = [{pad_up generic_menu_up_or_down_sound Params = {Up}}{pad_down generic_menu_up_or_down_sound Params = {Down}}{pad_back generic_menu_pad_back Params = {callback = back_to_debug_menu}}]}
	StartWildcardSearch \{wildcard = 'buffers\\*.rep'}
	Index = 0
	begin
	if NOT GetWildcardFile
		break
	endif
	createScreenElement {
		Type = textElement
		PARENT = replay_vmenu
		font = text_A1
		scale = 0.75
		rgba = [210 210 210 250]
		Text = <basename>
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose restart_gem_scroller Params = {replay = <FileName> song_name = "blah" DIFFICULTY = "blah" difficulty2 = "blah"}}
		]
	}
	<Index> = (<Index> + 1)
	repeat
	EndWildcardSearch
	launchevent \{Type = focus Target = replay_vmenu}
endscript

script destroy_replay_menu 
	if ScreenelementExists \{Id = replay_scrolling_menu}
		DestroyScreenelement \{Id = replay_scrolling_menu}
	endif
	destroy_generic_backdrop
endscript

script select_start_song 
	Change \{current_transition = debugintro}
	Spawnscriptlater start_song Params = <...>
	switch ($game_mode)
		case p1_career
		ui_flow_manager_respond_to_action \{action = set_p1_career}
		case p2_career
		ui_flow_manager_respond_to_action \{action = set_p2_career}
		case p1_quickplay
		ui_flow_manager_respond_to_action \{action = set_p1_quickplay}
		case p2_faceoff
		case p2_battle
		case p2_pro_faceoff
		ui_flow_manager_respond_to_action \{action = set_p2_general}
		case training
		ui_flow_manager_respond_to_action \{action = set_p1_training}
	endswitch
	destroy_all_debug_menus
endscript

script ui_menu_scroll_sfx 
	Soundevent \{Event = ui_sfx_scroll}
	Soundevent \{Event = ui_sfx_scroll_add}
endscript

script ui_menu_select_sfx 
	Soundevent \{Event = ui_sfx_select}
endscript

script menu_focus 
	getTags
	printStruct <...>
	setScreenElementProps Id = <Id> rgba = [210 130 0 250]
endscript

script menu_unfocus 
	getTags
	setScreenElementProps Id = <Id> rgba = [210 210 210 250]
endscript
debug_menu_mode = 1

script switch_to_retail_menu 
	destroy_all_debug_menus
	Change debug_menu_mode = (0)
	start_flow_manager
endscript

script switch_to_debug_menu 
	shut_down_flow_manager
	Change debug_menu_mode = (1)
	destroy_all_debug_menus
	create_debugging_menu
endscript

script back_to_retail_ui_flow 
	destroy_debugging_menu
	ui_flow_manager_respond_to_action \{action = go_back}
	enable_pause
endscript

script toggle_global 
	printStruct <...>
	if gotParam \{global_toggle}
		if ($<global_toggle> = 1)
			Change globalName = <global_toggle> NewValue = 0
		else
			Change globalName = <global_toggle> NewValue = 1
		endif
	endif
endscript
