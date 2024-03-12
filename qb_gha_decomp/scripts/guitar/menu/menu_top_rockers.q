tr_max_band_characters = 14
num_top_scores = 5
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	disable_pause
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = tr_container
		Pos = (0.0, 0.0)}
	menu_top_rockers_create_poster
	new_score = -1
	if (<for_options> = 0)
		menu_top_rockers_check_for_new_top_score
	endif
	menu_top_rockers_create_paper highlight_index = (<new_score> + 1)
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = "SELECT" button = green z = 100}
		add_user_control_helper \{text = "DELETE" button = red z = 100}
		add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
		add_user_control_helper \{text = "ACCEPT" button = start z = 100}
	else
		menu_top_rockers_create_continue_button
		add_user_control_helper \{text = "CONTINUE" button = green z = 100}
		add_user_control_helper \{text = "CONTINUE" button = red z = 100}
		add_user_control_helper \{text = "CONTINUE" button = start z = 100}
	endif
endscript

script destroy_top_rockers_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = tr_container}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script menu_top_rockers_create_poster 
	displaySprite \{parent = tr_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	CreateScreenElement \{type = SpriteElement
		parent = tr_container
		texture = toprockers_poster
		Pos = (740.0, 30.0)
		just = [
			RIGHT
			top
		]
		dims = (620.0, 620.0)
		z_priority = 1.2
		rot_angle = -3}
	FormatText \{textname = Rockers_title
		"\\c5%T\\c0%R"
		t = "TOP"
		r = "ROCKERS"}
	CreateScreenElement {
		type = TextElement
		parent = tr_container
		Pos = (460.0, 610.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3
		text = <Rockers_title>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
endscript

script menu_top_rockers_create_paper 
	CreateScreenElement \{type = ContainerElement
		parent = tr_container
		id = tr_paper_container
		Pos = (630.0, 90.0)}
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	get_difficulty_text difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	song_title = <uppercasestring>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <uppercasestring>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_size> >= <max_characters>)
		new_song_text = ""
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = " ")
				printf \{"found space"}
				break
			endif
		endif
		repeat
		<song_title> = (<new_song_text> + "...")
		<max_width> = 270
	endif
	FormatText textname = song_diff_text "\\c1%s \\c5%d" s = <song_title> d = <difficulty_text>
	CreateScreenElement {
		type = TextElement
		parent = tr_container
		id = tr_song_name
		Pos = (435.0, 135.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3.5
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (370.0, 100.0) keep_ar = 1
	displaySprite \{parent = tr_container
		tex = Toprockers_Tape_1
		Pos = (500.0, -10.0)
		dims = (140.0, 70.0)
		z = 50}
	displaySprite \{parent = tr_container
		tex = Toprockers_Tape_2
		Pos = (280.0, 240.0)
		z = 50
		rot_angle = 90
		dims = (140.0, 70.0)}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 80.0)
	name_offset = (140.0, 7.0)
	bar_offset = (-100.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	FormatText checksumname = song_score_cs 'score%d' d = <score_val>
	FormatText textname = song_score_text "%s" s = (<...>.<song_score_cs>) usecommas
	FormatText checksumname = score_name_cs 'name%d' d = <score_val>
	FormatText textname = score_name_text "%s" s = (<...>.<score_name_cs>)
	FormatText textname = number_text "%n" n = <score_val>
	FormatText checksumname = song_score_id 'song_score%d' d = <score_val>
	FormatText checksumname = score_name_id 'score_name%d' d = <score_val>
	score_scale = (0.6, 0.8)
	rand = Random (@ 1 @ 2 )
	FormatText checksumname = bar_tex 'Toprockers_Bar_%d' d = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
	elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	bar_rgba = (($g_menu_colors).dk_violet_grey)
	text_rgba = [220 220 220 255]
	show_num = 1
	if (<score_val> = <highlight_index>)
		<bar_rgba> = [0 0 0 255]
		<text_rgba> = [190 160 30 255]
		<show_num> = 0
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (800.0, 45.0)
		alpha = 0.9
		<bar_flags>
	}
	if (<show_num> = 1)
		CreateScreenElement {
			Scale = 1.0
			type = TextElement
			parent = tr_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 17.0))
			z_priority = 1.3
			rgba = [0 0 0 255]
			just = [left bottom]
			text = <number_text>
			font = fontgrid_title_gh3
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = tr_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <skull_offset>)
			z_priority = 1.3
			rgba = [255 255 255 255]
			just = [left bottom]
			texture = Toprockers_Skull
			dims = (48.0, 48.0)
		}
	endif
	CreateScreenElement {
		Scale = <score_scale>
		type = TextElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
		id = <song_score_id>
	}
	fit_text_in_rectangle id = <id> dims = (65.0, 40.0) only_if_larger_x = 1
	CreateScreenElement {
		Scale = (0.8, 0.8)
		type = TextElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 3.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <score_name_text>
		font = fontgrid_title_gh3
		id = <score_name_id>
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = (135.0, 35.0) only_if_larger_x = 1 Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset>)
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<score_val> = (<score_val> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	CreateScreenElement {
		type = TextElement
		parent = root_window
		id = continue_button
		Scale = 0.9
		Pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
	}
	CreateScreenElement {
		type = TextElement
		parent = continue_button
		id = continue_text
		Scale = 0.8
		Pos = (40.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
			{pad_back ui_flow_manager_respond_to_action params = {action = continue}}
			{pad_start ui_flow_manager_respond_to_action params = {action = continue}}
		]
		exclusive_device = $primary_controller
	}
	LaunchEvent \{type = focus target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	if ($current_song = kingsandqueenscredits)
		return
	endif
	newbestscore = 0
	player_score = ($player1_status.Score)
	CastToInteger \{player_score}
	if ($game_mode = p2_quickplay)
		player_stars = (($player1_status.stars + $player2_status.stars) / 2)
	else
		player_stars = ($player1_status.stars)
	endif
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
		<player_score> = (<player_score> + ($player2_status.Score))
		CastToInteger \{player_score}
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	score_array = [0 0 0 0 0]
	name_array = ["" "" "" "" ""]
	stars_array = [0 0 0 0 0]
	score_index = 0
	begin
	FormatText checksumname = score_cs 'score%d' d = (<score_index> + 1)
	FormatText checksumname = name_cs 'name%d' d = (<score_index> + 1)
	FormatText checksumname = stars_cs 'stars%d' d = (<score_index> + 1)
	SetArrayElement arrayName = score_array index = <score_index> newValue = (<...>.<score_cs>)
	SetArrayElement arrayName = name_array index = <score_index> newValue = (<...>.<name_cs>)
	SetArrayElement arrayName = stars_array index = <score_index> newValue = (<...>.<stars_cs>)
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	<score_index> = 0
	new_score = -1
	begin
	if (<player_score> > (<score_array> [<score_index>]))
		<new_score> = <score_index>
		if (<nowrite> = 0)
			score_shift_index = ($num_top_scores - 2)
			if NOT (($num_top_scores - (<score_index> + 1)) = 0)
				begin
				SetArrayElement arrayName = score_array index = (<score_shift_index> + 1) newValue = (<score_array> [<score_shift_index>])
				SetArrayElement arrayName = name_array index = (<score_shift_index> + 1) newValue = (<name_array> [<score_shift_index>])
				SetArrayElement arrayName = stars_array index = (<score_shift_index> + 1) newValue = (<stars_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			if GotParam \{use_band_name}
				get_current_band_info
				GetGlobalTags <band_info> param = name
				SetArrayElement arrayName = name_array index = <score_index> newValue = <name>
			endif
			SetArrayElement arrayName = score_array index = <score_index> newValue = <player_score>
			SetArrayElement arrayName = stars_array index = <score_index> newValue = <player_stars>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		SetGlobalTags <songname> params = {bestscore = <bestscore>}
		SetGlobalTags <songname> params = {beststars = <beststars>}
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = 1
	endif
	SetGlobalTags <songname> params = {score1 = (<score_array> [0]) score2 = (<score_array> [1]) score3 = (<score_array> [2]) score4 = (<score_array> [3]) score5 = (<score_array> [4])}
	SetGlobalTags <songname> params = {name1 = (<name_array> [0]) name2 = (<name_array> [1]) name3 = (<name_array> [2]) name4 = (<name_array> [3]) name5 = (<name_array> [4])}
	SetGlobalTags <songname> params = {stars1 = (<stars_array> [0]) stars2 = (<stars_array> [1]) stars3 = (<stars_array> [2]) stars4 = (<stars_array> [3]) stars5 = (<stars_array> [4])}
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		change \{new_band_name = ["A" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""]}
		change \{default_band_indexes = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]}
		change \{new_band_index = 0}
		change \{tr_first_time_initialised = 1}
	endif
	SetScreenElementProps \{id = root_window event_handlers = [{pad_start null_script}] replace_handlers}
	event_handlers = [
		{pad_up menu_tr_change_character params = {up score_index = (<score_index>)}}
		{pad_down menu_tr_change_character params = {down score_index = (<score_index>)}}
		{pad_choose menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_back menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_start menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
	]
	exclusive_device = $primary_controller
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	SetScreenElementProps id = <score_name_id> event_handlers = <event_handlers> exclusive_device = <exclusive_device> replace_handlers
	LaunchEvent type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	FormatText textname = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf "Score index is %d" d = <score_index>
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> text = (<band_name_text_string>)
	GetScreenElementDims id = <score_name_id>
	if (<width> >= 200)
		GetScreenElementProps id = <score_name_id>
		SetScreenElementProps id = <score_name_id> Scale = 1
		fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) Pos = <Pos>
		if GotParam \{add_2_width}
			change g_tr_went_past_max_width = ($g_tr_went_past_max_width + 1)
		endif
	endif
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	switch (<score_index> + 1)
		case 1
		SetGlobalTags <songname> params = {name1 = <new_string>}
		case 2
		SetGlobalTags <songname> params = {name2 = <new_string>}
		case 3
		SetGlobalTags <songname> params = {name3 = <new_string>}
		case 4
		SetGlobalTags <songname> params = {name4 = <new_string>}
		case 5
		SetGlobalTags <songname> params = {name5 = <new_string>}
	endswitch
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tr_change_character_up 
	generic_menu_up_or_down_sound \{up}
	SetArrayElement arrayName = default_band_indexes globalarray index = $new_band_index newValue = ($default_band_indexes [$new_band_index] + 1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_size> -1))
		SetArrayElement \{arrayName = default_band_indexes
			globalarray
			index = $new_band_index
			newValue = 0}
	endif
	SetArrayElement arrayName = new_band_name globalarray index = $new_band_index newValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	generic_menu_up_or_down_sound \{down}
	SetArrayElement arrayName = default_band_indexes globalarray index = $new_band_index newValue = ($default_band_indexes [$new_band_index] -1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		SetArrayElement arrayName = default_band_indexes globalarray index = $new_band_index newValue = (<array_size> -1)
	endif
	SetArrayElement arrayName = new_band_name globalarray index = $new_band_index newValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		SoundEvent \{event = ui_sfx_select}
		change new_band_index = ($new_band_index + 1)
		SetArrayElement arrayName = new_band_name globalarray index = $new_band_index newValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		SoundEvent \{event = Generic_menu_back_SFX}
		SetArrayElement arrayName = default_band_indexes globalarray index = ($new_band_index) newValue = 0
		change new_band_index = ($new_band_index -1)
		SetArrayElement arrayName = new_band_name globalarray index = ($new_band_index + 1) newValue = ""
		if ($g_tr_went_past_max_width > 0)
			change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				SetScreenElementProps id = <score_name_id> Scale = (0.6, 0.8)
			else
				GetScreenElementProps id = <score_name_id>
				SetScreenElementProps id = <score_name_id> Scale = 1
				fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) Pos = <Pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if IsGuitarController controller = <device_num>
		if GotParam \{up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if GotParam \{up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript
