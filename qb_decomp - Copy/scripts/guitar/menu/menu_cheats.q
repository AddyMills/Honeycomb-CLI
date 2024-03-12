guitar_hero_cheats = [
	{
		Name = AirGuitar
		name_text = "air guitar"
		var = Cheat_AirGuitar
		unlock_pattern = [
			272
			65792
			65792
			4112
			4112
			4352
			4352
			272
			65792
			65792
			4112
			4112
			4352
			4352
			65792
			65792
			4352
			4352
		]
	}
	{
		Name = PerformanceMode
		name_text = "performance mode"
		var = Cheat_PerformanceMode
		unlock_pattern = [
			4352
			4112
			4097
			4112
			4352
			65552
			4352
			4112
		]
	}
	{
		Name = Hyperspeed
		name_text = "hyperspeed"
		var = Cheat_hyperspeed
		unlock_pattern = [
			1
			16
			1
			256
			1
			16
			1
			256
		]
	}
	{
		Name = NoFail
		name_text = "no fail"
		var = Cheat_NoFail
		unlock_pattern = [
			69632
			16
			69632
			65792
			16
			65792
			4352
			1
			4352
			65792
			256
			65792
			69632
		]
	}
	{
		Name = EasyExpert
		name_text = "easy expert"
		var = Cheat_EasyExpert
		unlock_pattern = [
			69632
			65792
			272
			4112
			17
			257
			4352
			4112
		]
	}
	{
		Name = PrecisionMode
		name_text = "precision mode"
		var = Cheat_PrecisionMode
		unlock_pattern = [
			69632
			69632
			69632
			4352
			4352
			4112
			4112
			272
			257
			257
			69632
			69632
			69632
			4352
			4352
			4112
			4112
			272
			257
			257
		]
	}
	{
		Name = BretMichaels
		name_text = "bret micheals"
		var = Cheat_BretMichaels
		unlock_pattern = [
			69632
			69632
			69632
			65552
			65552
			65552
			4112
			4096
			4096
			4096
			4112
			4096
			4096
			4096
			4112
			4096
			4096
			4096
		]
	}
	{
		Name = unlockall
		name_text = "unlocked all songs"
		var = Cheat_UnlockAll
		unlock_pattern = [
			257
			4112
			4097
			65552
			4352
			257
			4352
			4112
			65792
			65792
			272
			272
			257
			257
			272
			256
			4096
			4352
			4096
			256
			1
		]
	}
	{
		Name = UnlockAllEverything
		name_text = "unlocked everything"
		var = Cheat_UnlockAll_Everything
		unlock_pattern = [
			69649
			69904
			69889
			65809
			69904
			4369
			69904
			65809
			69904
			69889
			69889
			69904
			69889
		]
	}
]
guitar_hero_cheats_completed = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
]

script clear_cheats 
	Change \{Cheat_AirGuitar = -1}
	Change \{Cheat_hyperspeed = -1}
	Change \{Cheat_PerformanceMode = -1}
	Change \{Cheat_NoFail = -1}
	Change \{Cheat_EasyExpert = -1}
	Change \{Cheat_PrecisionMode = -1}
	Change \{Cheat_BretMichaels = -1}
endscript

