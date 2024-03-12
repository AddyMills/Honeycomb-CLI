menu_choose_practice_section_font = fontgrid_title_gh3
menu_choose_practice_section_index = 0
menu_choose_practice_section_base = 0
menu_choose_practice_section_num_entries = 8
menu_choose_practice_section_num_song_entries = 8
menu_choose_practice_section_entry_width = 280
menu_choose_practice_section_start_text = "SELECT START SECTION"
menu_choose_practice_section_end_text = "SELECT END SECTION"
menu_choose_practice_section_inactive_color = [
	0
	0
	0
	80
]
menu_choose_practice_last_index = 0
menu_choose_practice_last_song = NONE
in_menu_choose_practice_section = 0

script create_choose_practice_section_menu 
	end_practice_song_slomo
	set_focus_color \{rgba = [255 255 255 255]}
	set_unfocus_color \{rgba = [0 0 0 255]}
	if ($menu_choose_practice_destroy_previous_menu = 0)
		launchevent \{Type = focus Target = cps_menu}
		return
	endif
	Change \{in_menu_choose_practice_section = 1}
	menu_music_off
	kill_start_key_binding
	Change \{menu_choose_practice_section_index = 0}
	Change \{menu_choose_practice_section_base = 0}
	start_Y = 347
	end_y = 731
	start_X = 640
	header_pos = (640.0, 100.0)
	createScreenElement \{Type = containerElement Id = cps_container PARENT = root_window pos = (0.0, 0.0)}
	practice_setup_bg
	createScreenElement {
		Type = textElement
		PARENT = ds_container
		Id = header
		pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 245.0))
		just = [Left top]
		z_priority = 2
		font = ($detailed_stats_font)
		Text = ($menu_choose_practice_section_start_text)
		rgba = [190 29 30 255]
		scale = (1.0, 1.75)
	}
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	num_entries = ($menu_choose_practice_section_num_entries)
	if ($menu_choose_practice_section_base = 0)
		if ((<array_Size> + 1) < ($menu_choose_practice_section_num_entries))
			num_entries = (<array_Size> + 1)
		endif
	endif
	Change menu_choose_practice_section_num_song_entries = <num_entries>
	total_height = (<end_y> - <start_Y>)
	individual_height = (<total_height> / ($menu_choose_practice_section_num_entries))
	total_width = ($menu_choose_practice_section_entry_width)
	entry_dims = ((1.0, 0.0) * <total_width> + (0.0, 1.0) * <individual_height>)
	entry = 0
	placement_pos = ((1.0, 0.0) * <start_X> + (0.0, 1.0) * <start_Y>)
	begin
	formatText Checksumname = entry_id 'entry_%d' D = <entry>
	createScreenElement {
		Type = textElement
		font = text_a4
		PARENT = ds_container
		Id = <entry_id>
		pos = (<placement_pos> - (0.0, 21.0))
		rgba = ($menu_unfocus_color)
		just = [Center top]
	}
	<placement_pos> = (<placement_pos> + (0.0, 1.0) * <individual_height>)
	<entry> = (<entry> + 1)
	repeat (<array_Size> + 1)
	createScreenElement {
		Type = spriteElement
		PARENT = root_window
		Id = cps_menu
		pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		rgba = [100 100 100 255]
		just = [Left top]
		z_priority = -1
		event_handlers = [
			{pad_up menu_choose_practice_section_input_up}
			{pad_down menu_choose_practice_section_input_down}
			{pad_choose menu_choose_practice_section_input_choose}
			{pad_back menu_choose_practice_section_input_back}
		]
		exclusive_device = ($primary_controller)
	}
	launchevent \{Type = focus Target = cps_menu}
	cps_menu :SetTags \{Stage = 1}
	highlight_width = ($right_column_x - $left_column_x + 50)
	Height = 48
	createScreenElement {
		Type = spriteElement
		Id = Highlight_Bar
		PARENT = ds_container
		pos = ((1.0, 0.0) * <start_X> + (0.0, 1.0) * <start_Y>)
		Dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <Height>)
		rgba = [130 0 0 100]
		just = [Center top]
	}
	Change \{current_practice_songpreview = NONE}
	Change target_practice_songpreview = ($current_song)
	Spawnscriptlater \{practice_songpreview_monitor}
	menu_choose_practice_section_refreshsongpreviewposition \{startindex = 0 endindex = -1}
	Change \{disable_menu_sounds = 1}
	if ($menu_choose_practice_last_song = $current_song)
		last_index = ($menu_choose_practice_last_index)
		begin
		if (<last_index> = ($menu_choose_practice_section_index + $menu_choose_practice_section_base))
			break
		endif
		launchevent \{Type = pad_down Target = cps_menu}
		repeat
	endif
	Change \{disable_menu_sounds = 0}
	menu_choose_practice_section_refresh_entries
	menu_choose_practice_section_refresh_highlight_bar
	Change menu_choose_practice_last_song = ($current_song)
	Change menu_choose_practice_last_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
