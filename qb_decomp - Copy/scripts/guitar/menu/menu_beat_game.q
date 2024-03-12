beat_game_title = "\\c6YOU BEAT GUITAR HERO III ON \\c0%d\\c6!\\c0"
beat_game_message = "Think you've got what it takes to really\\n blow their minds? Try this bad boy out on \\c1%n\\c0. There may be a reward waiting for you if you succeed. Pain, fame and glory await, lil' rocker."
beat_game_message_expert = "Wow. You've mastered expert -- Go start a band already! Take it to the next level with the \\c1%n\\c0! Cheats can be unlocked in the options menu."

script create_beat_game_menu 
	create_menu_backdrop \{texture = Beat_Game_BG}
	menu_font = fontgrid_title_gh3
	get_current_band_info
	getglobaltags <band_info> param = Name
	band_name = <Name>
	formatText Textname = band_name_text "%s" S = <band_name>
	difficulty_text = "EXPERT"
	next_difficulty_text = "PRECISION MODE CHEAT"
	<DIFFICULTY> = ($current_difficulty)
	if ($game_mode = p2_career)
		<index1> = ($difficulty_list_props.($current_difficulty).Index)
		<index2> = ($difficulty_list_props.($current_difficulty2).Index)
		if (<index2> < <index1>)
			<DIFFICULTY> = ($current_difficulty2)
		endif
	endif
	switch (<DIFFICULTY>)
		case EASY
		<difficulty_text> = "EASY"
		next_difficulty = MEDIUM
		<next_difficulty_text> = "MEDIUM"
		case MEDIUM
		<difficulty_text> = "MEDIUM"
		next_difficulty = HARD
		<next_difficulty_text> = "HARD"
		case HARD
		<difficulty_text> = "HARD"
		next_difficulty = EXPERT
		<next_difficulty_text> = "EXPERT"
	endswitch
	createScreenElement \{Type = containerElement PARENT = root_window Id = beat_game_container pos = (0.0, 0.0) just = [Left top]}
	createScreenElement {
		Type = textElement
		PARENT = beat_game_container
		Id = bgs_band_name
		just = [Center top]
		font = <menu_font>
		Text = <band_name_text>
		scale = 1.38
		rgba = [140 70 70 255]
		pos = (640.0, 366.0)
	}
	getScreenElementDims \{Id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{Id = bgs_band_name Dims = (1060.0, 130.0) pos = (640.0, 366.0)}
	endif
	formatText Textname = Title_text $beat_game_title D = <difficulty_text>
	createScreenElement {
		Type = textElement
		PARENT = beat_game_container
		Id = bgs_under_title
		just = [Left top]
		font = <menu_font>
		Text = <Title_text>
		scale = 1.0
		rgba = [250 245 145 255]
	}
	fit_text_in_rectangle \{Id = bgs_under_title Dims = (700.0, 65.0) pos = (300.0, 428.0)}
	if (<DIFFICULTY> = EXPERT)
		formatText Textname = motivation_text ($beat_game_message_expert) N = <next_difficulty_text>
	else
		formatText Textname = motivation_text ($beat_game_message) N = <next_difficulty_text>
	endif
	createScreenElement {
		Type = textblockelement
		PARENT = beat_game_container
		font = text_a4
		Text = <motivation_text>
		Dims = (1100.0, 700.0)
		pos = (640.0, 468.0)
		rgba = [250 245 145 255]
		just = [Center top]
		internal_just = [Center top]
		scale = 0.7
		z_priority = 3
	}
	<cheat> = "ROCK YOU LIKE A HURRICANE RIFF x 2"
	formatText Textname = cheat_text "CHEAT HINT: %c" C = <cheat>
	if (<DIFFICULTY> = EXPERT)
		createScreenElement {
			Type = textElement
			PARENT = beat_game_container
			Id = bgs_cheat_text
			just = [Center top]
			font = <menu_font>
			Text = <cheat_text>
			scale = 0.5
			pos = (640.0, 622.0)
			rgba = [250 245 145 255]
		}
	endif
	button_font = buttonsxenon
	displaySprite \{Id = bgs_black_banner PARENT = beat_game_container tex = White pos = (0.0, -2.0) Dims = (1240.0, 100.0) rgba = [0 0 0 255] Z = -2}
	createScreenElement {
		Type = textElement
		PARENT = beat_game_container
		Id = continue_text
		scale = 1.0
		pos = (40.0, 20.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [Left Center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
	SpawnScriptNOw scroll_band_name Params = {band_text = <band_name_text>}
	launchevent \{Type = focus Target = continue_text}
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "CONTINUE" button = Green Z = 100}
endscript

script destroy_beat_game_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	killspawnedScript \{Name = scroll_band_name}
endscript

script scroll_band_name 
	displayText Id = scrolling_bandname1 PARENT = beat_game_container pos = (0.0, 34.0) scale = 1 font = <menu_font> Text = <band_text> rgba = [124 77 65 255] Z = -1
	getScreenElementDims \{Id = scrolling_bandname1}
	multi = (1280 / <width>)
	band_text_with_space = (<band_text> + " ")
	long_band_text = <band_text_with_space>
	StringLength String = <band_text_with_space>
	<band_text_with_space_length> = <str_len>
	begin
	StringLength String = <long_band_text>
	<long_band_text_length> = <str_len>
	if NOT (<long_band_text_length> < (127 - <band_text_with_space_length>))
		break
	endif
	<long_band_text> = (<long_band_text> + <band_text_with_space>)
	setScreenElementProps Id = scrolling_bandname1 Text = <long_band_text>
	getScreenElementDims \{Id = scrolling_bandname1}
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	setScreenElementProps Id = scrolling_bandname1 Text = <long_band_text>
	fit_text_in_rectangle Id = scrolling_bandname1 Dims = ((1280.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (0.0, 34.0)
	displayText Id = scrolling_bandname2 PARENT = beat_game_container scale = 1 font = <menu_font> Text = <long_band_text> rgba = [124 77 65 255] Z = -1
	getScreenElementDims \{Id = scrolling_bandname1}
	fit_text_in_rectangle Id = scrolling_bandname2 Dims = ((1280.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
	First = 1
	begin
	if (<First>)
		DoScreenElementMorph Id = scrolling_bandname1 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) Time = 5
		DoScreenElementMorph \{Id = scrolling_bandname2 pos = (0.0, 34.0) Time = 5}
	else
		DoScreenElementMorph Id = scrolling_bandname2 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) Time = 5
		DoScreenElementMorph \{Id = scrolling_bandname1 pos = (0.0, 34.0) Time = 5}
	endif
	Wait \{5 Seconds}
	if (<First>)
		setScreenElementProps Id = scrolling_bandname1 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		setScreenElementProps \{Id = scrolling_bandname2 pos = (0.0, 34.0)}
		<First> = 0
	else
		setScreenElementProps Id = scrolling_bandname2 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		setScreenElementProps \{Id = scrolling_bandname1 pos = (0.0, 34.0)}
		<First> = 1
	endif
	repeat
endscript