script create_cheats_menu 
	disable_pause
	if ($entering_cheat = 0)
		createScreenElement \{Type = containerElement Id = cheats_container PARENT = root_window pos = (0.0, 0.0)}
		create_menu_backdrop \{texture = Venue_BG}
		displaySprite \{PARENT = cheats_container tex = options_video_poster Rot_Angle = 1 pos = (640.0, 215.0) Dims = (820.0, 440.0) just = [Center Center] Z = 1 font = $video_settings_menu_font}
		displayText \{PARENT = cheats_container pos = (910.0, 402.0) just = [Right Center] Text = "CHEATS" scale = 1.5 rgba = [240 235 240 255] font = text_A5 noshadow}
		displaySprite \{PARENT = cheats_container tex = tape_H_03 pos = (270.0, 185.0) Rot_Angle = -50 scale = 0.5 Z = 20}
		displaySprite {
			PARENT = <Id>
			tex = tape_H_03
			pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			Z = 19
		}
		displaySprite \{PARENT = cheats_container tex = tape_H_04 pos = (930.0, 380.0) Rot_Angle = -120 scale = 0.5 Z = 20}
		displaySprite {
			PARENT = <Id>
			tex = tape_H_04
			pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			Z = 19
		}
		createScreenElement \{Type = containerElement Id = cheats_warning_container PARENT = root_window Alpha = 0 scale = 0.5 pos = (640.0, 540.0)}
		displaySprite \{PARENT = cheats_warning_container Id = cheats_warning tex = Control_pill_body pos = (0.0, 0.0) just = [Center Center] rgba = [96 0 0 255] Z = 100}
		getplatform
		switch <Platform>
			case XENON
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, achievement unlocking and leaderboard posts are turned off."
			case PS3
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, leaderboard posts are turned off."
			case PS2
			warning = "WARNING: Some active cheats do not work in career modes."
			warning_cont = ""
			default
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, leaderboard posts are turned off."
		endswitch
		formatText Textname = warning_text "%a %b" A = <warning> B = <warning_cont>
		createScreenElement {
			Type = textblockelement
			Id = first_warning
			PARENT = cheats_warning_container
			font = text_a6
			scale = 1
			Text = <warning_text>
			rgba = [186 105 0 255]
			just = [Center Center]
			z_priority = 101.0
			pos = (0.0, 0.0)
			Dims = (1400.0, 100.0)
			allow_expansion
		}
		getScreenElementDims \{Id = first_warning}
		bg_dims = (<width> * (1.0, 0.0) + (<Height> * (0.0, 1.0) + (0.0, 40.0)))
		cheats_warning :SetProps Dims = <bg_dims>
		displaySprite {
			PARENT = cheats_warning_container
			tex = Control_pill_end
			pos = (-1 * <width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			Dims = ((64.0, 0.0) + (<Height> * (0.0, 1.0) + (0.0, 40.0)))
			just = [Right Center]
			flip_v
			Z = 100
		}
		displaySprite {
			PARENT = cheats_warning_container
			tex = Control_pill_end
			pos = (<width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			Dims = ((64.0, 0.0) + (<Height> * (0.0, 1.0) + (0.0, 40.0)))
			just = [Left Center]
			Z = 100
		}
		cheats_create_guitar
	endif
	show_cheat_warning
	displaySprite \{PARENT = cheats_container Id = cheats_hilite tex = White rgba = [40 60 110 255] Rot_Angle = 1 pos = (349.0, 382.0) Dims = (230.0, 30.0) Z = 2}
	new_menu \{scrollid = cheats_scroll vmenuid = cheats_vmenu Menu_pos = (360.0, 191.0) text_left Spacing = -12 Rot_Angle = 1}
	text_params = {PARENT = cheats_vmenu Type = textElement font = text_a3 rgba = [255 245 225 255] z_priority = 50 Rot_Angle = 0 scale = 1}
	text_params2 = {PARENT = cheats_vmenu Type = textElement font = text_A5 rgba = [255 245 225 255] z_priority = 50 Rot_Angle = 0 scale = 0.63}
	getglobaltags \{user_options}
	<Text> = "locked"
	if (<unlock_Cheat_NoFail> > 0)
		if ($Cheat_NoFail = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [3].name_text)
		else
			if ($Cheat_NoFail < 0)
				Change \{Cheat_NoFail = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [3].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_NoFail_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 206.0) Id = Cheat_NoFail_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_NoFail Id = Cheat_NoFail_Text Index = 3}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_AirGuitar> > 0)
		if ($Cheat_AirGuitar = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [0].name_text)
		else
			if ($Cheat_AirGuitar < 0)
				Change \{Cheat_AirGuitar = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [0].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_AirGuitar_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 229.0) Id = Cheat_AirGuitar_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_AirGuitar Id = Cheat_AirGuitar_Text Index = 0}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_Hyperspeed> > 0)
		if ($Cheat_hyperspeed > 0)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [2].name_text)
			formatText Textname = Text "%c, %d" C = <Text> D = ($Cheat_hyperspeed)
		else
			if ($Cheat_hyperspeed < 0)
				Change \{Cheat_hyperspeed = 0}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [2].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_Hyperspeed_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 252.0) Id = Cheat_Hyperspeed_Text}}
			{pad_choose toggle_hyperspeed Params = {cheat = Cheat_hyperspeed Id = Cheat_Hyperspeed_Text Index = 2}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_PerformanceMode> > 0)
		if ($Cheat_PerformanceMode = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [1].name_text)
		else
			if ($Cheat_PerformanceMode < 0)
				Change \{Cheat_PerformanceMode = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [1].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_PerformanceMode_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 275.0) Id = Cheat_PerformanceMode_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_PerformanceMode Id = Cheat_PerformanceMode_Text Index = 1}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_EasyExpert> > 0)
		if ($Cheat_EasyExpert = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [4].name_text)
		else
			if ($Cheat_EasyExpert < 0)
				Change \{Cheat_EasyExpert = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [4].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_EasyExpert_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 298.0) Id = Cheat_EasyExpert_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_EasyExpert Id = Cheat_EasyExpert_Text Index = 4}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_PrecisionMode> > 0)
		if ($Cheat_PrecisionMode = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [5].name_text)
		else
			if ($Cheat_PrecisionMode < 0)
				Change \{Cheat_PrecisionMode = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [5].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_PrecisionMode_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 321.0) Id = Cheat_PrecisionMode_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_PrecisionMode Id = Cheat_PrecisionMode_Text Index = 5}}
		]
	}
	<Text> = "locked"
	if (<unlock_Cheat_BretMichaels> > 0)
		if ($Cheat_BretMichaels = 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [6].name_text)
		else
			if ($Cheat_BretMichaels < 0)
				Change \{Cheat_BretMichaels = 2}
			endif
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [6].name_text)
		endif
	endif
	createScreenElement {
		<text_params2>
		Text = <Text>
		Id = Cheat_BretMichaels_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 344.0) Id = Cheat_BretMichaels_Text}}
			{pad_choose toggle_cheat Params = {cheat = Cheat_BretMichaels Id = Cheat_BretMichaels_Text Index = 6}}
		]
	}
	createScreenElement {
		<text_params>
		Text = "enter cheat"
		Id = Cheat_EnterCheat_Text
		event_handlers = [
			{focus cheats_morph_hilite Params = {pos = (349.0, 375.0) Id = Cheat_EnterCheat_Text}}
			{pad_choose enter_new_cheat}
		]
	}
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	Change \{entering_cheat = 0}
	Change \{guitar_hero_cheats_completed = [0 0 0 0 0 0 0 0 0]}