endscript
in_destroy_choose_practice_section_menu = 0

script destroy_choose_practice_section_menu 
	if ($menu_choose_practice_destroy_previous_menu = 1)
		Change \{in_destroy_choose_practice_section_menu = 1}
		StopRendering
		clean_up_user_control_helpers
		destroy_menu \{menu_id = ds_container}
		destroy_menu \{menu_id = temp_ds_background}
		destroy_menu \{menu_id = continue_text}
		destroy_menu \{menu_id = detailed_stats_bg_container}
		destroy_menu \{menu_id = ds_spotlight}
		begin
		if ($practice_songpreview_changing = 0)
			break
		endif
		Wait \{1 GameFrame}
		repeat
		killspawnedScript \{Name = practice_songpreview_monitor}
		killspawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = NONE)
			end_song
			SongUnLoadFSBIfDownloaded
		endif
		destroy_menu \{menu_id = cps_container}
		destroy_menu \{menu_id = cps_menu}
		Change \{in_menu_choose_practice_section = 0}
		Change \{in_destroy_choose_practice_section_menu = 0}
		StartRendering
	endif
endscript
current_practice_songpreview_starttime = 0
target_practice_songpreview_starttime = 0
force_practice_songpreview_restart = 0
current_practice_songpreview_endtime = 10000
target_practice_songpreview_endtime = 0
current_practice_songpreview = NONE
target_practice_songpreview = NONE
practice_songpreview_changing = 0

script practice_songpreview_monitor 
	playing_song = 0
	begin
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		Song = ($target_practice_songpreview)
		startTime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		killspawnedScript \{Name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			SoundBussUnlock \{Guitar_Balance}
			SoundBussUnlock \{band_Balance}
			Setsoundbussparams \{band_Balance = {vol = -20} Time = 0.5}
			Setsoundbussparams \{Guitar_Balance = {vol = -20} Time = 0.5}
			SoundBussLock \{band_Balance}
			SoundBussLock \{Guitar_Balance}
			Wait \{0.5 Second}
		endif
		Change \{practice_songpreview_changing = 1}
		end_song
		playing_song = 0
		SongUnLoadFSBIfDownloaded
		preload_song song_name = <Song> startTime = <startTime> fadeintime = 1.0
		waitforpreload_song
		Change current_practice_songpreview = <Song>
		Change \{force_practice_songpreview_restart = 0}
		Change current_practice_songpreview_starttime = <startTime>
		Change current_practice_songpreview_endtime = <endtime>
		Change \{practice_songpreview_changing = 0}
		if ($current_practice_songpreview = $target_practice_songpreview &&
				$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
				$force_practice_songpreview_restart = 0)
			begin_song
			playing_song = 1
			SpawnScriptNOw \{practice_songpreview_fadeinandrepeat}
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	Wait \{0.5 Seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	Change \{force_practice_songpreview_restart = 1}
endscript

script menu_choose_practice_section_refresh_entries 
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	cps_menu :getTags
	entry = 0
	begin
	formatText Checksumname = entry_id 'entry_%d' D = <entry>
	if ScreenelementExists Id = <entry_id>
		if ((<entry> + ($menu_choose_practice_section_base)) = 0)
			setScreenElementProps Id = <entry_id> Text = "FULL SONG"
		else
			GetUppercaseString ((<song_section_array> [(<entry> - 1 + ($menu_choose_practice_section_base))]).marker)
			setScreenElementProps Id = <entry_id> Text = <UppercaseString>
		endif
		if (<Stage> = 2)
			if (($menu_choose_practice_section_base + <entry>) < <start_index> + 1)
				setScreenElementProps Id = <entry_id> rgba = ($menu_choose_practice_section_inactive_color)
			else
				setScreenElementProps Id = <entry_id> rgba = ($menu_unfocus_color)
			endif
		else
			setScreenElementProps Id = <entry_id> rgba = ($menu_unfocus_color)
			Change menu_choose_practice_last_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
		endif
	endif
	<entry> = (<entry> + 1)
	repeat (<array_Size> + 1)
	formatText Checksumname = entry_id 'entry_%d' D = ($menu_choose_practice_section_index)
	if ScreenelementExists Id = <entry_id>
		setScreenElementProps Id = <entry_id> rgba = ($menu_focus_color)
	endif
endscript

script menu_choose_practice_section_input_up 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	cps_menu :getTags
	move_down = 1
	do_sound = 1
	if (<Stage> = 1)
		if ($menu_choose_practice_section_index > 0)
			Change menu_choose_practice_section_index = ($menu_choose_practice_section_index - 1)
			elseif ($menu_choose_practice_section_base > 0)
			Change menu_choose_practice_section_base = ($menu_choose_practice_section_base - 1)
		else
			<do_sound> = 0
		endif
	else
		if ($menu_choose_practice_section_index > 0)
			if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) > <start_index>)
				Change menu_choose_practice_section_index = ($menu_choose_practice_section_index - 1)
			else
				<move_down> = 0
				<do_sound> = 0
			endif
		else
			if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) > <start_index>)
				Change menu_choose_practice_section_base = ($menu_choose_practice_section_base - 1)
			endif
		endif
	endif
	if (<do_sound>)
		generic_menu_up_or_down_sound
	endif
	menu_choose_practice_section_refresh_entries
	menu_choose_practice_section_refresh_highlight_bar
	if (<move_down> = 1)
		menu_detailed_stats_move_screen_down
	endif
