tr_max_band_characters = 14
num_top_scores = 5
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	disable_pause
	create_menu_backdrop \{texture = Toprockers_bg}
	createScreenElement \{Type = containerElement PARENT = root_window Id = tr_container pos = (0.0, 0.0)}
	menu_top_rockers_create_poster
	new_score = -1
	if (<for_options> = 0)
		menu_top_rockers_check_for_new_top_score
	endif
	menu_top_rockers_create_paper highlight_index = (<new_score> + 1)
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
		add_user_control_helper \{Text = "DELETE" button = Red Z = 100}
		add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
		add_user_control_helper \{Text = "ACCEPT" button = Start Z = 100}
	else
		menu_top_rockers_create_continue_button
		add_user_control_helper \{Text = "BACK" button = Red Z = 100}
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
	displaySprite \{PARENT = tr_container tex = Venue_Overlay pos = (0.0, 0.0) Dims = (1280.0, 720.0) Z = 50}
	createScreenElement \{Type = spriteElement PARENT = tr_container texture = Toprockers_poster pos = (740.0, 30.0) just = [Right top] Dims = (620.0, 620.0) z_priority = 1.2 Rot_Angle = -3}
	formatText \{Textname = Rockers_title "\\c9%T\\c0%R" T = "TOP" R = "ROCKERS"}
	createScreenElement {
		Type = textElement
		PARENT = tr_container
		pos = (460.0, 625.0)
		just = [Center Center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		Rot_Angle = -4
		Text = <Rockers_title>
	}
	fit_text_in_rectangle Id = <Id> Dims = (380.0, 100.0) keep_ar = 1
endscript

script menu_top_rockers_create_paper 
	createScreenElement \{Type = containerElement PARENT = tr_container Id = tr_paper_container pos = (630.0, 90.0)}
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	get_song_prefix Song = ($current_song)
	formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
	getglobaltags <songname>
	get_difficulty_text DIFFICULTY = ($current_difficulty)
	get_song_title Song = ($current_song)
	GetUppercaseString <Song_Title>
	Song_Title = <UppercaseString>
	GetUppercaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	StringToCharArray String = <Song_Title>
	getArraySize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_Size> >= <max_characters>)
		new_song_text = ""
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_Size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = " ")
				Printf \{"found space"}
				break
			endif
		endif
		repeat
		<Song_Title> = (<new_song_text> + "...")
		<max_width> = 270
	endif
	formatText Textname = song_diff_text "\\c9%s \\c2%d" S = <Song_Title> D = <difficulty_text>
	createScreenElement {
		Type = textElement
		PARENT = tr_container
		Id = tr_song_name
		pos = (435.0, 115.0)
		just = [Center Center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		Rot_Angle = -3
		Text = <song_diff_text>
	}
	fit_text_in_rectangle Id = <Id> Dims = (380.0, 100.0) keep_ar = 1
	displaySprite \{PARENT = tr_container tex = Toprockers_Tape_1 pos = (500.0, -10.0) Dims = (140.0, 70.0) Z = 50}
	displaySprite \{PARENT = tr_container tex = Toprockers_Tape_2 pos = (280.0, 240.0) Z = 50 Rot_Angle = 90 Dims = (140.0, 70.0)}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 80.0)
	name_offset = (140.0, 7.0)
	bar_offset = (-100.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	formatText Checksumname = song_score_cs 'score%d' D = <score_val>
	formatText Textname = Song_score_text "%s" S = (<...>.<song_score_cs>) useCommas
	formatText Checksumname = score_name_cs 'name%d' D = <score_val>
	formatText Textname = score_name_text "%s" S = (<...>.<score_name_cs>)
	formatText Textname = number_text "%n" N = <score_val>
	formatText Checksumname = song_score_id 'song_score%d' D = <score_val>
	formatText Checksumname = score_name_id 'score_name%d' D = <score_val>
	score_scale = (0.6, 0.8)
	rand = Random (@ 1 @ 2 )
	formatText Checksumname = bar_tex 'Toprockers_Bar_%d' D = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
		elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	bar_rgba = [150 70 95 255]
	text_rgba = [220 220 220 255]
	show_num = 1
	if (<score_val> = <highlight_index>)
		<bar_rgba> = [0 0 0 255]
		<text_rgba> = [190 160 30 255]
		<show_num> = 0
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [Left Bottom]
		texture = <bar_tex>
		Dims = (800.0, 45.0)
		<bar_flags>
	}
	if (<show_num> = 1)
		createScreenElement {
			scale = 1.0
			Type = textElement
			PARENT = tr_paper_container
			pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 17.0))
			z_priority = 1.3
			rgba = [0 0 0 255]
			just = [Left Bottom]
			Text = <number_text>
			font = fontgrid_title_gh3
		}
	else
		createScreenElement {
			Type = spriteElement
			PARENT = tr_paper_container
			pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <skull_offset>)
			z_priority = 1.3
			rgba = [255 255 255 255]
			just = [Left Bottom]
			texture = Toprockers_Skull
			Dims = (48.0, 48.0)
		}
	endif
	createScreenElement {
		scale = <score_scale>
		Type = textElement
		PARENT = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [Left Bottom]
		Text = <Song_score_text>
		font = fontgrid_title_gh3
		Id = <song_score_id>
	}
	fit_text_in_rectangle Id = <Id> Dims = (65.0, 40.0) only_if_larger_x = 1
	createScreenElement {
		scale = (0.8, 0.8)
		Type = textElement
		PARENT = tr_paper_container
		pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 3.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [Left Bottom]
		Text = <score_name_text>
		font = fontgrid_title_gh3
		Id = <score_name_id>
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = (135.0, 35.0) only_if_larger_x = 1 pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset>)
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<score_val> = (<score_val> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	createScreenElement {
		Type = textElement
		PARENT = root_window
		Id = continue_button
		scale = 0.9
		pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [Left top]
		z_priority = 4
	}
	createScreenElement {
		Type = textElement
		PARENT = continue_button
		Id = continue_text
		scale = 0.8
		pos = (40.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left Center]
		z_priority = 4
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
	launchevent \{Type = focus Target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	newbestscore = 0
	player_score = ($player1_status.score)
	castToInteger \{player_score}
	player_stars = ($player1_status.STARS)
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	get_song_prefix Song = ($current_song)
	formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
	getglobaltags <songname>
	score_array = [0 0 0 0 0]
	name_array = ["" "" "" "" ""]
	stars_array = [0 0 0 0 0]
	score_index = 0
	begin
	formatText Checksumname = score_cs 'score%d' D = (<score_index> + 1)
	formatText Checksumname = name_cs 'name%d' D = (<score_index> + 1)
	formatText Checksumname = stars_cs 'stars%d' D = (<score_index> + 1)
	setarrayelement Arrayname = score_array Index = <score_index> NewValue = (<...>.<score_cs>)
	setarrayelement Arrayname = name_array Index = <score_index> NewValue = (<...>.<name_cs>)
	setarrayelement Arrayname = stars_array Index = <score_index> NewValue = (<...>.<stars_cs>)
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
				setarrayelement Arrayname = score_array Index = (<score_shift_index> + 1) NewValue = (<score_array> [<score_shift_index>])
				setarrayelement Arrayname = name_array Index = (<score_shift_index> + 1) NewValue = (<name_array> [<score_shift_index>])
				setarrayelement Arrayname = stars_array Index = (<score_shift_index> + 1) NewValue = (<stars_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			setarrayelement Arrayname = score_array Index = <score_index> NewValue = <player_score>
			setarrayelement Arrayname = stars_array Index = <score_index> NewValue = <player_stars>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		setGlobalTags <songname> Params = {bestscore = <bestscore>}
		setGlobalTags <songname> Params = {beststars = <beststars>}
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = 1
	endif
	setGlobalTags <songname> Params = {score1 = (<score_array> [0]) score2 = (<score_array> [1]) score3 = (<score_array> [2]) score4 = (<score_array> [3]) score5 = (<score_array> [4])}
	setGlobalTags <songname> Params = {name1 = (<name_array> [0]) name2 = (<name_array> [1]) name3 = (<name_array> [2]) name4 = (<name_array> [3]) name5 = (<name_array> [4])}
	setGlobalTags <songname> Params = {stars1 = (<stars_array> [0]) stars2 = (<stars_array> [1]) stars3 = (<stars_array> [2]) stars4 = (<stars_array> [3]) stars5 = (<stars_array> [4])}
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		Change \{new_band_name = ["A" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""]}
		Change \{default_band_indexes = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]}
		Change \{new_band_index = 0}
		Change \{tr_first_time_initialised = 1}
	endif
	setScreenElementProps \{Id = root_window event_handlers = [{pad_start null_script}] Replace_Handlers}
	event_handlers = [
		{pad_up menu_tr_change_character Params = {Up score_index = (<score_index>)}}
		{pad_down menu_tr_change_character Params = {Down score_index = (<score_index>)}}
		{pad_choose menu_tr_band_advance_pointer Params = {score_index = (<score_index>)}}
		{pad_back menu_tr_band_retreat_pointer Params = {score_index = (<score_index>)}}
		{pad_start menu_tr_confirm_band_name Params = {score_index = (<score_index>)}}
	]
	formatText Checksumname = score_name_id 'score_name%d' D = (<score_index> + 1)
	setScreenElementProps Id = <score_name_id> event_handlers = <event_handlers> Replace_Handlers
	launchevent Type = focus Target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	formatText Textname = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" A = ($new_band_name [0]) B = ($new_band_name [1]) C = ($new_band_name [2]) D = ($new_band_name [3]) E = ($new_band_name [4]) F = ($new_band_name [5]) G = ($new_band_name [6]) H = ($new_band_name [7]) I = ($new_band_name [8]) J = ($new_band_name [9]) K = ($new_band_name [10]) L = ($new_band_name [11]) M = ($new_band_name [12]) N = ($new_band_name [13]) O = ($new_band_name [14]) P = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	Printf "Score index is %d" D = <score_index>
	formatText Checksumname = score_name_id 'score_name%d' D = (<score_index> + 1)
	menu_tr_get_band_name_text
	setScreenElementProps Id = <score_name_id> Text = (<band_name_text_string>)
	getScreenElementDims Id = <score_name_id>
	if (<width> >= 200)
		getScreenElementProps Id = <score_name_id>
		setScreenElementProps Id = <score_name_id> scale = 1
		fit_text_in_rectangle Id = <score_name_id> Dims = (200.0, 50.0) pos = <pos>
		if gotParam \{add_2_width}
			Change g_tr_went_past_max_width = ($g_tr_went_past_max_width + 1)
		endif
	endif
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	StringRemoveTrailingWhitespace String = <band_name_text_string>
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	get_song_prefix Song = ($current_song)
	formatText Checksumname = songname '%s_%d' S = <song_prefix> D = <difficulty_text_nl>
	switch (<score_index> + 1)
		case 1
		setGlobalTags <songname> Params = {name1 = <new_string>}
		case 2
		setGlobalTags <songname> Params = {name2 = <new_string>}
		case 3
		setGlobalTags <songname> Params = {name3 = <new_string>}
		case 4
		setGlobalTags <songname> Params = {name4 = <new_string>}
		case 5
		setGlobalTags <songname> Params = {name5 = <new_string>}
	endswitch
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script menu_tr_change_character_up 
	generic_menu_up_or_down_sound \{Up}
	setarrayelement Arrayname = default_band_indexes globalArray Index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] + 1)
	getArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_Size> -1))
		setarrayelement \{Arrayname = default_band_indexes globalArray Index = $new_band_index NewValue = 0}
	endif
	setarrayelement Arrayname = new_band_name globalArray Index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	generic_menu_up_or_down_sound \{Down}
	setarrayelement Arrayname = default_band_indexes globalArray Index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] -1)
	getArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		setarrayelement Arrayname = default_band_indexes globalArray Index = $new_band_index NewValue = (<array_Size> -1)
	endif
	setarrayelement Arrayname = new_band_name globalArray Index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		Change new_band_index = ($new_band_index + 1)
		setarrayelement Arrayname = new_band_name globalArray Index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		setarrayelement Arrayname = default_band_indexes globalArray Index = ($new_band_index) NewValue = 0
		Change new_band_index = ($new_band_index -1)
		setarrayelement Arrayname = new_band_name globalArray Index = ($new_band_index + 1) NewValue = ""
		if ($g_tr_went_past_max_width > 0)
			Change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			formatText Checksumname = score_name_id 'score_name%d' D = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				setScreenElementProps Id = <score_name_id> scale = (0.6, 0.8)
			else
				getScreenElementProps Id = <score_name_id>
				setScreenElementProps Id = <score_name_id> scale = 1
				fit_text_in_rectangle Id = <score_name_id> Dims = (200.0, 50.0) pos = <pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if isguitarcontroller controller = <device_num>
		if gotParam \{Up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if gotParam \{Up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript
