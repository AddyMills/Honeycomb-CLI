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
menu_choose_practice_last_song = None
in_menu_choose_practice_section = 0

script create_choose_practice_section_menu 
	end_practice_song_slomo
	set_focus_color \{color = white}
	set_unfocus_color \{color = black}
	if ($menu_choose_practice_destroy_previous_menu = 0)
		LaunchEvent \{type = focus target = cps_menu}
		return
	endif
	change \{in_menu_choose_practice_section = 1}
	Menu_Music_Off
	kill_start_key_binding
	change \{menu_choose_practice_section_index = 0}
	change \{menu_choose_practice_section_base = 0}
	start_y = 347
	end_y = 731
	start_x = 640
	header_pos = (640.0, 100.0)
	CreateScreenElement \{type = ContainerElement id = cps_container parent = root_window Pos = (0.0, 0.0)}
	practice_setup_bg
	CreateScreenElement {
		type = TextElement
		parent = ds_container
		id = header
		Pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 245.0))
		just = [left top]
		z_priority = 2
		font = ($detailed_stats_font)
		text = ($menu_choose_practice_section_start_text)
		rgba = [190 29 30 255]
		Scale = (1.0, 1.75)
	}
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	num_entries = ($menu_choose_practice_section_num_entries)
	if ($menu_choose_practice_section_base = 0)
		if ((<array_size> + 1) < ($menu_choose_practice_section_num_entries))
			num_entries = (<array_size> + 1)
		endif
	endif
	change menu_choose_practice_section_num_song_entries = <num_entries>
	total_height = (<end_y> - <start_y>)
	individual_height = (<total_height> / ($menu_choose_practice_section_num_entries))
	total_width = ($menu_choose_practice_section_entry_width)
	entry_dims = ((1.0, 0.0) * <total_width> + (0.0, 1.0) * <individual_height>)
	entry = 0
	placement_pos = ((1.0, 0.0) * <start_x> + (0.0, 1.0) * <start_y>)
	begin
	FormatText checksumname = entry_id 'entry_%d' d = <entry>
	CreateScreenElement {
		type = TextElement
		font = text_a4
		parent = ds_container
		id = <entry_id>
		Pos = (<placement_pos> - (0.0, 21.0))
		rgba = ($menu_unfocus_color)
		just = [center top]
	}
	<placement_pos> = (<placement_pos> + (0.0, 1.0) * <individual_height>)
	<entry> = (<entry> + 1)
	repeat (<array_size> + 1)
	CreateScreenElement {
		type = SpriteElement
		parent = root_window
		id = cps_menu
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		rgba = [100 100 100 255]
		just = [left top]
		z_priority = -1
		event_handlers = [
			{pad_up menu_choose_practice_section_input_up}
			{pad_down menu_choose_practice_section_input_down}
			{pad_choose menu_choose_practice_section_input_choose}
			{pad_back menu_choose_practice_section_input_back}
		]
		exclusive_device = ($primary_controller)
	}
	LaunchEvent \{type = focus target = cps_menu}
	cps_menu :settags \{stage = 1}
	highlight_width = ($right_column_x - $left_column_x + 50)
	height = 48
	CreateScreenElement {
		type = SpriteElement
		id = highlight_bar
		parent = ds_container
		Pos = ((1.0, 0.0) * <start_x> + (0.0, 1.0) * <start_y>)
		dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <height>)
		rgba = [130 0 0 100]
		just = [center top]
	}
	change \{current_practice_songpreview = None}
	change target_practice_songpreview = ($current_song)
	SpawnScriptLater \{practice_songpreview_monitor}
	menu_choose_practice_section_refreshsongpreviewposition \{startindex = 0 endindex = -1}
	change \{disable_menu_sounds = 1}
	if ($menu_choose_practice_last_song = $current_song)
		last_index = ($menu_choose_practice_last_index)
		begin
		if (<last_index> = ($menu_choose_practice_section_index + $menu_choose_practice_section_base))
			break
		endif
		LaunchEvent \{type = pad_down target = cps_menu}
		repeat
	endif
	change \{disable_menu_sounds = 0}
	menu_choose_practice_section_refresh_entries
	menu_choose_practice_section_refresh_highlight_bar
	change menu_choose_practice_last_song = ($current_song)
	change menu_choose_practice_last_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
endscript

script GetMarkerArraySize 
	GetArraySize <array>
	if (<array_size> > 0)
		if (<array> [(<array_size> - 1)].marker = "_ENDOFSONG")
			return array_size = (<array_size> - 1)
		else
			return array_size = <array_size>
		endif
	else
		return array_size = <array_size>
	endif
endscript
in_destroy_choose_practice_section_menu = 0

script destroy_choose_practice_section_menu 
	if ($menu_choose_practice_destroy_previous_menu = 1)
		change \{in_destroy_choose_practice_section_menu = 1}
		stoprendering
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
		wait \{1 gameframe}
		repeat
		KillSpawnedScript \{name = practice_songpreview_monitor}
		KillSpawnedScript \{name = practice_songpreview_fadeinandrepeat}
		if NOT ($current_practice_songpreview = None)
			end_song
			SongUnLoadFSBIfDownloaded
		endif
		destroy_menu \{menu_id = cps_container}
		destroy_menu \{menu_id = cps_menu}
		change \{in_menu_choose_practice_section = 0}
		change \{in_destroy_choose_practice_section_menu = 0}
		startrendering
	endif
endscript
current_practice_songpreview_starttime = 0
target_practice_songpreview_starttime = 0
force_practice_songpreview_restart = 0
current_practice_songpreview_endtime = 10000
target_practice_songpreview_endtime = 0
current_practice_songpreview = None
target_practice_songpreview = None
practice_songpreview_changing = 0

script practice_songpreview_monitor 
	playing_song = 0
	begin
	skip_wait = 0
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		song = ($target_practice_songpreview)
		starttime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		KillSpawnedScript \{name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			soundbussunlock \{Guitar_Balance}
			soundbussunlock \{Band_Balance}
			setsoundbussparams \{Band_Balance = {vol = -20} time = 0.5}
			setsoundbussparams \{Guitar_Balance = {vol = -20} time = 0.5}
			SoundBussLock \{Band_Balance}
			SoundBussLock \{Guitar_Balance}
			wait \{0.5 second}
		endif
		change \{practice_songpreview_changing = 1}
		end_song
		playing_song = 0
		if ($shutdown_game_for_signin_change_flag = 0)
			SongUnLoadFSBIfDownloaded
			preload_song song_name = <song> starttime = <starttime> fadeintime = 1.0
			waitforpreload_song
			change current_practice_songpreview = <song>
			change \{force_practice_songpreview_restart = 0}
			change current_practice_songpreview_starttime = <starttime>
			change current_practice_songpreview_endtime = <endtime>
			change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0)
				begin_song
				playing_song = 1
				spawnscriptnow \{practice_songpreview_fadeinandrepeat}
			else
				skip_wait = 1
			endif
		endif
	endif
	if (<skip_wait> = 0)
		wait \{1 gameframe}
	endif
	repeat
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	wait \{0.5 seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	change \{force_practice_songpreview_restart = 1}
endscript

script menu_choose_practice_section_refresh_entries 
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	cps_menu :gettags
	entry = 0
	begin
	FormatText checksumname = entry_id 'entry_%d' d = <entry>
	if ScreenElementExists id = <entry_id>
		if ((<entry> + ($menu_choose_practice_section_base)) = 0)
			SetScreenElementProps id = <entry_id> text = "ALL SECTIONS"
		else
			GetUpperCaseString ((<song_section_array> [(<entry> - 1 + ($menu_choose_practice_section_base))]).marker)
			SetScreenElementProps id = <entry_id> text = <uppercasestring>
		endif
		if (<stage> = 2)
			if (($menu_choose_practice_section_base + <entry>) < <start_index> + 1)
				SetScreenElementProps id = <entry_id> rgba = ($menu_choose_practice_section_inactive_color)
			else
				SetScreenElementProps id = <entry_id> rgba = ($menu_unfocus_color)
			endif
		else
			SetScreenElementProps id = <entry_id> rgba = ($menu_unfocus_color)
			change menu_choose_practice_last_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
		endif
	endif
	<entry> = (<entry> + 1)
	repeat (<array_size> + 1)
	FormatText checksumname = entry_id 'entry_%d' d = ($menu_choose_practice_section_index)
	if ScreenElementExists id = <entry_id>
		SetScreenElementProps id = <entry_id> rgba = ($menu_focus_color)
	endif
endscript

script menu_choose_practice_section_input_up 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	cps_menu :gettags
	move_down = 1
	do_sound = 1
	if (<stage> = 1)
		if ($menu_choose_practice_section_index > 0)
			change menu_choose_practice_section_index = ($menu_choose_practice_section_index - 1)
			elseif ($menu_choose_practice_section_base > 0)
			change menu_choose_practice_section_base = ($menu_choose_practice_section_base - 1)
		else
			<do_sound> = 0
		endif
	else
		if ($menu_choose_practice_section_index > 0)
			if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) > <start_index>)
				change menu_choose_practice_section_index = ($menu_choose_practice_section_index - 1)
			else
				<move_down> = 0
				<do_sound> = 0
			endif
		else
			if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) > <start_index>)
				change menu_choose_practice_section_base = ($menu_choose_practice_section_base - 1)
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
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	if ($menu_choose_practice_section_index < (<array_size>))
		change menu_choose_practice_section_index = ($menu_choose_practice_section_index + 1)
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
		LaunchEvent \{type = unfocus target = cps_menu}
	endif
	generic_menu_pad_choose_sound
	cps_menu :gettags
	if (<stage> = 1)
		if (($menu_choose_practice_section_index + $menu_choose_practice_section_base) = 0)
			menu_choose_practice_section_play_full_song
		else
			cps_menu :settags start_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
			cps_menu :settags \{stage = 2}
			header :setprops text = ($menu_choose_practice_section_end_text)
			menu_choose_practice_section_refresh_entries
			if ($transitions_locked = 0)
				LaunchEvent \{type = focus target = cps_menu}
			endif
		endif
		elseif (<stage> = 2)
		cps_menu :settags end_index = ($menu_choose_practice_section_index + $menu_choose_practice_section_base + 1)
		menu_choose_practice_section_set_times
		change \{menu_choose_practice_destroy_previous_menu = 0}
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript

script menu_choose_practice_section_input_back 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	if ($transitions_locked = 0)
		LaunchEvent \{type = unfocus target = cps_menu}
	endif
	SoundEvent \{event = Generic_menu_back_SFX}
	cps_menu :gettags
	if (<stage> = 1)
		change \{menu_choose_practice_destroy_previous_menu = 1}
		ui_flow_manager_respond_to_action \{action = go_back}
		elseif (<stage> = 2)
		cps_menu :settags \{stage = 1}
		header :setprops text = ($menu_choose_practice_section_start_text)
		menu_choose_practice_section_refresh_entries
		menu_choose_practice_section_refresh_highlight_bar
		if ($transitions_locked = 0)
			LaunchEvent \{type = focus target = cps_menu}
		endif
	endif
endscript