endscript

script menu_choose_practice_section_input_down 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	if ($menu_choose_practice_section_index < (<array_Size>))
		Change menu_choose_practice_section_index = ($menu_choose_practice_section_index + 1)
		generic_menu_up_or_down_sound
	endif
	menu_choose_practice_section_refresh_entries
	menu_choose_practice_section_refresh_highlight_bar
	menu_detailed_stats_move_screen_up
endscript

script menu_choose_practice_section_input_choose 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	if ($transitions_locked = 0)
		launchevent \{Type = unfocus Target = cps_menu}
	endif
	generic_menu_pad_choose_sound
	cps_menu :getTags
	if (<Stage> = 1)
		if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) = 0)
			menu_choose_practice_section_play_full_song
		else
			cps_menu :SetTags start_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
			cps_menu :SetTags \{Stage = 2}
			header :SetProps Text = ($menu_choose_practice_section_end_text)
			menu_choose_practice_section_refresh_entries
			if ($transitions_locked = 0)
				launchevent \{Type = focus Target = cps_menu}
			endif
		endif
		elseif (<Stage> = 2)
		cps_menu :SetTags end_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base + 1)
		menu_choose_practice_section_set_times
		Change \{menu_choose_practice_destroy_previous_menu = 0}
		ui_flow_manager_respond_to_action \{action = Continue}
	endif
endscript

script menu_choose_practice_section_input_back 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	if ($transitions_locked = 0)
		launchevent \{Type = unfocus Target = cps_menu}
	endif
	cps_menu :getTags
	if (<Stage> = 1)
		Change \{menu_choose_practice_destroy_previous_menu = 1}
		ui_flow_manager_respond_to_action \{action = go_back}
		elseif (<Stage> = 2)
		cps_menu :SetTags \{Stage = 1}
		header :SetProps Text = ($menu_choose_practice_section_start_text)
		menu_choose_practice_section_refresh_entries
		menu_choose_practice_section_refresh_highlight_bar
		if ($transitions_locked = 0)
			launchevent \{Type = focus Target = cps_menu}
		endif
	endif
endscript

