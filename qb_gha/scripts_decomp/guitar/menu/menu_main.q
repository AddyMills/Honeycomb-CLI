g_mm_base_menu_pos = (874.0, 340.0)
g_mm_menu_max_width = 220

script create_main_menu_backdrop 
	shut_down_character_hub
	create_menu_backdrop \{texture = GH3_Main_Menu_BG}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_text_container
		parent = root_window
		Pos = ($g_mm_base_menu_pos)
		just = [left top]
		z_priority = 3
	}
	CreateScreenElement \{type = ContainerElement id = main_menu_bg_container parent = root_window Pos = (0.0, 0.0) z_priority = 3}
	CreateScreenElement \{type = SpriteElement id = main_menu_godrays1 parent = main_menu_bg_container texture = main_menu_bg2 Pos = (400.0, 330.0) dims = (1280.0, 1280.0) just = [center center] z_priority = 1 alpha = 0 Blend = Add}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 30 id = <id>}
	CreateScreenElement \{type = SpriteElement id = main_menu_godrays2 parent = main_menu_bg_container texture = main_menu_bg2 Pos = (400.0, 330.0) dims = (1280.0, 1280.0) just = [center center] z_priority = 1 alpha = 0 Blend = Add flip_v}
	RunScriptOnScreenElement id = <id> rotate_menu_element params = {time = 60 id = <id>}
	CreateScreenElement \{type = SpriteElement parent = main_menu_bg_container texture = main_menu_illustrations Pos = (55.0, 0.0) dims = (720.0, 720.0) just = [left top] z_priority = 2 alpha = 0.9}
	CreateScreenElement \{type = SpriteElement parent = main_menu_bg_container texture = main_menu_logo Pos = (870.0, 45.0) Scale = 1 just = [center top] z_priority = 2}
	if IsWinPort
		WinPortGetAppFullVersion
		FormatText textname = version_string_display "VERSION %s" s = <version_string>
		CreateScreenElement {
			type = TextElement
			id = version_text
			parent = main_menu_bg_container
			text = <version_string_display>
			font = text_a5
			Pos = (130.0, 656.0)
			Scale = (0.5, 0.5)
			rgba = (($g_menu_colors).md_violet_grey)
			just = [left top]
			font_spacing = 0
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = (($g_menu_colors).Block)
			z_priority = 60
		}
	endif
endscript

script WinPortCreateLaptopUi 
	z = 1000000
	CreateScreenElement {
		type = SpriteElement
		id = batteryElem
		parent = root_window
		texture = battery_charging
		Pos = (65.0, 721.0)
		Scale = (0.66, 0.66)
		just = [left bottom]
		z_priority = <z>
		hide
	}
	CreateScreenElement {
		type = SpriteElement
		id = batteryLevelElem
		parent = root_window
		texture = battery_level0
		Pos = (65.0, 721.0)
		Scale = (0.66, 0.66)
		just = [left bottom]
		z_priority = (<z> - 1)
		hide
	}
	CreateScreenElement {
		type = SpriteElement
		id = wirelessElem
		parent = root_window
		texture = wifi_bar0
		Pos = (1201.0, 716.0)
		Scale = (0.66, 0.66)
		just = [RIGHT bottom]
		z_priority = <z>
		hide
	}
	spawnscriptnow \{WinPortUpdateLaptopUi}
endscript

script WinPortUpdateLaptopUi 
	begin
	WinPortGetLaptopInfo
	if (<batteryPercent> > -1)
		if (<batteryCharging> = 1)
			SetScreenElementProps \{id = batteryElem unhide texture = battery_charging}
		else
			SetScreenElementProps \{id = batteryElem unhide texture = battery}
		endif
		MathFloor ((<batteryPercent> + 1) / 12.5)
		FormatText checksumname = batteryLevelImage 'battery_level%a' a = <floor>
		SetScreenElementProps id = batteryLevelElem unhide texture = <batteryLevelImage>
	else
		SetScreenElementProps \{id = batteryElem hide}
		SetScreenElementProps \{id = batteryLevelElem hide}
	endif
	if (<wirelessPercent> > -1)
		MathFloor ((<wirelessPercent> + 1) / 20)
		FormatText checksumname = wirelessImage 'wifi_bar%a' a = <floor>
		SetScreenElementProps id = wirelessElem unhide texture = <wirelessImage>
	else
		SetScreenElementProps \{id = wirelessElem hide}
	endif
	wait \{5 seconds}
	repeat
endscript
main_menu_movie_first_time = 1
main_menu_created = 0

script create_main_menu 
	if IsWinPort
		shut_down_net_play
		if ($main_menu_created = 0)
			if WinPortSioIsKeyboard \{deviceNum = $primary_controller}
				SetGlobalTags \{user_options params = {lefty_flip_p1 = 1}}
			else
				guitarCount = 0
				if IsGuitarController \{controller = 0}
					guitarCount = (<guitarCount> + 1)
				endif
				if IsGuitarController \{controller = 1}
					guitarCount = (<guitarCount> + 1)
				endif
				if IsGuitarController \{controller = 2}
					guitarCount = (<guitarCount> + 1)
				endif
				if (<guitarCount> < 2)
					SetGlobalTags \{user_options params = {lefty_flip_p2 = 1}}
				endif
			endif
			WinPortCreateLaptopUi
		endif
	endif
	change \{winport_is_in_online_menu_system = 0}
	change \{main_menu_created = 1}
	ResetScoreUpdateReady
	GetGlobalTags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	setsoundbussparams {crowd = {vol = ($Default_BussSet.crowd.vol)}}
	if ($main_menu_movie_first_time = 0)
		fadetoblack \{on time = 0 alpha = 1.0 z_priority = 900}
	endif
	create_main_menu_backdrop
	if ($main_menu_movie_first_time = 0 && $invite_controller = -1)
		change \{main_menu_movie_first_time = 1}
		fadetoblack \{Off time = 0}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	kill_start_key_binding
	UnPauseGame
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	change \{player_controls_valid = 0}
	disable_pause
	spawnscriptnow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	DeRegisterAtoms
	RegisterAtoms \{name = achievement $Achievement_Atoms}
	change \{setlist_previous_tier = 1}
	change \{setlist_previous_song = 0}
	change \{setlist_previous_tab = tab_setlist}
	change \{current_song = beyondbeautiful}
	change \{end_credits = 0}
	change \{battle_sudden_death = 0}
	change \{structurename = player1_status character_id = axel}
	change \{structurename = player2_status character_id = axel}
	safe_create_gh3_pause_menu
	new_menu {
		scrollid = main_menu_scrolling_menu
		vmenuid = vmenu_main_menu
		use_backdrop = 0
		menu_pos = ($g_mm_base_menu_pos)
		focus_color = dk_violet_red
		unfocus_color = md_violet_grey
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_menu_pad_back params = {callback = menu_flow_go_back}}
		]
	}
	change \{rich_presence_context = presence_main_menu}
	<text_x_scale> = 0.8
	<text_y_scale> = 1.0
	text_params = {
		type = TextElement
		font = text_a5
		Scale = ((<text_x_scale> * (1.0, 0.0)) + (<text_y_scale> * (0.0, 1.0)))
		rgba = (($g_menu_colors).md_violet_grey)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).Block)
		z_priority = 60
	}
	<menu_offset> = (0.0, 45.0)
	<HLBar_dims> = (240.0, 45.0)
	<BE_dims> = (32.0, 46.0)
	<BEL_pos> = ((((<HLBar_dims>.(-1.0, 0.0)) / 2) * (1.0, 0.0)) + (-16.0, 0.0))
	<BER_pos> = ((((<HLBar_dims>.(1.0, 0.0)) / 2) * (1.0, 0.0)) + (16.0, 0.0))
	mm_hilite_color = (($g_menu_colors).lt_plum)
	CreateScreenElement \{type = ContainerElement id = main_menu_career parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'career'}}{unfocus main_menu_unhighlight params = {option = 'career'}}{pad_choose main_menu_select_career}]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_career
		id = main_menu_career_text
		text = "CAREER"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement \{type = ContainerElement id = main_menu_career_HL Pos = (0.0, -8.0) parent = main_menu_career alpha = 0}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_career_HLBar
		parent = main_menu_career_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_career_BEL
		parent = main_menu_career_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_career_BER
		parent = main_menu_career_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_career_HL Scale = (1.0, 0.01) relative_scale}
	CreateScreenElement \{type = ContainerElement id = main_menu_quickplay parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'quickplay'}}{unfocus main_menu_unhighlight params = {option = 'quickplay'}}{pad_choose main_menu_select_quickplay}]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_quickplay
		id = main_menu_quickplay_text
		Pos = (<menu_offset>)
		text = "QUICKPLAY"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_quickplay_HL
		parent = main_menu_career
		Pos = (<menu_offset> + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_quickplay_HLBar
		parent = main_menu_quickplay_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_quickplay_BEL
		parent = main_menu_quickplay_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_quickplay_BER
		parent = main_menu_quickplay_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_quickplay_HL Scale = (1.0, 0.01) relative_scale}
	CreateScreenElement \{type = ContainerElement id = main_menu_multiplayer parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'multiplayer'}}{unfocus main_menu_unhighlight params = {option = 'multiplayer'}}{pad_choose main_menu_select_multiplayer}]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_multiplayer
		id = main_menu_multiplayer_text
		Pos = (<menu_offset> * 2)
		text = "MULTIPLAYER"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_multiplayer_HL
		parent = main_menu_career
		Pos = ((<menu_offset> * 2) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_multiplayer_HLBar
		parent = main_menu_multiplayer_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_multiplayer_BEL
		parent = main_menu_multiplayer_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_multiplayer_BER
		parent = main_menu_multiplayer_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_multiplayer_HL Scale = (1.0, 0.01) relative_scale}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_training
		parent = vmenu_main_menu
		event_handlers = [
			{focus main_menu_highlight params = {option = 'training'}}
			{unfocus main_menu_unhighlight params = {option = 'training'}}
			{pad_choose main_menu_select_training}
		]
		<demo_mode_disable>
	}
	CreateScreenElement {
		<text_params>
		parent = main_menu_training
		id = main_menu_training_text
		Pos = (<menu_offset> * 3)
		text = "TRAINING"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_training_HL
		parent = main_menu_career
		Pos = ((<menu_offset> * 3) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_training_HLBar
		parent = main_menu_training_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_training_BEL
		parent = main_menu_training_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_training_BER
		parent = main_menu_training_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_training_HL Scale = (1.0, 0.01) relative_scale}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_leaderboards
		parent = vmenu_main_menu
		event_handlers = [
			{focus main_menu_highlight params = {option = 'leaderboards'}}
			{unfocus main_menu_unhighlight params = {option = 'leaderboards'}}
			{pad_choose main_menu_select_winport_online}
		]
		<demo_mode_disable>
	}
	if IsXenon
		CreateScreenElement {
			<text_params>
			parent = main_menu_leaderboards
			id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			text = "ONLINE"
		}
	else
		CreateScreenElement {
			<text_params>
			parent = main_menu_leaderboards
			id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			text = "ONLINE"
		}
	endif
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_leaderboards_HL
		parent = main_menu_career
		Pos = ((<menu_offset> * 4) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_leaderboards_HLBar
		parent = main_menu_leaderboards_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_leaderboards_BEL
		parent = main_menu_leaderboards_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_leaderboards_BER
		parent = main_menu_leaderboards_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_leaderboards_HL Scale = (1.0, 0.01) relative_scale}
	CreateScreenElement \{type = ContainerElement id = main_menu_options parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'options'}}{unfocus main_menu_unhighlight params = {option = 'options'}}{pad_choose main_menu_select_options}]}
	CreateScreenElement {
		<text_params>
		parent = main_menu_options
		id = main_menu_options_text
		Pos = (<menu_offset> * 5)
		text = "OPTIONS"
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle {
		id = <id>
		dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		type = ContainerElement
		id = main_menu_options_HL
		parent = main_menu_career
		Pos = ((<menu_offset> * 5) + (0.0, -8.0))
		alpha = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_options_HLBar
		parent = main_menu_options_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <HLBar_dims>
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_options_BEL
		parent = main_menu_options_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		id = main_menu_options_BER
		parent = main_menu_options_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		alpha = 1
		dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{id = main_menu_options_HL Scale = (1.0, 0.01) relative_scale}
	if IsWinPort
		CreateScreenElement \{type = ContainerElement id = main_menu_exit parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'exit'}}{unfocus main_menu_unhighlight params = {option = 'exit'}}{pad_choose main_menu_select_exit}]}
		CreateScreenElement {
			<text_params>
			parent = main_menu_exit
			id = main_menu_exit_text
			Pos = (<menu_offset> * 6)
			text = "EXIT"
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle {
			id = <id>
			dims = ((<height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
			only_if_larger_x = 1
			start_x_scale = <text_x_scale>
			start_y_scale = <text_y_scale>
		}
		CreateScreenElement {
			type = ContainerElement
			id = main_menu_exit_HL
			parent = main_menu_career
			Pos = ((<menu_offset> * 6) + (0.0, -8.0))
			alpha = 0
		}
		CreateScreenElement {
			type = SpriteElement
			id = main_menu_exit_HLBar
			parent = main_menu_exit_HL
			texture = hilite_bar_01
			rgba = <mm_hilite_color>
			alpha = 1
			dims = <HLBar_dims>
		}
		CreateScreenElement {
			type = SpriteElement
			id = main_menu_exit_BEL
			parent = main_menu_exit_HL
			texture = character_hub_hilite_bookend
			rgba = <mm_hilite_color>
			alpha = 1
			dims = <BE_dims>
			Pos = <BEL_pos>
			flip_v
		}
		CreateScreenElement {
			type = SpriteElement
			id = main_menu_exit_BER
			parent = main_menu_exit_HL
			texture = character_hub_hilite_bookend
			rgba = <mm_hilite_color>
			alpha = 1
			dims = <BE_dims>
			Pos = <BER_pos>
		}
		DoScreenElementMorph \{id = main_menu_exit_HL Scale = (1.0, 0.01) relative_scale}
	endif
	if ($enable_button_cheats = 1)
		CreateScreenElement \{type = ContainerElement id = main_menu_debug_menu parent = vmenu_main_menu event_handlers = [{focus main_menu_highlight params = {option = 'debug_menu'}}{unfocus main_menu_unhighlight params = {option = 'debug_menu'}}{pad_choose ui_flow_manager_respond_to_action params = {action = select_debug_menu}}]}
		CreateScreenElement {
			<text_params>
			Scale = (0.5, 0.5)
			parent = main_menu_debug_menu
			id = main_menu_debug_menu_text
			Pos = (<menu_offset> * 6)
			text = "DEBUG MENU"
		}
	endif
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
	if NOT ($invite_controller = -1)
		change \{invite_controller = -1}
		ui_flow_manager_respond_to_action \{action = select_xbox_live}
		fadetoblack \{Off time = 0}
	else
		LaunchEvent \{type = focus target = vmenu_main_menu}
	endif
endscript

script main_menu_highlight 
	<time> = 0
	<a> = 0.6
	FormatText checksumname = text_id 'main_menu_%o_text' o = <option>
	SetScreenElementProps id = <text_id> no_shadow
	DoScreenElementMorph {
		id = <text_id>
		rgba = ($menu_focus_color)
		time = <time>
	}
	if NOT (<option> = 'debug_menu')
		FormatText checksumname = hl_id 'main_menu_%o_HL' o = <option>
		DoScreenElementMorph id = <hl_id> alpha = <a> Scale = (1.0, 1.0) time = <time>
		RunScriptOnScreenElement id = <hl_id> wiggle_hilite params = {id = <hl_id>}
	endif
endscript

script main_menu_unhighlight 
	<time> = 0.6
	FormatText checksumname = text_id 'main_menu_%o_text' o = <option>
	SetScreenElementProps id = <text_id> shadow shadow_offs = (3.0, 3.0) shadow_rgba = (($g_menu_colors).black)
	DoScreenElementMorph {
		id = <text_id>
		rgba = ($menu_unfocus_color)
		time = (<time> / 4)
	}
	if NOT (<option> = 'debug_menu')
		FormatText checksumname = hl_id 'main_menu_%o_HL' o = <option>
		DoScreenElementMorph id = <hl_id> alpha = 0.2 Scale = 1
		DoScreenElementMorph id = <hl_id> alpha = 0 Scale = 0.9 time = <time> motion = ease_out
	endif
endscript

script wiggle_hilite 
	if NOT ScreenElementExists id = <id>
		return
	endif
	<id> :DoMorph Pos = {(0.0, 2.0) relative} Scale = 1.02 time = 0.05
	<id> :DoMorph Pos = {(0.0, -3.0) relative} Scale = 0.97999996 time = 0.05
	<id> :DoMorph Pos = {(0.0, 1.0) relative} Scale = 1.0 time = 0.05
	return
endscript

script glow_new_downloads_text 
	begin
	if ScreenElementExists \{id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph alpha = 0 time = <time>
	endif
	if ScreenElementExists \{id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph alpha = 1 time = <time>
	endif
	repeat
endscript

script glow_menu_element \{on = 1 Off = 1 tween = 1}
	if NOT ScreenElementExists id = <id>
		return
	endif
	wait RandomRange (0.0, 5.0) seconds
	begin
	<id> :DoMorph alpha = 1 time = <tween> motion = smooth
	wait <on> seconds
	<id> :DoMorph alpha = 0 time = <tween> motion = smooth
	wait <Off> seconds
	repeat
endscript

script rotate_menu_element \{time = 30}
	if NOT ScreenElementExists id = <id>
		return
	endif
	rot_interval = (<time> / 4)
	wait RandomRange (0.0, 2.0) seconds
	clockwise = Random (@ 1 @ 0 )
	if (<clockwise> = 1)
		begin
		<id> :DoMorph alpha = 0 rot_angle = 0
		<id> :DoMorph rot_angle = 90 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = 180 alpha = Random (@ 1.0 @ 0.0 )time = <rot_interval>
		<id> :DoMorph rot_angle = 270 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = 359 alpha = 0 time = <rot_interval>
		repeat
	else
		begin
		<id> :DoMorph alpha = 0 rot_angle = 0
		<id> :DoMorph rot_angle = -90 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = -180 alpha = Random (@ 1.0 @ 0.0 )time = <rot_interval>
		<id> :DoMorph rot_angle = -270 alpha = Random (@ 0.25 @ 0.5 )time = <rot_interval>
		<id> :DoMorph rot_angle = -359 alpha = 0 time = <rot_interval>
		repeat
	endif
endscript

script destroy_main_menu 
	KillSpawnedScript \{name = glow_new_downloads_text}
	clean_up_user_control_helpers
	printstruct x = ($ui_flow_manager_state)
	destroy_menu \{menu_id = main_menu_scrolling_menu}
	destroy_menu \{menu_id = main_menu_text_container}
	destroy_menu_backdrop
	DestroyScreenElement \{id = main_menu_bg_container}
endscript

script main_menu_select_career 
	change \{game_mode = p1_career}
	change \{current_num_players = 1}
	change \{structurename = player1_status part = guitar}
	change \{structurename = player2_status part = guitar}
	ui_flow_manager_respond_to_action \{action = select_career}
endscript

script main_menu_select_quickplay 
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
	change \{structurename = player1_status part = guitar}
	change \{structurename = player2_status part = guitar}
	ui_flow_manager_respond_to_action \{action = select_quickplay}
endscript

script main_menu_select_multiplayer 
	change \{game_mode = p2_faceoff}
	change \{current_num_players = 2}
	change \{structurename = player1_status part = guitar}
	change \{structurename = player2_status part = guitar}
	ui_flow_manager_respond_to_action \{action = select_multiplayer}
endscript

script main_menu_select_training 
	change \{game_mode = training}
	change \{current_num_players = 1}
	change \{came_to_practice_from = main_menu}
	change \{structurename = player1_status part = guitar}
	change \{structurename = player2_status part = guitar}
	ui_flow_manager_respond_to_action \{action = select_training}
endscript

script main_menu_select_xbox_live 
	ui_flow_manager_respond_to_action \{action = select_xbox_live}
endscript
winport_is_in_online_menu_system = 0

script main_menu_select_winport_online 
	change \{winport_is_in_online_menu_system = 1}
	ui_flow_manager_respond_to_action \{action = select_winport_online}
endscript

script main_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_options}
endscript

script main_menu_select_exit 
	ui_flow_manager_respond_to_action \{action = select_winport_exit}
endscript
winport_confirm_exit_msg = "Are you sure you want to exit?"

script winport_create_confirm_exit_popup 
	create_popup_warning_menu \{textblock = {text = $winport_confirm_exit_msg} menu_pos = (640.0, 490.0) dialog_dims = (288.0, 64.0) options = [{func = {ui_flow_manager_respond_to_action params = {action = continue}} text = "Yes" Scale = (1.0, 1.0)}{func = {ui_flow_manager_respond_to_action params = {action = go_back}} text = "No" Scale = (1.0, 1.0)}]}
endscript

script winport_destroy_confirm_exit_popup 
	destroy_popup_warning_menu
endscript
