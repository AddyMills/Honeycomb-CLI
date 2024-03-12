detailed_stats_font = text_a3
detailed_stats_text_color = [
	0
	0
	0
	255
]
detailed_stats_text_scale = 1
initial_column_y_end = 340
left_column_num_elements = 0
left_column_x = 250
left_column_y_end = 100
left_column_just = [
	Left
	top
]
center_column_num_elements = 0
center_column_y_end = 100
center_column_x = 640
center_column_just = [
	Center
	top
]
right_column_num_elements = 0
right_column_x = 1030
right_column_y_end = 100
right_column_just = [
	Right
	top
]
relative_screen_y_position = 0
up_down_y_change = 50

script create_detailed_stats_menu 
	Change \{left_column_num_elements = 0}
	Change left_column_y_end = ($initial_column_y_end)
	Change \{center_column_num_elements = 0}
	Change center_column_y_end = ($initial_column_y_end)
	Change \{right_column_num_elements = 0}
	Change right_column_y_end = ($initial_column_y_end)
	Change \{relative_screen_y_position = 0}
	Change center_column_x = (($left_column_x) + (0.5 * ($right_column_x - $left_column_x)))
	notes_ratio = ["" ""]
	sp_ratio = ["" ""]
	avg_multiplier = ["" ""]
	lead_percentage = ["" ""]
	attacks_thrown = ["" ""]
	p1_notes_hit = ($player1_status.NOTES_HIT)
	p1_notes_max = ($player1_status.total_notes)
	p1_sp_phrases_hit = ($player1_status.sp_phrases_hit)
	p1_sp_phrases_max = ($player1_status.sp_phrases_total)
	if ($player1_status.base_score > 0)
		p1_avg_multiplier_val = ($player1_status.score / (1.0 * $player1_status.base_score))
		if (<p1_avg_multiplier_val> < 1.0)
			p1_avg_multiplier_val = 1.0
		endif
	else
		p1_avg_multiplier_val = 1.0
	endif
	if ($game_mode = p2_career ||
			$game_mode = p2_coop)
		p1_notes_hit = ($player1_status.NOTES_HIT)
		p1_notes_max = ($player1_status.total_notes)
		p1_sp_phrases_hit = ($player1_status.sp_phrases_hit + $player2_status.sp_phrases_hit)
		p1_sp_phrases_max = ($player1_status.sp_phrases_total + $player2_status.sp_phrases_total)
		if ($player1_status.base_score = 0 &&
				$player2_status.base_score = 0)
			p1_avg_multiplier_val = 1.0
		else
			p1_avg_multiplier_val = (($player1_status.score + $player2_status.score)
				/ (1.0 * ($player1_status.base_score + $player2_status.base_score)))
			if (<p1_avg_multiplier_val> < 1.0)
				p1_avg_multiplier_val = 1.0
			endif
		endif
	endif
	formatText Textname = p1_notes_ratio "%a/%b" A = <p1_notes_hit> B = <p1_notes_max>
	setarrayelement Arrayname = notes_ratio Index = 0 NewValue = <p1_notes_ratio>
	if NOT ($game_mode = p2_battle || $current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		formatText Textname = p1_sp_ratio "%a/%b" A = <p1_sp_phrases_hit> B = <p1_sp_phrases_max>
		setarrayelement Arrayname = sp_ratio Index = 0 NewValue = <p1_sp_ratio>
		formatText Textname = p1_avg_multiplier "%d X" D = <p1_avg_multiplier_val>
		setarrayelement Arrayname = avg_multiplier Index = 0 NewValue = <p1_avg_multiplier>
	else
		formatText Textname = p1_attacks_thrown "%a" A = ($player1_status.battle_num_attacks)
		setarrayelement Arrayname = attacks_thrown Index = 0 NewValue = <p1_attacks_thrown>
	endif
	if NOT ($game_mode = p2_career ||
			$game_mode = p2_coop)
		if ($current_num_players = 2)
			p1_time_in_lead = 0
			p2_time_in_lead = 0
			total_time = ($player1_status.time_in_lead + $player2_status.time_in_lead)
			if (<total_time> > 0)
				p1_time_in_lead = ((100 * $player1_status.time_in_lead / <total_time>) + 0.5)
				castToInteger \{p1_time_in_lead}
				p2_time_in_lead = (100 - <p1_time_in_lead>)
			endif
			if NOT ($game_mode = p2_battle || $current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
				formatText Textname = p1_lead_percent "%d\\%" D = <p1_time_in_lead>
				setarrayelement Arrayname = lead_percentage Index = 0 NewValue = <p1_lead_percent>
			endif
			p2_notes_hit = ($player2_status.NOTES_HIT)
			p2_notes_max = ($player2_status.total_notes)
			p2_sp_phrases_hit = ($player2_status.sp_phrases_hit)
			p2_sp_phrases_max = ($player2_status.sp_phrases_total)
			if ($player2_status.base_score > 0)
				p2_avg_multiplier_val = ($player2_status.score / (1.0 * $player2_status.base_score))
				if (<p2_avg_multiplier_val> < 1.0)
					p2_avg_multiplier_val = 1.0
				endif
			else
				p2_avg_multiplier_val = 1.0
			endif
			formatText Textname = p2_notes_ratio "%a/%b" A = <p2_notes_hit> B = <p2_notes_max>
			setarrayelement Arrayname = notes_ratio Index = 1 NewValue = <p2_notes_ratio>
			if NOT ($game_mode = p2_battle || $current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
				formatText Textname = p2_sp_ratio "%a/%b" A = <p2_sp_phrases_hit> B = <p2_sp_phrases_max>
				setarrayelement Arrayname = sp_ratio Index = 1 NewValue = <p2_sp_ratio>
				formatText Textname = p2_avg_multiplier "%d X" D = <p2_avg_multiplier_val>
				setarrayelement Arrayname = avg_multiplier Index = 1 NewValue = <p2_avg_multiplier>
				formatText Textname = p2_lead_percent "%d\\%" D = <p2_time_in_lead>
				setarrayelement Arrayname = lead_percentage Index = 1 NewValue = <p2_lead_percent>
			else
				formatText Textname = p2_attacks_thrown "%a" A = ($player2_status.battle_num_attacks)
				setarrayelement Arrayname = attacks_thrown Index = 1 NewValue = <p2_attacks_thrown>
			endif
		endif
	endif
	if ($game_mode = p2_battle)
		p1_sp_ratio = "N/A"
		p1_avg_multiplier = "N/A"
		p1_lead_percent = "N/A"
		p2_sp_ratio = "N/A"
		p2_avg_multiplier = "N/A"
		p2_lead_percent = "N/A"
	endif
	left_margin = 400
	right_margin = 800
	basic_stats_y_offset = 100
	if ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		desc_internal_just = [Left top]
		desc_x_offset = <left_margin>
		p1_stat_internal_just = [Right top]
		p1_stat_x_offset = <right_margin>
	else
		desc_internal_just = [Center top]
		desc_x_offset = 640
		p1_stat_internal_just = [Left top]
		p1_stat_x_offset = <left_margin>
		p2_stat_internal_just = [Right top]
		p2_stat_x_offset = <right_margin>
	endif
	detailed_stats_create_container
	if NOT ($game_mode = p2_career ||
			$game_mode = p2_coop)
		if ($current_num_players = 2)
			add_text_to_column \{column = 'left' Text = "PLAYER ONE"}
			add_text_to_column \{column = 'right' Text = "PLAYER TWO"}
			add_text_to_column \{column = 'center' Text = ""}
			add_text_to_column \{column = 'left' Text = ""}
			add_text_to_column \{column = 'center' Text = ""}
			add_text_to_column \{column = 'right' Text = ""}
		endif
	endif
	add_basic_stats_desc
	add_basic_stats notes_ratio = <notes_ratio> sp_ratio = <sp_ratio> lead_percentage = <lead_percentage> avg_multiplier = <avg_multiplier> attacks_thrown = <attacks_thrown>
	add_text_to_column \{column = 'left' Text = ""}
	add_text_to_column \{column = 'center' Text = ""}
	add_text_to_column \{column = 'right' Text = ""}
	add_text_to_column \{column = 'left' Text = ""}
	add_text_to_column \{column = 'center' Text = ""}
	add_text_to_column \{column = 'right' Text = ""}
	add_divider_graphic
	get_song_prefix Song = ($current_song)
	formatText Checksumname = song_section_array '%s_markers' S = <song_prefix>
	getArraySize (<song_section_array>)
	section_index = 0
	Highlight = 1
	if (<array_Size> > 0)
		begin
		get_highest_lowest_stats section_index = <section_index> section_array = <song_section_array>
		<section_index> = (<section_index> + 1)
		repeat <array_Size>
	endif
	section_index = 0
	Highlight = 1
	if (<array_Size> > 0)
		begin
		add_section_stats_and_desc section_index = <section_index> section_array = <song_section_array> Highlight = <Highlight>
		if (<Highlight> = 1)
			<Highlight> = 0
		else
			<Highlight> = 1
		endif
		<section_index> = (<section_index> + 1)
		repeat <array_Size>
	endif
	menu_detailed_stats_add_paper_sprites
	circle_pos = [(327.0, 349.0) , (873.9, 349.0)]
	best_pos = [(595.0, 365.0) , (665.0, 365.0)]
	rot_vals = [-3 , 3]
	if NOT ($game_mode = p2_career ||
			$game_mode = p2_coop)
		if ($current_num_players = 2)
			tie = 0
			if ($player2_status.score > $player1_status.score)
				better_player = 1
				C = 'right'
				elseif ($player1_status.score > $player2_status.score)
				better_player = 0
				C = 'left'
			else
				<tie> = 1
			endif
			if (<tie> = 0)
				formatText Checksumname = entry_id '%c_column_%d' C = <C> D = 0
				getScreenElementProps Id = <entry_id>
				getScreenElementDims Id = <entry_id>
				createScreenElement {
					Type = spriteElement
					PARENT = ds_container
					pos = (<circle_pos> [<better_player>])
					texture = circle_pen
					just = [Center Center]
					Dims = ((1.8, 0.0) * <width> + (0.0, 4.25) * <Height>)
					rgba = [60 70 115 100]
					z_priority = 7
				}
				createScreenElement {
					Type = textElement
					PARENT = ds_container
					pos = (<best_pos> [<better_player>])
					Text = "BEST!"
					font = text_a3
					Rot_Angle = (<rot_vals> [<better_player>])
					Id = best_text
					z_priority = 7
					rgba = [60 70 115 100]
					scale = 1.4
				}
			endif
		endif
	endif
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "CONTINUE" button = Green Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script destroy_detailed_stats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ds_container}
	destroy_menu \{menu_id = temp_ds_background}
	destroy_menu \{menu_id = continue_text}
	destroy_menu \{menu_id = detailed_stats_bg_container}
	destroy_menu \{menu_id = ds_spotlight}
endscript

script add_basic_stats_desc 
	if ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> Text = "NOTES HIT" Dims = (400.0, 0.0)
	if NOT ($game_mode = p2_battle || $current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		add_text_to_column column = <desc_column> Text = "SP PHRASES" Dims = (400.0, 0.0)
		add_text_to_column column = <desc_column> Text = "AVG MULTIPLIER" Dims = (400.0, 0.0)
		if ($current_num_players = 2)
			if ($game_mode = p2_faceoff ||
					$game_mode = p2_pro_faceoff ||
					$game_mode = p2_battle)
				add_text_to_column column = <desc_column> Text = "TIME IN LEAD" Dims = (400.0, 0.0)
			endif
		endif
	else
		add_text_to_column column = <desc_column> Text = "ATTACKS THROWN" Dims = (400.0, 0.0)
	endif
endscript

script add_basic_stats 
	Player = 0
	begin
	if ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		stat_column = 'right'
	else
		if (<Player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	add_text_to_column column = <stat_column> Text = (<notes_ratio> [<Player>]) Dims = (150.0, 0.0)
	if NOT ($game_mode = p2_battle || $current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		add_text_to_column column = <stat_column> Text = (<sp_ratio> [<Player>]) Dims = (150.0, 0.0)
		add_text_to_column column = <stat_column> Text = (<avg_multiplier> [<Player>]) Dims = (150.0, 0.0)
		if ($current_num_players = 2)
			if ($game_mode = p2_faceoff ||
					$game_mode = p2_pro_faceoff ||
					$game_mode = p2_battle)
				add_text_to_column column = <stat_column> Text = (<lead_percentage> [<Player>]) Dims = (150.0, 0.0)
			endif
		endif
	else
		add_text_to_column column = <stat_column> Text = (<attacks_thrown> [<Player>]) Dims = (150.0, 0.0)
	endif
	if ($game_mode = p2_career ||
			$game_mode = p2_coop)
		break
	endif
	<Player> = (<Player> + 1)
	repeat ($current_num_players)
endscript
g_players_lowest_stat = [
	0.0
	0.0
]
g_players_highest_stat = [
	0.0
	0.0
]

script get_highest_lowest_stats 
	get_section_stats section_index = <section_index> section_array = <section_array>
	Player = 0
	begin
	if (<section_index> = 0)
		setarrayelement Arrayname = g_players_lowest_stat globalArray Index = <Player> NewValue = 99.9
		setarrayelement Arrayname = g_players_highest_stat globalArray Index = <Player> NewValue = 0.1
	endif
	if (<notes_max> [<Player>] > 0)
		hit_percent = ((100 * (<NOTES_HIT> [<Player>])) / (<notes_max> [<Player>]))
		if (<hit_percent> < $g_players_lowest_stat [<Player>])
			setarrayelement Arrayname = g_players_lowest_stat globalArray Index = <Player> NewValue = <hit_percent>
		endif
		if (<hit_percent> > $g_players_highest_stat [<Player>])
			setarrayelement Arrayname = g_players_highest_stat globalArray Index = <Player> NewValue = <hit_percent>
		endif
	endif
	<Player> = (<Player> + 1)
	repeat ($current_num_players)
endscript

script add_section_stats_and_desc \{section_index = 0 Highlight = 0 for_practice = 0}
	get_section_stats section_index = <section_index> section_array = <section_array>
	if ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> Text = <section_name> for_practice = <for_practice> Dims = (500.0, 0.0)
	Player = 0
	begin
	if ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		stat_column = 'right'
	else
		if (<Player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	if (<notes_max> [<Player>] > 0)
		hit_percent = ((100 * (<NOTES_HIT> [<Player>])) / (<notes_max> [<Player>]))
		formatText Textname = section_percent "%d \\%" D = <hit_percent>
		if (<hit_percent> = 100)
			add_text_to_column column = <stat_column> Text = <section_percent> rgba = [20 165 0 255] Highlight = <Highlight> for_practice = <for_practice>
			elseif (<hit_percent> = $g_players_lowest_stat [<Player>])
			add_text_to_column column = <stat_column> Text = <section_percent> rgba = [165 0 0 255] Highlight = <Highlight> for_practice = <for_practice>
		else
			add_text_to_column column = <stat_column> Text = <section_percent> Highlight = <Highlight> for_practice = <for_practice>
		endif
	else
		hit_percent = 0
		formatText \{Textname = section_percent "N/A"}
		add_text_to_column column = <stat_column> Text = <section_percent> Highlight = <Highlight> for_practice = <for_practice>
	endif
	if ($game_mode = p2_career ||
			$game_mode = p2_coop)
		break
	endif
	<Player> = (<Player> + 1)
	repeat ($current_num_players)
endscript

script detailed_stats_create_container \{for_practice = 0}
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement Arrayname = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
			setarrayelement Arrayname = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = ds_container
		pos = (0.0, 0.0)
		exclusive_device = <exclusive_device>
	}
	createScreenElement {
		Type = textElement
		PARENT = root_window
		Id = continue_text
		scale = 0.8
		pos = (50.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left Center]
		z_priority = 101
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
			{pad_down menu_detailed_stats_move_screen_up}
			{pad_up menu_detailed_stats_move_screen_down}
			{pad_start menu_show_gamercard}
		]
	}
	if (<for_practice> = 0)
		launchevent \{Type = focus Target = continue_text}
	endif
	createScreenElement \{Type = spriteElement Id = detailed_stats_paper_top PARENT = ds_container texture = Detailed_stats_sheet_top Rot_Angle = 2 pos = (140.0, 50.0) just = [Left top] z_priority = 1}
	if (<for_practice> = 1)
		createScreenElement {
			Type = textElement
			PARENT = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [Left top]
			z_priority = 2
			font = ($detailed_stats_font)
			Text = "PRACTICE SECTIONS"
			rgba = [118 29 30 255]
			scale = (1.7, 2.25)
		}
	else
		createScreenElement {
			Type = textElement
			PARENT = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [Left top]
			z_priority = 2
			font = ($detailed_stats_font)
			Text = "DETAILED"
			rgba = [118 29 30 255]
			scale = 2.75
		}
		createScreenElement {
			Type = textElement
			PARENT = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 215.0))
			just = [Left top]
			z_priority = 2
			font = ($detailed_stats_font)
			Text = "BREAKDOWN"
			rgba = [118 29 30 255]
			scale = 2.75
		}
	endif
	createScreenElement \{Type = containerElement Id = detailed_stats_bg_container PARENT = root_window pos = (0.0, 0.0)}
	createScreenElement \{Type = spriteElement Id = detailed_stats_bg0 PARENT = detailed_stats_bg_container texture = Detailed_stats_BG rgba = [255 255 255 255] pos = (0.0, 0.0) Dims = (1280.0, 240.0) just = [Left top] z_priority = 0}
	createScreenElement \{Type = spriteElement Id = detailed_stats_bg1 PARENT = detailed_stats_bg_container texture = Detailed_stats_BG rgba = [255 255 255 255] pos = (0.0, 240.0) Dims = (1280.0, 240.0) just = [Left top] z_priority = 0}
	createScreenElement \{Type = spriteElement Id = detailed_stats_bg2 PARENT = detailed_stats_bg_container texture = Detailed_stats_BG rgba = [255 255 255 255] pos = (0.0, 480.0) Dims = (1280.0, 240.0) just = [Left top] z_priority = 0}
	createScreenElement \{Type = spriteElement Id = detailed_stats_bg3 PARENT = detailed_stats_bg_container texture = Detailed_stats_BG rgba = [255 255 255 255] pos = (0.0, 720.0) Dims = (1280.0, 240.0) just = [Left top] z_priority = 0}
	createScreenElement \{Type = spriteElement PARENT = root_window Id = ds_spotlight texture = Detailed_stats_spotlight_overlay rgba = [255 255 255 255] Dims = (1280.0, 720.0) pos = (0.0, 0.0) just = [Left top] z_priority = 7 BLEND = sub}
endscript

script add_text_to_column {
		column = 'left'
		Text = "No string"
		rgba = [75 75 75 255]
		scale = ($detailed_stats_text_scale)
		rot = 0
		Highlight = 0
		font = ($detailed_stats_font)
		for_practice = 0
	}
	formatText Checksumname = column_x '%s_column_x' S = (<column>)
	formatText Checksumname = column_y_end '%s_column_y_end' S = (<column>)
	formatText Checksumname = column_just '%s_column_just' S = (<column>)
	formatText Checksumname = column_elements '%s_column_num_elements' S = <column>
	formatText Checksumname = entry_id '%s_column_%d' S = <column> D = (<column_elements>)
	GetUppercaseString <Text>
	if (<for_practice> = 1)
		<UppercaseString> = ""
		font = text_a4
	endif
	if gotParam \{dont_force_caps}
		<display_string> = <Text>
	else
		<display_string> = <UppercaseString>
	endif
	createScreenElement {
		Type = textElement
		PARENT = ds_container
		Id = <entry_id>
		font = <font>
		rgba = <rgba>
		scale = <scale>
		Rot_Angle = <rot>
		pos = ((1.0, 0.0) * <column_x> + (0.0, 1.0) * <column_y_end>)
		just = (<column_just>)
		Text = <display_string>
		z_priority = 6
		font_spacing = 4
	}
	if gotParam \{Dims}
		getScreenElementDims Id = <Id>
		if NOT (<width> = 0)
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = (((<Dims>.(1.0, 0.0)) * (1.0, 0.0)) + <Height> * (0.0, 1.0))
		endif
	endif
	getScreenElementDims Id = <entry_id>
	if (<for_practice> = 1)
		Height = (<Height> - 1)
	endif
	highlight_width = ($right_column_x - $left_column_x + 50)
	if (<Highlight> = 1)
		createScreenElement {
			Type = spriteElement
			PARENT = ds_container
			pos = ((1.0, 0.0) * ($left_column_x - 25) + (0.0, 1.0) * (<column_y_end> - 4))
			Dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <Height>)
			rgba = [0 0 0 25]
			just = [Left top]
			z_priority = 3
		}
	endif
	new_column_y_end = (<column_y_end> + <Height>)
	new_num_column_elements = (<column_elements> + 1)
	Change globalName = <column_y_end> NewValue = <new_column_y_end>
	Change globalName = <column_elements> NewValue = <new_num_column_elements>
endscript

script get_section_stats \{section_index = 0}
	NOTES_HIT = [0 0]
	notes_max = [1 1]
	if ($game_mode = p2_career ||
			$game_mode = p2_coop)
		setarrayelement Arrayname = NOTES_HIT Index = 0 NewValue = (($p1_last_song_detailed_stats [<section_index>]) + ($p2_last_song_detailed_stats [<section_index>]))
		setarrayelement Arrayname = notes_max Index = 0 NewValue = (($p1_last_song_detailed_stats_max [<section_index>]) + ($p2_last_song_detailed_stats_max [<section_index>]))
	else
		setarrayelement Arrayname = NOTES_HIT Index = 0 NewValue = ($p1_last_song_detailed_stats [<section_index>])
		setarrayelement Arrayname = NOTES_HIT Index = 1 NewValue = ($p2_last_song_detailed_stats [<section_index>])
		setarrayelement Arrayname = notes_max Index = 0 NewValue = ($p1_last_song_detailed_stats_max [<section_index>])
		setarrayelement Arrayname = notes_max Index = 1 NewValue = ($p2_last_song_detailed_stats_max [<section_index>])
	endif
	section_name = ((<section_array> [<section_index>]).marker)
	return <...>
endscript

script menu_detailed_stats_move_screen_down 
	if (($relative_screen_y_position + $up_down_y_change) < 0)
		Change relative_screen_y_position = ($relative_screen_y_position + $up_down_y_change)
		generic_menu_up_or_down_sound
	else
		Change \{relative_screen_y_position = 0}
	endif
	setScreenElementProps Id = ds_container pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_detailed_stats_move_screen_up 
	if isWinPort
		GetDisplaySettings
		if (<Height> <= 480)
			bottom_gap = 50
			elseif (<Height> > 480 && <Height> <= 612)
			bottom_gap = 100
			elseif (<Height> > 612 && <Height> <= 800)
			bottom_gap = 150
			elseif (<Height> > 800 && <Height> <= 900)
			bottom_gap = 300
			elseif (<Height> > 900 && <Height> <= 1050)
			bottom_gap = 450
			elseif (<Height> > 1050 && <Height> <= 1200)
			bottom_gap = 600
			elseif (<Height> > 1200 && <Height> <= 1440)
			bottom_gap = 800
			elseif (<Height> > 1440 && <Height> <= 1536)
			bottom_gap = 950
		else
			bottom_gap = 1200
		endif
	else
		bottom_gap = 150
	endif
	stats_end = ($relative_screen_y_position + $left_column_y_end)
	getScreenElementDims \{Id = root_window}
	bottom_end = (<Height> - <bottom_gap>)
	if ((<stats_end> - $up_down_y_change) > <bottom_end>)
		Change relative_screen_y_position = ($relative_screen_y_position - $up_down_y_change)
		generic_menu_up_or_down_sound
	endif
	setScreenElementProps Id = ds_container pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_ds_scroll_all 
	menu_ds_scroll_background
endscript

script menu_ds_scroll_background 
	scroll_position = (-1 * ($relative_screen_y_position))
	Printf "Scroll position is %d" D = <scroll_position>
	if (<scroll_position> < 240)
		setScreenElementProps Id = detailed_stats_bg_container pos = ((0.0, -1.0) * <scroll_position>)
	else
		Mod A = <scroll_position> B = 240
		setScreenElementProps Id = detailed_stats_bg_container pos = ((0.0, -1.0) * <Mod>)
	endif
endscript

script menu_detailed_stats_add_paper_sprites 
	createScreenElement {
		Type = spriteElement
		PARENT = ds_container
		pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * ($left_column_y_end))
		Rot_Angle = 2
		Dims = (1016.0, 128.0)
		texture = Detailed_stats_sheet_bottom
		just = [Left top]
		z_priority = 2
	}
	num_left_side_paper_repetitions = 3
	y_position = 304
	total_desired_dim = ($left_column_y_end - $initial_column_y_end)
	piecewise_desired_dim = ((<total_desired_dim> + 39) / <num_left_side_paper_repetitions>)
	begin
	createScreenElement {
		Type = spriteElement
		PARENT = ds_container
		pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * <y_position>)
		Dims = ((32.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = Detailed_stats_sheet_L
		just = [Left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_left_side_paper_repetitions>
	num_right_side_paper_repetitions = 3
	y_position = 339
	piecewise_desired_dim = ((<total_desired_dim> + 37) / <num_right_side_paper_repetitions>)
	begin
	createScreenElement {
		Type = spriteElement
		PARENT = ds_container
		pos = ((1.0, 0.0) * 1087 + (0.0, 1.0) * <y_position>)
		Dims = ((64.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = Detailed_stats_sheet_R
		just = [Left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_right_side_paper_repetitions>
	createScreenElement {
		Type = spriteElement
		PARENT = ds_container
		pos = (139.0, 304.0)
		Dims = ((1.0, 0.0) * 976 + (0.0, 1.0) * (<total_desired_dim> + 70))
		rgba = [255 255 255 255]
		z_priority = 1
		just = [Left top]
	}
endscript

script add_divider_graphic 
	if ($is_network_game)
		divider_element_num = 8
		elseif ($current_num_players = 1 ||
			$game_mode = p2_career ||
			$game_mode = p2_coop)
		divider_element_num = 4
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff)
			divider_element_num = 7
			elseif ($game_mode = p2_battle)
			divider_element_num = 5
		else
			divider_element_num = 6
		endif
	endif
	if ($current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		divider_element_num = 3
	endif
	formatText Checksumname = entry_id '%c_column_%d' C = 'left' D = <divider_element_num>
	getScreenElementProps Id = <entry_id>
	divider_y = (<pos> [1])
	Printf "Divider_y = %d" D = <divider_y>
	createScreenElement {
		Type = spriteElement
		PARENT = ds_container
		pos = ((1.0, 0.0) * $center_column_x + (0.0, 1.0) * (<divider_y> - 8))
		scale = (2.5, 1.4)
		texture = Detailed_stats_divider
		just = [Center Center]
		z_priority = 5
	}
endscript