script menu_choose_practice_section_refresh_highlight_bar 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	cps_menu :gettags
	if (<stage> = 1)
		FormatText checksumname = entry_id 'entry_%d' d = ($menu_choose_practice_section_index)
		if ScreenElementExists id = <entry_id>
			GetScreenElementProps id = <entry_id>
			GetScreenElementDims id = <entry_id>
			highlight_width = ($right_column_x - $left_column_x + 50)
			height = 48
			SetScreenElementProps id = highlight_bar Pos = (<Pos> + (0.0, 9.5)) dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <height>)
			startindex = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
			endindex = <startindex>
		else
			return
		endif
		elseif (<stage> = 2)
		if (<start_index> < ($menu_choose_practice_section_base))
			highlight_start_index = 0
		else
			highlight_start_index = (<start_index> - $menu_choose_practice_section_base)
		endif
		FormatText checksumname = entry_id 'entry_%d' d = (<highlight_start_index>)
		GetScreenElementProps id = <entry_id>
		start_pos = (<Pos> + (0.0, 9.5))
		FormatText checksumname = entry_id 'entry_%d' d = ($menu_choose_practice_section_index)
		GetScreenElementProps id = <entry_id>
		GetScreenElementDims id = <entry_id>
		height = (<height> + 5)
		dims_base = (<Pos> - <start_pos> + (0.0, 4.0))
		highlight_width = ($right_column_x - $left_column_x + 50)
		dims = (<dims_base> + (1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <height>)
		SetScreenElementProps id = highlight_bar Pos = <start_pos> dims = <dims>
		startindex = -1
		endindex = ($menu_choose_practice_section_index + $menu_choose_practice_section_base)
	endif
	menu_choose_practice_section_refreshsongpreviewposition startindex = <startindex> endindex = <endindex>
endscript

script menu_choose_practice_section_refreshsongpreviewposition 
	if ($in_destroy_choose_practice_section_menu = 1)
		return
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	if (<startindex> = -1)
		elseif (<startindex> = 0)
		if (<array_size> > 0)
			change target_practice_songpreview_starttime = ((<song_section_array> [0]).time)
		else
			change \{target_practice_songpreview_starttime = 0}
		endif
		endindex = -1
	else
		change target_practice_songpreview_starttime = ((<song_section_array> [(<startindex> - 1)]).time)
	endif
	if (<endindex> = <array_size> ||
			<endindex> = -1)
		setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
		get_song_end_time song = ($current_song) for_practice = 1
		change target_practice_songpreview_endtime = <total_end_time>
	else
		change target_practice_songpreview_endtime = ((<song_section_array> [<endindex>]).time)
	endif
endscript

script menu_choose_practice_section_play_full_song 
	if ($transitions_locked = 0)
		LaunchEvent \{type = unfocus target = cps_menu}
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	cps_menu :settags \{start_index = 1}
	cps_menu :settags end_index = (<array_size> + 1)
	menu_choose_practice_section_set_times
	change \{menu_choose_practice_destroy_previous_menu = 0}
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_choose_practice_section_set_times 
	cps_menu :gettags
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	GetMarkerArraySize array = (<song_section_array>)
	if (<array_size> > 0)
		change practice_start_time = ((<song_section_array> [(<start_index> - 1)]).time)
		if (<end_index> = <array_size> + 1)
			setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			change practice_end_time = <total_end_time>
		else
			change practice_end_time = ((<song_section_array> [(<end_index> - 1)]).time - 1)
		endif
	else
		change \{practice_start_time = 0}
		change \{practice_end_time = 0}
	endif
endscript

script practice_setup_bg 
	change \{left_column_num_elements = 0}
	change left_column_y_end = ($initial_column_y_end)
	change \{center_column_num_elements = 0}
	change center_column_y_end = ($initial_column_y_end)
	change \{right_column_num_elements = 0}
	change right_column_y_end = ($initial_column_y_end)
	change \{relative_screen_y_position = 0}
	change center_column_x = (($left_column_x) + (0.5 * ($right_column_x - $left_column_x)))
	detailed_stats_create_container \{for_practice = 1}
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_section_array '%s_markers' s = <song_prefix>
	add_section_stats_and_desc {
		section_index = 0
		section_array = <song_section_array>
		highlight = 1
		for_practice = 1
	}
	GetMarkerArraySize array = (<song_section_array>)
	section_index = 0
	highlight = 0
	if (<array_size> > 0)
		begin
		add_section_stats_and_desc {
			section_index = <section_index>
			section_array = <song_section_array>
			highlight = <highlight>
			for_practice = 1
		}
		if (<highlight> = 1)
			<highlight> = 0
		else
			<highlight> = 1
		endif
		<section_index> = (<section_index> + 1)
		repeat <array_size>
	endif
	menu_detailed_stats_add_paper_sprites
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
endscript