endscript

script show_cheat_warning 
	if (Cheat_NoFail = 1 || Cheat_EasyExpert = 1)
		DoScreenElementMorph \{Id = cheats_warning_container Alpha = 1 Time = 0.1}
	else
		DoScreenElementMorph \{Id = cheats_warning_container Alpha = 0 Time = 0.1}
	endif
endscript

script enter_new_cheat 
	disable_pause
	Change \{entering_cheat = 1}
	ui_flow_manager_respond_to_action \{action = enter_new_cheat}
endscript

script cheats_morph_hilite \{Time = 0.025}
	getScreenElementDims Id = <Id>
	cheats_hilite :SetProps Dims = ((<width> * (1.0, 0.0)) + (22.0, 30.0))
	cheats_hilite :doMorph pos = <pos> Time = <Time>
endscript
entering_cheat = 0

script destroy_cheats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = cheats_scroll}
	if ScreenelementExists \{Id = cheats_hilite}
		DestroyScreenelement \{Id = cheats_hilite}
	endif
	if ($entering_cheat = 0)
		killspawnedScript \{Name = cheats_watch_buttons}
		if ScreenelementExists \{Id = cheats_container}
			DestroyScreenelement \{Id = cheats_container}
		endif
		if ScreenelementExists \{Id = cheats_warning_container}
			DestroyScreenelement \{Id = cheats_warning_container}
		endif
		cheats_destroy_pressed_notes
	endif
endscript

script cheats_create_guitar 
	createScreenElement \{PARENT = cheats_container Type = spriteElement Id = guitar_sprite just = [Left Center] texture = training_guitar pos = (1200.0, 545.0) Rot_Angle = 0 rgba = [255 255 255 255] scale = (1.0, 1.0) z_priority = 2}
endscript

script cheats_create_pressed_notes 
	x_offset = 67
	green_pos = (506.0, 537.0)
	red_pos = (<green_pos> + ((1.0, 0.0) * <x_offset>))
	yellow_pos = (<red_pos> + ((1.0, 0.0) * <x_offset>))
	blue_pos = (<yellow_pos> + ((1.0, 0.0) * <x_offset>))
	orange_pos = (<blue_pos> + ((1.0, 0.0) * <x_offset>))
	createScreenElement {
		PARENT = cheats_container
		Type = spriteElement
		Id = green_pressed_sprite
		just = [Center Center]
		texture = training_guitar_button_down
		pos = <green_pos>
		Rot_Angle = 0
		rgba = [0 165 130 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createScreenElement {
		PARENT = cheats_container
		Type = spriteElement
		Id = red_pressed_sprite
		just = [Center Center]
		texture = training_guitar_button_down
		pos = <red_pos>
		Rot_Angle = 0
		rgba = [230 80 90 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createScreenElement {
		PARENT = cheats_container
		Type = spriteElement
		Id = yellow_pressed_sprite
		just = [Center Center]
		texture = training_guitar_button_down
		pos = <yellow_pos>
		Rot_Angle = 0
		rgba = [220 160 25 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createScreenElement {
		PARENT = cheats_container
		Type = spriteElement
		Id = blue_pressed_sprite
		just = [Center Center]
		texture = training_guitar_button_down
		pos = <blue_pos>
		Rot_Angle = 0
		rgba = [0 135 210 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createScreenElement {
		PARENT = cheats_container
		Type = spriteElement
		Id = orange_pressed_sprite
		just = [Center Center]
		texture = training_guitar_button_down
		pos = <orange_pos>
		Rot_Angle = 0
		rgba = [215 120 40 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	hide_pressed_notes
endscript

script cheats_destroy_pressed_notes 
	Safe_Destroy \{Id = green_pressed_sprite}
	Safe_Destroy \{Id = red_pressed_sprite}
	Safe_Destroy \{Id = yellow_pressed_sprite}
	Safe_Destroy \{Id = orange_pressed_sprite}
	Safe_Destroy \{Id = blue_pressed_sprite}
endscript

script cheats_watch_buttons 
	Wait \{0.75 Seconds}
	cheats_create_pressed_notes
	begin
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	hide_pressed_notes
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		show_pressed_note note = <array_count>
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	Wait \{1 GameFrame}
	repeat
endscript

script cheats_zoomin_guitar 
	DoScreenElementMorph \{Id = cheats_warning_container Alpha = 0 Time = 1}
	event_handlers = [
		{pad_up create_cheat_guitar_strum}
		{pad_down create_cheat_guitar_strum}
		{pad_start ui_flow_manager_respond_to_action Params = {action = new_cheat_finished}}
	]
	new_menu {
		scrollid = menu_new_cheat
		vmenuid = vmenu_new_cheat
		Menu_pos = (0.0, 0.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	menu_music_off
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "FINISH ENTERING CHEAT" button = Start Z = 100 fit_to_rectangle = 0}
	add_user_control_helper \{Text = "UP/DOWN TO STRUM" button = Strumbar Z = 100 fit_to_rectangle = 0}
	SpawnScriptNOw \{cheats_watch_buttons}
	if ScreenelementExists \{Id = guitar_sprite}
		guitar_sprite :doMorph \{scale = (1.0, 1.0) pos = (140.0, 545.0) Time = 0.75}
	endif
endscript

script cheats_zoomout_guitar 
	SpawnScriptNOw \{Menu_Music_On}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	killspawnedScript \{Name = cheats_watch_buttons}
	cheats_destroy_pressed_notes
	if ScreenelementExists \{Id = awardtext}
		DestroyScreenelement \{Id = awardtext}
	endif
	killspawnedScript \{Name = cheat_award_text}
	destroy_menu \{menu_id = menu_new_cheat}
	Change \{entering_cheat = 0}
	destroy_cheats_menu
endscript
new_cheat_strum = 0

script stop_guitar_strum 
	Change \{new_cheat_strum = 0}
	begin
	if ($new_cheat_strum = 1)
		StopSoundEvent <Event>
		break
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script create_cheat_guitar_strum 
	Change \{new_cheat_strum = 1}
	Wait \{2 gameframes}
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	switch <hold_pattern>
		case 65536
		Soundevent \{Event = Cheat_Single_Strum_Note_1}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Single_Strum_Note_1 pattern_to_stop = <hold_pattern>}
		case 4096
		Soundevent \{Event = Cheat_Single_Strum_Note_2}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Single_Strum_Note_2 pattern_to_stop = <hold_pattern>}
		case 256
		Soundevent \{Event = Cheat_Single_Strum_Note_3}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Single_Strum_Note_3 pattern_to_stop = <hold_pattern>}
		case 16
		Soundevent \{Event = Cheat_Single_Strum_Note_4}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Single_Strum_Note_4 pattern_to_stop = <hold_pattern>}
		case 1
		Soundevent \{Event = Cheat_Single_Strum_Note_5}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Single_Strum_Note_5 pattern_to_stop = <hold_pattern>}
		case 69632
		Soundevent \{Event = Cheat_Chord_Strum_1}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_1 pattern_to_stop = <hold_pattern>}
		case 65792
		Soundevent \{Event = Cheat_Chord_Strum_10}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_10 pattern_to_stop = <hold_pattern>}
		case 65552
		Soundevent \{Event = Cheat_Chord_Strum_4}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_4 pattern_to_stop = <hold_pattern>}
		case 4352
		Soundevent \{Event = Cheat_Chord_Strum_2}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_2 pattern_to_stop = <hold_pattern>}
		case 4112
		Soundevent \{Event = Cheat_Chord_Strum_3}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_3 pattern_to_stop = <hold_pattern>}
		case 4097
		Soundevent \{Event = Cheat_Chord_Strum_6}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_6 pattern_to_stop = <hold_pattern>}
		case 272
		Soundevent \{Event = Cheat_Chord_Strum_5}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_5 pattern_to_stop = <hold_pattern>}
		case 257
		Soundevent \{Event = Cheat_Chord_Strum_7}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_7 pattern_to_stop = <hold_pattern>}
		case 17
		Soundevent \{Event = Cheat_Chord_Strum_8}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_8 pattern_to_stop = <hold_pattern>}
		case 69888
		Soundevent \{Event = Cheat_Chord_Strum_9}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_9 pattern_to_stop = <hold_pattern>}
		case 4368
		Soundevent \{Event = Cheat_Chord_Strum_11}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_11 pattern_to_stop = <hold_pattern>}
		case 273
		Soundevent \{Event = Cheat_Chord_Strum_12}
		SpawnScriptNOw stop_guitar_strum Params = {Event = Cheat_Chord_Strum_12 pattern_to_stop = <hold_pattern>}
		default
	endswitch
	getArraySize \{$guitar_hero_cheats}
	num_of_cheats = <array_Size>
	<Index> = 0
	begin
	pattern_array = ($guitar_hero_cheats [<Index>].unlock_pattern)
	completed_index = ($guitar_hero_cheats_completed [<Index>])
	if (<hold_pattern> = (<pattern_array> [<completed_index>]))
		Printf Channel = trchen "MATCH CHEAT: %s, STEP: %l" S = <Index> L = <completed_index>
		setarrayelement Arrayname = guitar_hero_cheats_completed globalArray Index = <Index> NewValue = (<completed_index> + 1)
		getArraySize \{pattern_array}
		if (<array_Size> = ($guitar_hero_cheats_completed [<Index>]))
			Printf Channel = trchen "CHEAT %s UNLOCKED!" S = <Index>
			unlock_cheat cheat = ($guitar_hero_cheats [<Index>].var) Index = <Index>
			setarrayelement Arrayname = guitar_hero_cheats_completed globalArray Index = <Index> NewValue = 0
		endif
	else
		if (<hold_pattern> = (<pattern_array> [0]))
			Printf Channel = trchen "MATCH CHEAT: %s, STEP: 0" S = <Index>
			setarrayelement Arrayname = guitar_hero_cheats_completed globalArray Index = <Index> NewValue = 1
		else
			setarrayelement Arrayname = guitar_hero_cheats_completed globalArray Index = <Index> NewValue = 0
		endif
	endif
	<Index> = (<Index> + 1)
	repeat <num_of_cheats>
endscript

script cheat_award_text \{show_unlock = 1}
	if ScreenelementExists \{Id = awardtext}
		DestroyScreenelement \{Id = awardtext}
	endif
	award_text = ($guitar_hero_cheats [<Index>].name_text)
	createScreenElement {
		Type = textElement
		Id = awardtext
		PARENT = cheats_container
		pos = (360.0, 360.0)
		Text = <award_text>
		font = text_a3
		Rot_Angle = 1
		scale = 1
		rgba = [255 255 255 255]
		just = [Left Center]
		z_priority = 25
	}
	if (<show_unlock> = 1)
		createScreenElement \{Type = textElement Id = awardtext_sub PARENT = awardtext pos = (1.0, 57.0) Text = "unlocked" font = text_a3 scale = 0.7 rgba = [255 255 255 255] just = [Left Center] z_priority = 25}
	endif
	Wait \{1.5 Seconds}
	DoScreenElementMorph \{Id = awardtext Alpha = 0 Time = 1}
endscript

script unlock_cheat 
	if (<cheat> = Cheat_UnlockAll)
		GlobalTags_UnlockAll \{Songlist = GH3_General_Songs songs_only = 1}
		GlobalTags_UnlockAll \{Songlist = GH3_GeneralP2_Songs songs_only = 1}
		GlobalTags_UnlockAll \{Songlist = GH3_Bonus_Songs songs_only = 1}
		getArraySize ($GH3_Bonus_Songs.tier1.songs)
		I = 0
		begin
		setGlobalTags ($GH3_Bonus_Songs.tier1.songs [<I>]) Params = {unlocked = 1}
		<I> = (<I> + 1)
		repeat <array_Size>
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		SpawnScriptNOw cheat_award_text Params = {Index = <Index> show_unlock = 0}
		return
	endif
	if (<cheat> = Cheat_UnlockAll_Everything)
		GlobalTags_UnlockAll \{Songlist = GH3_General_Songs}
		GlobalTags_UnlockAll \{Songlist = GH3_GeneralP2_Songs}
		GlobalTags_UnlockAll \{Songlist = GH3_Bonus_Songs}
		getArraySize ($GH3_Bonus_Songs.tier1.songs)
		I = 0
		begin
		setGlobalTags ($GH3_Bonus_Songs.tier1.songs [<I>]) Params = {unlocked = 1}
		<I> = (<I> + 1)
		repeat <array_Size>
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		SpawnScriptNOw cheat_award_text Params = {Index = <Index> show_unlock = 0}
		return
	endif
	if (<cheat> = Cheat_EasyExpert)
		if NOT ($Cheat_PrecisionMode = 1)
			Change \{check_time_early = $original_check_time_early}
			Change \{check_time_late = $original_check_time_late}
		endif
	endif
	if (<cheat> = Cheat_PrecisionMode)
		if NOT ($Cheat_EasyExpert = 1)
			Change \{check_time_early = $original_check_time_early}
			Change \{check_time_late = $original_check_time_late}
		endif
	endif
	if NOT (<cheat> > 0)
		Soundevent \{Event = Crowd_OneShots_Cheer_Close}
		Change globalName = <cheat> NewValue = 2
		updateUnlockedCheats
		SpawnScriptNOw cheat_award_text Params = {Index = <Index>}
	endif
endscript

script updateUnlockedCheats 
	if ($Cheat_AirGuitar > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_AirGuitar = 1}}
	endif
	if ($Cheat_PerformanceMode > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_PerformanceMode = 1}}
	endif
	if ($Cheat_hyperspeed > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_Hyperspeed = 1}}
	endif
	if ($Cheat_NoFail > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_NoFail = 1}}
	endif
	if ($Cheat_EasyExpert > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_EasyExpert = 1}}
	endif
	if ($Cheat_PrecisionMode > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_PrecisionMode = 1}}
	endif
	if ($Cheat_BretMichaels > 0)
		setGlobalTags \{user_options Params = {unlock_Cheat_BretMichaels = 1}}
	endif
endscript
original_check_time_early = 0.116
original_check_time_late = 0.1

script toggle_hyperspeed 
	if ($<cheat> >= 0)
		if ($<cheat> = 5)
			Change globalName = <cheat> NewValue = 0
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [<Index>].name_text)
			setScreenElementProps Id = <Id> Text = <Text>
		else
			Change globalName = <cheat> NewValue = ($<cheat> + 1)
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [<Index>].name_text)
			formatText Textname = Text "%c, %d" C = <Text> D = ($Cheat_hyperspeed)
			setScreenElementProps Id = <Id> Text = <Text>
		endif
	endif
endscript

script toggle_cheat 
	if ($<cheat> > 0)
		if ($<cheat> = 1)
			Change globalName = <cheat> NewValue = 2
			formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [<Index>].name_text)
			setScreenElementProps Id = <Id> Text = <Text>
			if ($Cheat_EasyExpert = 2 || $Cheat_PrecisionMode = 2)
				Change \{check_time_early = $original_check_time_early}
				Change \{check_time_late = $original_check_time_late}
			endif
		else
			Change globalName = <cheat> NewValue = 1
			formatText Textname = Text "%c : ON" C = ($guitar_hero_cheats [<Index>].name_text)
			turnOn_cheat = ($guitar_hero_cheats [<Index>].Name)
			setScreenElementProps Id = <Id> Text = <Text>
			if (<turnOn_cheat> = EasyExpert)
				Change check_time_early = ($original_check_time_early * 2)
				Change check_time_late = ($original_check_time_late * 2)
				if ($Cheat_PrecisionMode = 1)
					formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [5].name_text)
					Change \{globalName = Cheat_PrecisionMode NewValue = 2}
					setScreenElementProps Id = Cheat_PrecisionMode_Text Text = <Text>
				endif
			endif
			if (<turnOn_cheat> = PrecisionMode)
				Change check_time_early = ($original_check_time_early / 2)
				Change check_time_late = ($original_check_time_late / 2)
				if ($Cheat_EasyExpert = 1)
					formatText Textname = Text "%c : OFF" C = ($guitar_hero_cheats [4].name_text)
					Change \{globalName = Cheat_EasyExpert NewValue = 2}
					setScreenElementProps Id = Cheat_EasyExpert_Text Text = <Text>
				endif
			endif
		endif
	else
		setScreenElementProps Id = <Id> Text = "locked"
	endif
	show_cheat_warning
endscript