script menu_choose_practice_section_refresh_highlight_bar 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	cps_menu :getTags
	if (<Stage> = 1)
		formatText Checksumname = entry_id 'entry_%d' D = ($menu_choose_practice_section_index)
		if ScreenelementExists Id = <entry_id>
			getScreenElementProps Id = <entry_id>
			getScreenElementDims Id = <entry_id>
			highlight_width = ($right_column_x - $left_column_x + 50)
			Height = 48
			setScreenElementProps Id = Highlight_Bar pos = (<pos> + (0.0, 9.5)) Dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <Height>)
			startindex = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
			endindex = <startindex>
		else
			return
		endif
		elseif (<Stage> = 2)
		if (<start_index> < ($menu_choose_practice_section_base))
			highlight_start_index = 0
		else
			highlight_start_index = (<start_index> - $menu_choose_practice_section_base)
		endif
		formatText Checksumname = entry_id 'entry_%d' D = (<highlight_start_index>)
		getScreenElementProps Id = <entry_id>
		start_pos = (<pos> + (0.0, 9.5))
		formatText Checksumname = entry_id 'entry_%d' D = ($menu_choose_practice_section_index)
		getScreenElementProps Id = <entry_id>
		getScreenElementDims Id = <entry_id>
		Height = (<Height> + 5)
		dims_base = (<pos> - <start_pos> + (0.0, 4.0))
		highlight_width = ($right_column_x - $left_column_x + 50)
		Dims = (<dims_base> + (1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <Height>)
		setScreenElementProps Id = Highlight_Bar pos = <start_pos> Dims = <Dims>
		startindex = -1
		endindex = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
	endif
	menu_choose_practice_section_refreshsongpreviewposition startindex = <startindex> endindex = <endindex>
endscript

script menu_choose_practice_section_refreshsongpreviewposition 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	if (<startindex> = -1)
		elseif (<startindex> = 0)
		if (<array_Size> > 0)
			Change target_practice_songpreview_starttime = ((<song_section_array> [0]).Time)
		else
			Change \{target_practice_songpreview_starttime = 0}
		endif
		endindex = -1
	else
		Change target_practice_songpreview_starttime = ((<song_section_array> [(<startindex> - 1)]).Time)
	endif
	if (<endindex> = <array_Size> ||
			<endindex> = -1)
		setup_gemarrays song_name = ($current_song) DIFFICULTY = ($current_difficulty) player_status = player1_status
		get_song_end_time Song = ($current_song)
		Change target_practice_songpreview_endtime = <total_end_time>
	else
		Change target_practice_songpreview_endtime = ((<song_section_array> [<endindex>]).Time)
	endif
endscript

script menu_choose_practice_section_play_full_song 
	if ($transitions_locked = 0)
		launchevent \{Type = unfocus Target = cps_menu}
	endif
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	cps_menu :SetTags \{start_index = 1}
	cps_menu :SetTags end_index = (<array_Size> + 1)
	menu_choose_practice_section_set_times
	Change \{menu_choose_practice_destroy_previous_menu = 0}
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script menu_choose_practice_section_set_times 
	cps_menu :getTags
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	if (<array_Size> > 0)
		Change practice_start_time = ((<song_section_array> [(<start_index> - 1)]).Time)
		if (<end_index> = <array_Size> + 1)
			setup_gemarrays song_name = ($current_song) DIFFICULTY = ($current_difficulty) player_status = player1_status
			get_song_end_time Song = ($current_song)
			Change practice_end_time = <total_end_time>
		else
			Change practice_end_time = ((<song_section_array> [(<end_index> - 1)]).Time - 1)
		endif
	else
		Change \{practice_start_time = 0}
		Change \{practice_end_time = 0}
	endif
endscript

script practice_setup_bg 
	Change \{left_column_num_elements = 0}
	Change left_column_y_end = ($initial_column_y_end)
	Change \{center_column_num_elements = 0}
	Change center_column_y_end = ($initial_column_y_end)
	Change \{right_column_num_elements = 0}
	Change right_column_y_end = ($initial_column_y_end)
	Change \{relative_screen_y_position = 0}
	Change center_column_x = (($left_column_x) + (0.5 * ($right_column_x - $left_column_x)))
	detailed_stats_create_container \{for_practice = 1}
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	add_section_stats_and_desc {
		section_index = 0
		section_array = <song_section_array>
		Highlight = 1
		for_practice = 1
	}
	getArraySize (<song_section_array>)
	section_index = 0
	Highlight = 0
	if (<array_Size> > 0)
		begin
		add_section_stats_and_desc {
			section_index = <section_index>
			section_array = <song_section_array>
			Highlight = <Highlight>
			for_practice = 1
		}
		if (<Highlight> = 1)
			<Highlight> = 0
		else
			<Highlight> = 1
		endif
		<section_index> = (<section_index> + 1)
		repeat <array_Size>
	endif
	menu_detailed_stats_add_paper_sprites
	add_user_control_helper \{Text = "CONTINUE" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript
