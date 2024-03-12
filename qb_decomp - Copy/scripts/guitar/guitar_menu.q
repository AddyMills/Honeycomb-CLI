gh3_button_font = buttonsxenon
bunny_flame_index = 1
g_anim_flame = 1
default_event_handlers = [
	{
		pad_up
		generic_menu_up_or_down_sound
		Params = {
			Up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		Params = {
			Down
		}
	}
	{
		pad_back
		generic_menu_pad_back
		Params = {
			callback = menu_flow_go_back
		}
	}
]
menu_text_color = [
	215
	160
	110
	255
]

script menu_flow_go_back \{Player = 1 create_params = {} destroy_params = {}}
	ui_flow_manager_respond_to_action action = go_back Player = <Player> create_params = <create_params> destroy_params = <destroy_params>
endscript

script new_menu \{Menu_pos = $Menu_pos event_handlers = $default_event_handlers use_backdrop = 0 Z = 1 Dims = (400.0, 480.0) font = text_A1 font_size = 0.75 default_colors = 1 just = [Left top] no_focus = 0 internal_just = [Center top]}
	if ScreenelementExists Id = <scrollid>
		Printf "script new_menu - %s Already exists." S = <scrollid>
		return
	endif
	if ScreenelementExists Id = <vmenuid>
		Printf "script new_menu - %s Already exists." S = <vmenuid>
		return
	endif
	createScreenElement {
		Type = VScrollingMenu
		PARENT = root_window
		Id = <scrollid>
		just = <just>
		Dims = <Dims>
		pos = <Menu_pos>
		z_priority = <Z>
	}
	if (<use_backdrop>)
		create_generic_backdrop
	endif
	if gotParam \{Name}
		createScreenElement {
			Type = textElement
			PARENT = <scrollid>
			font = <font>
			pos = (0.0, -45.0)
			scale = <font_size>
			rgba = [210 210 210 250]
			Text = <Name>
			just = <just>
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
	endif
	createScreenElement {
		Type = VMenu
		PARENT = <scrollid>
		Id = <vmenuid>
		pos = (0.0, 0.0)
		just = <just>
		internal_just = <internal_just>
		event_handlers = <event_handlers>
	}
	if gotParam \{Rot_Angle}
		setScreenElementProps Id = <vmenuid> Rot_Angle = <Rot_Angle>
	endif
	if gotParam \{no_wrap}
		setScreenElementProps Id = <vmenuid> dont_allow_wrap
	endif
	if gotParam \{Spacing}
		setScreenElementProps Id = <vmenuid> spacing_between = <Spacing>
	endif
	if gotParam \{text_left}
		setScreenElementProps Id = <vmenuid> internal_just = [Left top]
	endif
	if gotParam \{text_right}
		setScreenElementProps Id = <vmenuid> internal_just = [Right top]
	endif
	if NOT gotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	if NOT (<exclusive_device> = NONE)
		setScreenElementProps {
			Id = <scrollid>
			exclusive_device = <exclusive_device>
		}
		setScreenElementProps {
			Id = <vmenuid>
			exclusive_device = <exclusive_device>
		}
	endif
	if gotParam \{tierlist}
		Tier = 0
		begin
		<Tier> = (<Tier> + 1)
		setlist_prefix = ($<tierlist>.Prefix)
		formatText Checksumname = tiername '%ptier%i' P = <setlist_prefix> I = (<Tier>)
		formatText Checksumname = tier_checksum 'tier%s' S = (<Tier>)
		<unlocked> = 1
		getglobaltags <tiername> param = unlocked
		if ((<unlocked> = 1) || ($is_network_game))
			getArraySize ($<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_Size> > 0)
				begin
				formatText Checksumname = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = (<Tier>) AddToStringLookup = TRUE
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title Song = ($<tierlist>.<tier_checksum>.songs [<song_count>])
					createScreenElement {
						Type = textElement
						PARENT = <vmenuid>
						font = <font>
						scale = <font_size>
						rgba = [210 210 210 250]
						Text = <Song_Title>
						just = [Left top]
						event_handlers = [
							{focus menu_focus}
							{unfocus menu_unfocus}
							{pad_choose <on_choose> Params = {Tier = <Tier> song_count = <song_count>}}
							{PAD_LEFT <on_left> Params = {Tier = <Tier> song_count = <song_count>}}
							{pad_right <on_right> Params = {Tier = <Tier> song_count = <song_count>}}
							{pad_L3 <on_l3> Params = {Tier = <Tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_Size>
			endif
		endif
		repeat ($<tierlist>.num_tiers)
	endif
	if (<default_colors>)
		set_focus_color rgba = ($default_menu_focus_color)
		set_unfocus_color rgba = ($default_menu_unfocus_color)
	endif
	if (<no_focus> = 0)
		launchevent Type = focus Target = <vmenuid>
	endif
endscript

script destroy_menu 
	if gotParam \{menu_id}
		if ScreenelementExists Id = <menu_id>
			DestroyScreenelement Id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script create_main_menu_backdrop 
	Change \{coop_dlc_active = 0}
	create_menu_backdrop \{texture = GH3_Main_Menu_BG}
	base_menu_pos = (730.0, 90.0)
	createScreenElement {
		Type = containerElement
		Id = main_menu_text_container
		PARENT = root_window
		pos = (<base_menu_pos>)
		just = [Left top]
		z_priority = 3
		scale = 0.8
	}
	createScreenElement \{Type = containerElement Id = main_menu_bg_container PARENT = root_window pos = (0.0, 0.0) z_priority = 3}
	WinPortGetAppFullVersion
	formatText Textname = version_string_display "VERSION %s" S = <version_string>
	main_menu_font = fontgrid_title_gh3
	createScreenElement {
		Type = textElement
		Id = version_text
		PARENT = main_menu_bg_container
		Text = <version_string_display>
		font = <main_menu_font>
		pos = (130.0, 600.0)
		scale = (0.5, 0.5)
		rgba = ($menu_text_color)
		just = [Left top]
		font_spacing = 0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	createScreenElement \{Type = spriteElement Id = Main_Menu_BG2 PARENT = main_menu_bg_container texture = Main_Menu_BG2 pos = (335.0, 0.0) Dims = (720.0, 720.0) just = [Left top] z_priority = 1}
	runScriptOnScreenElement Id = Main_Menu_BG2 glow_menu_element Params = {Time = 1 Id = <Id>}
	createScreenElement \{Type = spriteElement PARENT = main_menu_bg_container texture = Main_Menu_illustrations pos = (0.0, 0.0) Dims = (1280.0, 720.0) just = [Left top] z_priority = 2}
	createScreenElement \{Type = spriteElement Id = eyes_BL PARENT = main_menu_bg_container texture = Main_Menu_eyesBL pos = (93.0, 676.0) Dims = (128.0, 64.0) just = [Center Center] z_priority = 3}
	runScriptOnScreenElement Id = eyes_BL glow_menu_element Params = {Time = 1.0 Id = <Id>}
	createScreenElement \{Type = spriteElement Id = eyes_BR PARENT = main_menu_bg_container texture = Main_Menu_eyesBR pos = (1176.0, 659.0) Dims = (128.0, 64.0) just = [Center Center] z_priority = 3}
	runScriptOnScreenElement Id = eyes_BR glow_menu_element Params = {Time = 1.0 Id = <Id>}
	createScreenElement \{Type = spriteElement Id = eyes_C PARENT = main_menu_bg_container texture = Main_Menu_eyesC pos = (406.0, 398.0) Dims = (128.0, 64.0) just = [Center Center] z_priority = 3}
	runScriptOnScreenElement Id = eyes_C glow_menu_element Params = {Time = 1.5 Id = <Id>}
	createScreenElement \{Type = spriteElement Id = eyes_TL PARENT = main_menu_bg_container texture = Main_Menu_eyesTL pos = (271.0, 215.0) Dims = (128.0, 64.0) just = [Center Center] z_priority = 3}
	runScriptOnScreenElement Id = eyes_TL glow_menu_element Params = {Time = 1.7 Id = <Id>}
	createScreenElement \{Type = spriteElement Id = eyes_TR PARENT = main_menu_bg_container texture = Main_Menu_eyesTR pos = (995.0, 71.0) Dims = (128.0, 64.0) just = [Center Center] z_priority = 3}
	runScriptOnScreenElement Id = eyes_TR glow_menu_element Params = {Time = 1.0 Id = <Id>}
endscript

script WinPortCreateLaptopUi 
	Z = 1000000
	createScreenElement {
		Type = spriteElement
		Id = batteryElem
		PARENT = root_window
		texture = battery_charging
		pos = (65.0, 721.0)
		scale = (0.66, 0.66)
		just = [Left Bottom]
		z_priority = <Z>
		Hide
	}
	createScreenElement {
		Type = spriteElement
		Id = batteryLevelElem
		PARENT = root_window
		texture = battery_level0
		pos = (65.0, 721.0)
		scale = (0.66, 0.66)
		just = [Left Bottom]
		z_priority = (<Z> - 1)
		Hide
	}
	createScreenElement {
		Type = spriteElement
		Id = wirelessElem
		PARENT = root_window
		texture = WiFi_bar0
		pos = (1201.0, 716.0)
		scale = (0.66, 0.66)
		just = [Right Bottom]
		z_priority = <Z>
		Hide
	}
	SpawnScriptNOw \{WinPortUpdateLaptopUi}
endscript

script WinPortUpdateLaptopUi 
	begin
	WinPortGetLaptopInfo
	if (<batteryPercent> > -1)
		if (<batteryCharging> = 1)
			setScreenElementProps \{Id = batteryElem Unhide texture = battery_charging}
		else
			setScreenElementProps \{Id = batteryElem Unhide texture = Battery}
		endif
		mathFloor ((<batteryPercent> + 1) / 12.5)
		formatText Checksumname = batteryLevelImage 'battery_level%a' A = <floor>
		setScreenElementProps Id = batteryLevelElem Unhide texture = <batteryLevelImage>
	else
		setScreenElementProps \{Id = batteryElem Hide}
		setScreenElementProps \{Id = batteryLevelElem Hide}
	endif
	if (<wirelessPercent> > -1)
		mathFloor ((<wirelessPercent> + 1) / 20)
		formatText Checksumname = wirelessImage 'wifi_bar%a' A = <floor>
		setScreenElementProps Id = wirelessElem Unhide texture = <wirelessImage>
	else
		setScreenElementProps \{Id = wirelessElem Hide}
	endif
	Wait \{5 Seconds}
	repeat
endscript
main_menu_movie_first_time = 1
main_menu_created = 0

script create_main_menu 
	if isWinPort
		shut_down_net_play
		if ($main_menu_created = 0)
			if WinPortSioIsKeyboard \{deviceNum = $primary_controller}
				setGlobalTags \{user_options Params = {lefty_flip_p1 = 1}}
			else
				guitarCount = 0
				if isguitarcontroller \{controller = 0}
					guitarCount = (<guitarCount> + 1)
				endif
				if isguitarcontroller \{controller = 1}
					guitarCount = (<guitarCount> + 1)
				endif
				if isguitarcontroller \{controller = 2}
					guitarCount = (<guitarCount> + 1)
				endif
				if (<guitarCount> < 2)
					setGlobalTags \{user_options Params = {lefty_flip_p2 = 1}}
				endif
			endif
			WinPortCreateLaptopUi
		endif
	endif
	Change \{winport_is_in_online_menu_system = 0}
	Change \{main_menu_created = 1}
	getglobaltags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	Setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)}}
	if ($main_menu_movie_first_time = 0)
		FadeToBlack \{On Time = 0 Alpha = 1.0 z_priority = 900}
	endif
	create_main_menu_backdrop
	if ($main_menu_movie_first_time = 0 && $invite_controller = -1)
		PlayMovieAndWait \{movie = 'GH3_Intro' noblack noletterbox}
		Change \{main_menu_movie_first_time = 1}
		FadeToBlack \{OFF Time = 0}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	kill_start_key_binding
	unpauseGame
	Change \{current_num_players = 1}
	Change StructureName = player1_status controller = ($primary_controller)
	Change \{player_controls_valid = 0}
	disable_pause
	SpawnScriptNOw \{Menu_Music_On}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] NOT_FOCUSABLE}
	else
		demo_mode_disable = {}
	endif
	DeRegisterAtoms
	RegisterAtoms \{Name = Achievement $Achievement_Atoms}
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{current_song = welcometothejungle}
	Change \{end_credits = 0}
	Change \{battle_sudden_death = 0}
	Change \{StructureName = player1_status character_id = Axel}
	Change \{StructureName = player2_status character_id = Axel}
	Change \{default_menu_focus_color = [125 0 0 255]}
	Change \{default_menu_unfocus_color = $menu_text_color}
	safe_create_gh3_pause_menu
	base_menu_pos = (730.0, 90.0)
	main_menu_font = fontgrid_title_gh3
	new_menu scrollid = main_menu_scrolling_menu vmenuid = vmenu_main_menu use_backdrop = (0) Menu_pos = (<base_menu_pos>)
	Change \{rich_presence_context = presence_main_menu}
	career_text_off = (-30.0, 0.0)
	career_text_scale = (1.55, 1.4499999)
	coop_career_text_off = (<career_text_off> + (30.0, 63.0))
	coop_career_text_scale = (0.8, 0.9)
	quickplay_text_off = (<coop_career_text_off> + (-35.0, 40.0))
	quickplay_text_scale = (1.65, 1.55)
	multiplayer_text_off = (<quickplay_text_off> + (-40.0, 65.0))
	multiplayer_text_scale = (1.2, 1.1)
	training_text_off = (<multiplayer_text_off> + (60.0, 47.0))
	training_text_scale = (1.5, 1.5)
	options_text_off = (<training_text_off> + (-20.0, 63.0))
	options_text_scale = (1.2, 1.1)
	leaderboards_text_off = (<options_text_off> + (20.0, 48.0))
	leaderboards_text_scale = (1.1, 1.0)
	exit_text_off = (<leaderboards_text_off> + (-20.0, 65.0))
	exit_text_scale = (1.1, 1.0)
	debug_menu_text_off = (<exit_text_off> + (0.0, 160.0))
	debug_menu_text_scale = 0.8
	createScreenElement {
		Type = textElement
		Id = main_menu_career_text
		PARENT = main_menu_text_container
		Text = "CAREER"
		font = <main_menu_font>
		pos = {(<career_text_off>) Relative}
		scale = (<career_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		font_spacing = 0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
		<demo_mode_disable>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 420)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((420.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_coop_career_text
		PARENT = main_menu_text_container
		Text = "CO-OP CAREER"
		font = <main_menu_font>
		pos = {(<coop_career_text_off>) Relative}
		scale = (<coop_career_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		font_spacing = 0
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
		<demo_mode_disable>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 400)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((400.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_quickplay_text
		PARENT = main_menu_text_container
		font = <main_menu_font>
		Text = "QUICKPLAY"
		font_spacing = 0
		pos = {(<quickplay_text_off>) Relative}
		scale = (<quickplay_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	getScreenElementDims Id = <Id>
	if (<width> > 400)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((400.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_multiplayer_text
		PARENT = main_menu_text_container
		font = <main_menu_font>
		Text = "MULTIPLAYER"
		font_spacing = 1
		pos = {(<multiplayer_text_off>) Relative}
		scale = (<multiplayer_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	getScreenElementDims Id = <Id>
	if (<width> > 460)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((460.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_training_text
		PARENT = main_menu_text_container
		font = <main_menu_font>
		Text = "TRAINING"
		font_spacing = 0
		pos = {(<training_text_off>) Relative}
		scale = (<training_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	getScreenElementDims Id = <Id>
	if (<width> > 345)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((345.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	getScreenElementDims \{Id = main_menu_training_text}
	old_height = <Height>
	fit_text_in_rectangle Id = main_menu_training_text Dims = (350.0, 100.0) pos = {(<training_text_off>) Relative} start_x_scale = (<training_text_scale>.(1.0, 0.0)) start_y_scale = (<training_text_scale>.(0.0, 1.0)) only_if_larger_x = 1 keep_ar = 1
	getScreenElementDims \{Id = main_menu_training_text}
	offset = ((<old_height> * ((<old_height> -24.0) / <old_height>)) - (<Height> * ((<Height> - (24.0 * ((1.0 * <Height>) / <old_height>))) / <Height>)))
	leaderboards_text_off = (<leaderboards_text_off> - <offset> * (0.0, 1.0))
	options_text_off = (<options_text_off> - <offset> * (0.0, 1.0))
	if isxenon
		createScreenElement {
			Type = textElement
			Id = main_menu_leaderboards_text
			PARENT = main_menu_text_container
			font = <main_menu_font>
			Text = "ONLINE"
			font_spacing = 0
			pos = {(<leaderboards_text_off>) Relative}
			scale = (<leaderboards_text_scale>)
			rgba = ($menu_text_color)
			just = [Left top]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 60
			<demo_mode_disable>
		}
		getScreenElementDims Id = <Id>
		if (<width> > 360)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> Dims = ((360.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	else
		createScreenElement {
			Type = textElement
			Id = main_menu_leaderboards_text
			PARENT = main_menu_text_container
			font = <main_menu_font>
			Text = "ONLINE"
			font_spacing = 0
			pos = {(<leaderboards_text_off>) Relative}
			scale = (<leaderboards_text_scale>)
			rgba = ($menu_text_color)
			just = [Left top]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 60
			<demo_mode_disable>
		}
		getScreenElementDims Id = <Id>
		if (<width> > 360)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> Dims = ((360.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_options_text
		PARENT = main_menu_text_container
		font = <main_menu_font>
		Text = "OPTIONS"
		font_spacing = 0
		pos = {(<options_text_off>) Relative}
		scale = (<options_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	getScreenElementDims Id = <Id>
	if (<width> > 420)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((420.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Id = main_menu_exit_text
		PARENT = main_menu_text_container
		font = <main_menu_font>
		Text = "EXIT"
		font_spacing = 0
		pos = {(<exit_text_off>) Relative}
		scale = (<exit_text_scale>)
		rgba = ($menu_text_color)
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 60
	}
	getScreenElementDims Id = <Id>
	if (<width> > 420)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> Dims = ((420.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	if ($enable_button_cheats = 1)
		createScreenElement {
			Type = textElement
			Id = main_menu_debug_menu_text
			PARENT = main_menu_text_container
			font = <main_menu_font>
			Text = "DEBUG MENU"
			pos = {(<debug_menu_text_off>) Relative}
			scale = (<debug_menu_text_scale>)
			rgba = ($menu_text_color)
			just = [Left top]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 60
		}
	endif
	offwhite = [255 255 205 255]
	hilite_off = (5.0, 0.0)
	gm_hlInfoList = [
		{
			posL = (<career_text_off> + <hilite_off> + (-40.0, 9.0))
			posR = (<career_text_off> + <hilite_off> + (218.0, 9.0))
			beDims = (40.0, 40.0)
			posH = (<career_text_off> + <hilite_off> + (-14.0, -2.0))
			hDims = (240.0, 57.0)
		} ,
		{
			posL = (<coop_career_text_off> + <hilite_off> + (-33.0, 3.0))
			posR = (<coop_career_text_off> + <hilite_off> + (281.0, 3.0))
			beDims = (32.0, 32.0)
			posH = (<coop_career_text_off> + <hilite_off> + (-14.0, -1.0))
			hDims = (300.0, 37.0)
		} ,
		{
			posL = (<quickplay_text_off> + <hilite_off> + (-34.0, 4.0))
			posR = (<quickplay_text_off> + <hilite_off> + (251.0, 4.0))
			beDims = (40.0, 40.0)
			posH = (<quickplay_text_off> + <hilite_off> + (-14.0, -2.0))
			hDims = (267.0, 47.0)
		} ,
		{
			posL = (<multiplayer_text_off> + <hilite_off> + (-37.0, 4.0))
			posR = (<multiplayer_text_off> + <hilite_off> + (301.0, 4.0))
			beDims = (38.0, 38.0)
			posH = (<multiplayer_text_off> + <hilite_off> + (-14.0, -1.0))
			hDims = (320.0, 43.0)
		} ,
		{
			posL = (<training_text_off> + <hilite_off> + (-31.0, 9.0))
			posR = (<training_text_off> + <hilite_off> + (282.0, 9.0))
			beDims = (42.0, 42.0)
			posH = (<training_text_off> + <hilite_off> + (-13.0, -2.0))
			hDims = (295.0, 61.0)
		} ,
		{
			posL = (<leaderboards_text_off> + <hilite_off> + (-33.0, 3.0))
			posR = (<leaderboards_text_off> + <hilite_off> + (213.0, 3.0))
			beDims = (34.0, 34.0)
			posH = (<leaderboards_text_off> + <hilite_off> + (-13.0, -2.0))
			hDims = (232.0, 40.0)
		} ,
		{
			posL = (<options_text_off> + <hilite_off> + (-36.0, 5.0))
			posR = (<options_text_off> + <hilite_off> + (183.0, 5.0))
			beDims = (36.0, 36.0)
			posH = (<options_text_off> + <hilite_off> + (-14.0, 0.0))
			hDims = (205.0, 43.0)
		} ,
		{
			posL = (<exit_text_off> + <hilite_off> + (-36.0, 5.0))
			posR = (<exit_text_off> + <hilite_off> + (183.0, 5.0))
			beDims = (36.0, 36.0)
			posH = (<exit_text_off> + <hilite_off> + (-12.0, 0.0))
			hDims = (205.0, 43.0)
		}
	]
	<gm_hlIndex> = 0
	displaySprite {
		PARENT = main_menu_text_container
		tex = character_hub_hilite_bookend
		pos = ((<gm_hlInfoList> [<gm_hlIndex>]).posL)
		Dims = ((<gm_hlInfoList> [<gm_hlIndex>]).beDims)
		rgba = <offwhite>
		Z = 2
	}
	<bookEnd1ID> = <Id>
	displaySprite {
		PARENT = main_menu_text_container
		tex = character_hub_hilite_bookend
		pos = ((<gm_hlInfoList> [<gm_hlIndex>]).posR)
		Dims = ((<gm_hlInfoList> [<gm_hlIndex>]).beDims)
		rgba = <offwhite>
		Z = 2
	}
	<bookEnd2ID> = <Id>
	displaySprite {
		PARENT = main_menu_text_container
		tex = White
		rgba = <offwhite>
		pos = ((<gm_hlInfoList> [<gm_hlIndex>]).posH)
		Dims = ((<gm_hlInfoList> [<gm_hlIndex>]).hDims)
		Z = 2
	}
	<whiteTexHighlightID> = <Id>
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_career_text}}
			{focus setScreenElementProps Params = {Id = main_menu_career_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 0
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_career_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_career_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_career_text}}
			{pad_choose main_menu_select_career}
		]
		z_priority = -1
		<demo_mode_disable>
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_coop_career_text}}
			{focus setScreenElementProps Params = {Id = main_menu_coop_career_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 1
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_coop_career_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_coop_career_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_coop_career_text}}
			{pad_choose main_menu_select_coop_career}
		]
		z_priority = -1
		<demo_mode_disable>
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_quickplay_text}}
			{focus setScreenElementProps Params = {Id = main_menu_quickplay_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 2
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_quickplay_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_quickplay_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_quickplay_text}}
			{pad_choose main_menu_select_quickplay}
		]
		z_priority = -1
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_multiplayer_text}}
			{focus setScreenElementProps Params = {Id = main_menu_multiplayer_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 3
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_multiplayer_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_multiplayer_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_multiplayer_text}}
			{pad_choose main_menu_select_multiplayer}
		]
		z_priority = -1
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_training_text}}
			{focus setScreenElementProps Params = {Id = main_menu_training_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 4
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_training_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_training_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_training_text}}
			{pad_choose main_menu_select_training}
		]
		z_priority = -1
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_options_text}}
			{focus setScreenElementProps Params = {Id = main_menu_options_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 6
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_options_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_options_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_options_text}}
			{pad_choose main_menu_select_options}
		]
		z_priority = -1
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = ""
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_leaderboards_text}}
			{focus setScreenElementProps Params = {Id = main_menu_leaderboards_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 5
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_leaderboards_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_leaderboards_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_leaderboards_text}}
			{pad_choose main_menu_select_winport_online}
		]
		z_priority = -1
		<demo_mode_disable>
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_main_menu
		font = <main_menu_font>
		Text = "Exit placeholder"
		event_handlers = [
			{focus retail_menu_focus Params = {Id = main_menu_exit_text}}
			{focus setScreenElementProps Params = {Id = main_menu_exit_text no_shadow}}
			{focus guitar_menu_highlighter Params = {
					hlIndex = 7
					hlInfoList = <gm_hlInfoList>
					be1ID = <bookEnd1ID>
					be2ID = <bookEnd2ID>
					wthlID = <whiteTexHighlightID>
					text_id = main_menu_exit_text
				}
			}
			{unfocus setScreenElementProps Params = {Id = main_menu_exit_text Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}}
			{unfocus retail_menu_unfocus Params = {Id = main_menu_exit_text}}
			{pad_choose main_menu_select_exit}
		]
		z_priority = -1
	}
	if ($enable_button_cheats = 1)
		createScreenElement {
			Type = textElement
			PARENT = vmenu_main_menu
			font = <main_menu_font>
			Text = ""
			event_handlers = [
				{focus retail_menu_focus Params = {Id = main_menu_debug_menu_text}}
				{focus guitar_menu_highlighter Params = {
						zPri = -2
						hlIndex = 0
						hlInfoList = <gm_hlInfoList>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
					}
				}
				{unfocus retail_menu_unfocus Params = {Id = main_menu_debug_menu_text}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_debug_menu}}
			]
			z_priority = -1
		}
	endif
	if ($new_message_of_the_day = 1)
		SpawnScriptNOw \{pop_in_new_downloads_notifier}
	endif
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		ui_flow_manager_respond_to_action \{action = select_xbox_live}
		FadeToBlack \{OFF Time = 0}
	else
		launchevent \{Type = focus Target = vmenu_main_menu}
	endif
endscript

script guitar_menu_highlighter \{zPri = 50}
	if gotParam \{text_id}
		getScreenElementDims Id = <text_id>
		hilite_dims = (<width> * (1.0, 0.0) + <Height> * (0.0, 0.7) + (20.0, -1.0))
		bookend_dims = (<Height> * (0.5, 0.5))
		hilite_pos = ((<hlInfoList> [<hlIndex>]).posH - (5.0, 0.0))
		setScreenElementProps {
			Id = <wthlID>
			pos = <hilite_pos>
			Dims = <hilite_dims>
			z_priority = <zPri>
		}
		setScreenElementProps {
			Id = <be1ID>
			pos = (<hilite_pos> - <bookend_dims>.(1.0, 0.0) * (0.6, 0.0) + <Height> * (0.0, 0.1))
			Dims = <bookend_dims>
			z_priority = <zPri>
		}
		setScreenElementProps {
			Id = <be2ID>
			pos = (<hilite_pos> + (<hilite_dims>.(1.0, 0.0) * (1.0, 0.0)) + <Height> * (0.0, 0.1) - (<bookend_dims>.(1.0, 0.0) * (0.1, 0.0)))
			Dims = <bookend_dims>
			z_priority = <zPri>
			flip_h
		}
	else
		setScreenElementProps {
			Id = <be1ID>
			pos = ((<hlInfoList> [<hlIndex>]).posL)
			Dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		setScreenElementProps {
			Id = <be2ID>
			pos = ((<hlInfoList> [<hlIndex>]).posR)
			Dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		setScreenElementProps {
			Id = <wthlID>
			pos = ((<hlInfoList> [<hlIndex>]).posH)
			Dims = ((<hlInfoList> [<hlIndex>]).hDims)
			z_priority = <zPri>
		}
	endif
endscript

script glow_new_downloads_text 
	begin
	if ScreenelementExists \{Id = new_downloads_text_glow}
		new_downloads_text_glow :doMorph Alpha = 0 Time = <Time>
	endif
	if ScreenelementExists \{Id = new_downloads_text_glow}
		new_downloads_text_glow :doMorph Alpha = 1 Time = <Time>
	endif
	repeat
endscript

script pop_in_new_downloads_notifier \{Time = 0.5}
	Wait \{0.5 Second}
	if NOT ScreenelementExists \{Id = main_menu_text_container}
		return
	endif
	pos = (100.0, 390.0)
	Text = "NEW  DOWNLOADABLE  CONTENT!"
	createScreenElement {
		Type = textElement
		PARENT = main_menu_text_container
		Text = <Text>
		scale = 0.5
		rgba = [255 255 205 255]
		just = [Center Center]
		font_spacing = 5
		font = text_a3
		pos = <pos>
		z_priority = 5
		Alpha = 0
	}
	getScreenElementDims Id = <Id>
	if (<width> >= 500)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((500.0, 0.0) + <Height> * (0.0, 1.0)) keep_ar = 1
	endif
	DoScreenElementMorph Id = <Id> Alpha = 1 Time = <Time>
	createScreenElement {
		Type = textElement
		PARENT = main_menu_text_container
		Id = new_downloads_text_glow
		Text = <Text>
		scale = 0.5
		rgba = [255 255 255 255]
		font = text_a3
		just = [Center Center]
		font_spacing = 5
		pos = <pos>
		z_priority = 6
		Alpha = 0
	}
	getScreenElementDims Id = <Id>
	if (<width> >= 500)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((500.0, 0.0) + <Height> * (0.0, 1.0)) keep_ar = 1
	endif
	DoScreenElementMorph Id = <Id> Alpha = 1 Time = <Time>
	displaySprite {
		PARENT = main_menu_text_container
		tex = White
		pos = (<pos>)
		just = [Center Center]
		rgba = [170 90 35 255]
		Z = 4
		Dims = ((<width> + 20) * (1.0, 0.0) + (0.0, 1.0) * (<Height> + 10))
		Alpha = 0
	}
	DoScreenElementMorph Id = <Id> Alpha = 1 Time = <Time>
	displaySprite {
		PARENT = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [Right Center]
		rgba = [170 90 35 255]
		Z = 4
		pos = ((<pos>) - <width> * (0.5, 0.0) - (6.0, 1.0))
		Dims = (<Height> * (1.0, 1.0))
		flip_v
		Alpha = 0
	}
	DoScreenElementMorph Id = <Id> Alpha = 1 Time = <Time>
	displaySprite {
		PARENT = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [Left Center]
		rgba = [170 90 35 255]
		Z = 4
		pos = ((<pos>) + <width> * (0.5, 0.0) + (6.0, 1.0))
		Dims = (<Height> * (1.0, 1.0))
		Alpha = 0
	}
	DoScreenElementMorph Id = <Id> Alpha = 1 Time = <Time>
	SpawnScriptNOw \{glow_new_downloads_text Params = {Time = 0.75}}
endscript

script glow_menu_element \{Time = 1}
	if NOT ScreenelementExists Id = <Id>
		return
	endif
	Wait RandomRange (0.0, 2.0) Seconds
	begin
	<Id> :doMorph Alpha = 1 Time = <Time> Motion = smooth
	<Id> :doMorph Alpha = 0 Time = <Time> Motion = smooth
	repeat
endscript

script destroy_main_menu 
	killspawnedScript \{Name = pop_in_new_downloads_notifier}
	killspawnedScript \{Name = glow_new_downloads_text}
	clean_up_user_control_helpers
	Change \{default_menu_focus_color = [210 210 210 250]}
	Change \{default_menu_unfocus_color = [210 130 0 250]}
	printStruct X = ($ui_flow_manager_state)
	destroy_menu \{menu_id = main_menu_scrolling_menu}
	destroy_menu \{menu_id = main_menu_text_container}
	destroy_menu_backdrop
	DestroyScreenelement \{Id = main_menu_bg_container}
endscript

script main_menu_select_career 
	Change \{game_mode = p1_career}
	Change \{current_num_players = 1}
	Change \{StructureName = player1_status part = GUITAR}
	Change \{StructureName = player2_status part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_career}
endscript

script main_menu_select_coop_career 
	Change \{game_mode = p2_career}
	Change \{current_num_players = 2}
	ui_flow_manager_respond_to_action \{action = select_coop_career}
endscript

script main_menu_select_quickplay 
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{StructureName = player1_status part = GUITAR}
	Change \{StructureName = player2_status part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_quickplay}
endscript

script main_menu_select_multiplayer 
	Change \{game_mode = p2_faceoff}
	Change \{current_num_players = 2}
	Change \{StructureName = player1_status part = GUITAR}
	Change \{StructureName = player2_status part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_multiplayer}
endscript

script main_menu_select_training 
	Change \{game_mode = training}
	Change \{current_num_players = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{StructureName = player1_status part = GUITAR}
	Change \{StructureName = player2_status part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_training}
endscript

script main_menu_select_xbox_live 
	ui_flow_manager_respond_to_action \{action = select_xbox_live}
endscript
winport_is_in_online_menu_system = 0

script main_menu_select_winport_online 
	Change \{winport_is_in_online_menu_system = 1}
	ui_flow_manager_respond_to_action \{action = select_winport_online}
endscript

script main_menu_select_exit 
	ui_flow_manager_respond_to_action \{action = select_winport_exit}
endscript

script main_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_options}
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script IsSinglePlayerGame 
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = training)
		return \{TRUE}
	else
		return \{FALSE}
	endif
endscript
winport_in_top_pause_menu = 0

script create_pause_menu \{Player = 1 for_options = 0 for_practice = 0}
	player_device = ($last_start_pressed_device)
	if ($player1_device = <player_device>)
		<Player> = 1
	else
		<Player> = 2
	endif
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		enable_pause
		safe_create_gh3_pause_menu
	else
		kill_start_key_binding
		flame_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
	endif
	if isWinPort
		Change \{winport_in_top_pause_menu = 1}
	endif
	Change \{bunny_flame_index = 1}
	pause_z = 10000
	Spacing = -65
	if (<for_options> = 0)
		Menu_pos = (730.0, 220.0)
		if (<for_practice> = 1)
			<Menu_pos> = (640.0, 190.0)
			<Spacing> = -65
		endif
	else
		<Spacing> = -65
		if isguitarcontroller controller = <player_device>
			if WinPortSioIsKeyboard deviceNum = <player_device>
				Menu_pos = (640.0, 260.0)
			else
				Menu_pos = (640.0, 225.0)
			endif
		else
			Menu_pos = (640.0, 260.0)
		endif
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = vmenu_pause
		Menu_pos = <Menu_pos>
		Rot_Angle = 2
		event_handlers = <flame_handlers>
		Spacing = <Spacing>
		use_backdrop = (0)
		exclusive_device = <player_device>
	}
	create_pause_menu_frame Z = (<pause_z> - 10)
	if ($is_network_game = 0)
		createScreenElement {
			Type = spriteElement
			PARENT = pause_menu_frame_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [Center Center]
			z_priority = (<pause_z> + 100)
		}
		if gotParam \{banner_text}
			pause_player_text = <banner_text>
			if gotParam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = "PAUSED"
				else
					if NOT IsSinglePlayerGame
						formatText Textname = pause_player_text "P%d PAUSED" D = <Player>
					else
						<pause_player_text> = "PAUSED"
					endif
				endif
				pause_player_scale = (0.6, 0.75)
			else
				pause_player_text = "OPTIONS"
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif
	createScreenElement {
		Type = textElement
		PARENT = <Id>
		Text = <pause_player_text>
		font = text_a6
		pos = (125.0, 53.0)
		scale = <pause_player_scale>
		rgba = [170 90 30 255]
		scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0 && <for_practice> = 0)
		createScreenElement {
			Type = containerElement
			PARENT = pause_menu_frame_container
			Id = bunny_container
			pos = (380.0, 170.0)
			just = [Left top]
			z_priority = <pause_z>
		}
		I = 1
		begin
		formatText Checksumname = bunny_id 'pause_bunny_flame_%d' D = <I>
		formatText Checksumname = bunny_tex 'GH3_Pause_Bunny_Flame%d' D = <I>
		createScreenElement {
			Type = spriteElement
			Id = <bunny_id>
			PARENT = bunny_container
			pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			Dims = (300.0, 300.0)
			just = [Right Bottom]
			z_priority = (<pause_z> + 3)
			Rot_Angle = 5
		}
		if (<I> > 1)
			DoScreenElementMorph Id = <bunny_id> Alpha = 0
		endif
		<I> = (<I> + 1)
		repeat 7
		createScreenElement {
			Type = spriteElement
			Id = pause_bunny_shadow
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [0 0 0 128]
			pos = (20.0, -110.0)
			Dims = (550.0, 550.0)
			just = [Center top]
			z_priority = (<pause_z> + 4)
		}
		createScreenElement {
			Type = spriteElement
			Id = pause_bunny
			PARENT = bunny_container
			texture = GH3_Pause_Bunny
			rgba = [255 255 255 255]
			pos = (0.0, -130.0)
			Dims = (550.0, 550.0)
			just = [Center top]
			z_priority = (<pause_z> + 5)
		}
		runScriptOnScreenElement \{Id = bunny_container bunny_hover Params = {hover_origin = (380.0, 170.0)}}
	endif
	container_params = {Type = containerElement PARENT = vmenu_pause Dims = (0.0, 100.0)}
	if (<for_options> = 0)
		if (<for_practice> = 1)
			if English
			else
				text_scale = (0.71999997, 0.71999997)
			endif
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Id = pause_resume
				Text = "RESUME"
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_restart}}
					{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "RESTART"
				Id = pause_restart
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_options}}
					{unfocus retail_menu_unfocus Params = {Id = pause_options}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "OPTIONS"
				Id = pause_options
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_change_speed}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_speed}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_speed}}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "CHANGE SPEED"
				Id = pause_change_speed
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_change_section}}
					{unfocus retail_menu_unfocus Params = {Id = pause_change_section}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_section}}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "CHANGE SECTION"
				Id = pause_change_section
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				createScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus Params = {Id = pause_new_song}}
						{unfocus retail_menu_unfocus Params = {Id = pause_new_song}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_new_song}}
					]
				}
				createScreenElement {
					Type = textElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					scale = <text_scale>
					rgba = [210 130 0 250]
					Text = "NEW SONG"
					Id = pause_new_song
					just = [Center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				getScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_quit}}
					{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
					{pad_choose ui_flow_manager_respond_to_action Params = {action = select_quit}}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "QUIT"
				Id = pause_quit
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{Text = "SELECT" button = Green Z = 100000}
			add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100000}
		else
			if English
			else
				container_params = {Type = containerElement PARENT = vmenu_pause Dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_resume}}
					{unfocus retail_menu_unfocus Params = {Id = pause_resume}}
					{pad_choose gh3_start_pressed}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "RESUME"
				Id = pause_resume
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					createScreenElement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus Params = {Id = pause_restart}}
							{unfocus retail_menu_unfocus Params = {Id = pause_restart}}
							{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
						]
					}
					createScreenElement {
						Type = textElement
						PARENT = <Id>
						font = fontgrid_title_gh3
						scale = <text_scale>
						rgba = [210 130 0 250]
						Text = "RESTART"
						Id = pause_restart
						just = [Center top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					getScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] NOT_FOCUSABLE}
					else
						demo_mode_disable = {}
					endif
					if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay))
						createScreenElement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus Params = {Id = pause_practice}}
								{unfocus retail_menu_unfocus Params = {Id = pause_practice}}
								{pad_choose ui_flow_manager_respond_to_action Params = {action = select_practice}}
							]
						}
						createScreenElement {
							Type = textElement
							PARENT = <Id>
							font = fontgrid_title_gh3
							scale = <text_scale>
							rgba = [210 130 0 250]
							Text = "PRACTICE"
							Id = pause_practice
							just = [Center top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <player_device>
						}
						getScreenElementDims Id = <Id>
						fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
					createScreenElement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus Params = {Id = pause_options}}
							{unfocus retail_menu_unfocus Params = {Id = pause_options}}
							{pad_choose ui_flow_manager_respond_to_action Params = {action = select_options create_params = {player_device = <player_device>}}}
						]
					}
					createScreenElement {
						Type = textElement
						PARENT = <Id>
						font = fontgrid_title_gh3
						scale = <text_scale>
						rgba = [210 130 0 250]
						Text = "OPTIONS"
						Id = pause_options
						just = [Center top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					getScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
				endif
			endif
			quit_script = ui_flow_manager_respond_to_action
			quit_script_params = {action = select_quit create_params = {Player = <Player>}}
			if ($is_network_game)
				quit_script = create_leaving_lobby_dialog
				quit_script_params = {
					create_pause_menu
					pad_back_script = return_to_pause_menu_from_net_warning
					pad_choose_script = pause_menu_really_quit_net_game
					Z = 300
				}
			endif
			createScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus Params = {Id = pause_quit}}
					{unfocus retail_menu_unfocus Params = {Id = pause_quit}}
					{pad_choose <quit_script> Params = <quit_script_params>}
				]
			}
			createScreenElement {
				Type = textElement
				PARENT = <Id>
				font = fontgrid_title_gh3
				scale = <text_scale>
				rgba = [210 130 0 250]
				Text = "QUIT"
				Id = pause_quit
				just = [Center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((270.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($enable_button_cheats = 1)
				createScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus Params = {Id = pause_debug_menu}}
						{unfocus retail_menu_unfocus Params = {Id = pause_debug_menu}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_debug_menu}}
					]
				}
				createScreenElement {
					Type = textElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					scale = <text_scale>
					rgba = [210 130 0 250]
					Text = "DEBUG MENU"
					Id = pause_debug_menu
					just = [Center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
			endif
			add_user_control_helper \{Text = "SELECT" button = Green Z = 100000}
			add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100000}
		endif
	else
		<fit_dims> = (400.0, 0.0)
		createScreenElement {
			Type = containerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus Params = {Id = options_audio}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_audio}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_audio_settings create_params = {Player = <Player>}}}
			]
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			Text = "SET AUDIO"
			Id = options_audio
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		createScreenElement {
			Type = containerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus Params = {Id = options_calibrate_lag}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = options_calibrate_lag}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_lag create_params = {Player = <Player>}}}
			]
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			Text = "CALIBRATE VIDEO LAG"
			Id = options_calibrate_lag
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		createScreenElement {
			Type = containerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus Params = {Id = winport_options_calibrate_lag}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = winport_options_calibrate_lag}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = winport_select_calibrate_lag create_params = {Player = <Player>}}}
			]
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			Text = "CALIBRATE AUDIO LAG"
			Id = winport_options_calibrate_lag
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if isguitarcontroller controller = <player_device>
			if NOT WinPortSioIsKeyboard deviceNum = <player_device>
				createScreenElement {
					Type = containerElement
					PARENT = vmenu_pause
					Dims = (0.0, 100.0)
					event_handlers = [
						{focus retail_menu_focus Params = {Id = options_calibrate_whammy}}
						{focus generic_menu_up_or_down_sound}
						{unfocus retail_menu_unfocus Params = {Id = options_calibrate_whammy}}
						{pad_choose ui_flow_manager_respond_to_action Params = {action = select_calibrate_whammy_bar create_params = {Player = <Player> Popup = 1}}}
					]
				}
				createScreenElement {
					Type = textElement
					PARENT = <Id>
					font = fontgrid_title_gh3
					scale = <text_scale>
					rgba = [210 130 0 250]
					Text = "CALIBRATE WHAMMY"
					Id = options_calibrate_whammy
					just = [Center Center]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				getScreenElementDims Id = <Id>
				fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
		endif
		if IsSinglePlayerGame
			lefty_flip_text = "LEFTY FLIP:"
		else
			if (<Player> = 1)
				lefty_flip_text = "P1 LEFTY FLIP:"
			else
				lefty_flip_text = "P2 LEFTY FLIP:"
			endif
		endif
		createScreenElement {
			Type = containerElement
			PARENT = vmenu_pause
			Dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus Params = {Id = pause_options_lefty}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus Params = {Id = pause_options_lefty}}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_lefty_flip create_params = {Player = <Player>}}}
			]
		}
		<lefty_container> = <Id>
		createScreenElement {
			Type = textElement
			PARENT = <lefty_container>
			Id = pause_options_lefty
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			Text = <lefty_flip_text>
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		createScreenElement \{Type = containerElement PARENT = vmenu_pause Dims = (0.0, 100.0) event_handlers = [{focus retail_menu_focus Params = {Id = options_exit}}{focus generic_menu_up_or_down_sound}{unfocus retail_menu_unfocus Params = {Id = options_exit}}{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}]}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			font = fontgrid_title_gh3
			scale = <text_scale>
			rgba = [210 130 0 250]
			Text = "EXIT"
			Id = options_exit
			just = [Center Center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		getglobaltags \{user_options}
		if (<Player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_X
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_X
			endif
		endif
		displaySprite {
			PARENT = <lefty_container>
			tex = <lefty_tex>
			just = [Center Center]
			Z = (<pause_z> + 10)
		}
		getScreenElementDims \{Id = pause_options_lefty}
		<Id> :SetProps pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{Text = "SELECT" button = Green Z = 100000}
		add_user_control_helper \{Text = "BACK" button = Red Z = 100000}
		add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT IsSinglePlayerGame
			if (<for_practice> = 0)
				formatText Textname = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." D = <Player>
				displaySprite {
					PARENT = pause_menu_frame_container
					Id = pause_helper_text_bg
					tex = Control_pill_body
					pos = (640.0, 600.0)
					just = [Center Center]
					rgba = [96 0 0 255]
					Z = (<pause_z> + 10)
				}
				displayText {
					PARENT = pause_menu_frame_container
					pos = (640.0, 604.0)
					just = [Center Center]
					Text = <player_paused_text>
					rgba = [186 105 0 255]
					scale = (0.45000002, 0.6)
					Z = (<pause_z> + 11)
					font = text_a6
				}
				getScreenElementDims Id = <Id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :SetProps Dims = <bg_dims>
				displaySprite {
					PARENT = pause_menu_frame_container
					tex = Control_pill_end
					pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [Right Center]
					flip_v
					Z = (<pause_z> + 10)
				}
				displaySprite {
					PARENT = pause_menu_frame_container
					tex = Control_pill_end
					pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [Left Center]
					Z = (<pause_z> + 10)
				}
			endif
		endif
	endif
	Change \{menu_choose_practice_destroy_previous_menu = 1}
	if (<for_options> = 0 && <for_practice> = 0)
		SpawnScriptNOw \{animate_bunny_flame}
	endif
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	Wait \{0.1 Second}
	repeat
endscript

script bunny_hover 
	if NOT ScreenelementExists \{Id = bunny_container}
		return
	endif
	I = 1
	begin
	formatText Checksumname = bunnyid 'pause_bunny_flame_%d' D = <I>
	if NOT ScreenelementExists Id = <bunnyid>
		return
	else
		setScreenElementProps Id = <bunnyid> pos = <flame_origin>
	endif
	<I> = (<I> + 1)
	repeat 7
	begin
	bunny_container :doMorph \{pos = (360.0, 130.0) Time = 1 Rot_Angle = -25 scale = 1.05 Motion = ease_out}
	bunny_container :doMorph \{pos = (390.0, 170.0) Time = 1 Rot_Angle = -20 scale = 0.95 Motion = ease_in}
	bunny_container :doMorph \{pos = (360.0, 130.0) Time = 1 Rot_Angle = -15 scale = 1.05 Motion = ease_out}
	bunny_container :doMorph \{pos = (390.0, 170.0) Time = 1 Rot_Angle = -20 scale = 0.95 Motion = ease_in}
	repeat
endscript

script destroy_pause_menu 
	restore_start_key_binding
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	killspawnedScript \{Name = animate_bunny_flame}
	if ScreenelementExists \{Id = warning_message_container}
		DestroyScreenelement \{Id = warning_message_container}
	endif
	if ScreenelementExists \{Id = leaving_lobby_dialog_menu}
		DestroyScreenelement \{Id = leaving_lobby_dialog_menu}
	endif
	destroy_pause_menu_frame \{container_id = net_quit_warning}
	if isWinPort
		Change \{winport_in_top_pause_menu = 0}
	endif
endscript

script swap_bunny_flame 
	if gotParam \{Up}
		generic_menu_up_or_down_sound \{Up}
		Change \{g_anim_flame = -1}
		elseif gotParam \{Down}
		generic_menu_up_or_down_sound \{Down}
		Change \{g_anim_flame = 1}
	endif
	Change bunny_flame_index = ($bunny_flame_index + $g_anim_flame)
	if ($bunny_flame_index > 7)
		Change \{bunny_flame_index = 1}
	endif
	if ($bunny_flame_index < 1)
		Change \{bunny_flame_index = 7}
	endif
	reset_bunny_alpha
	formatText \{Checksumname = bunnyid 'pause_bunny_flame_%d' D = $bunny_flame_index}
	if ScreenelementExists Id = <bunnyid>
		DoScreenElementMorph Id = <bunnyid> Alpha = 1
	endif
endscript

script reset_bunny_alpha 
	I = 1
	begin
	formatText Checksumname = bunnyid 'pause_bunny_flame_%d' D = <I>
	if ScreenelementExists Id = <bunnyid>
		DoScreenElementMorph Id = <bunnyid> Alpha = 0
	endif
	<I> = (<I> + 1)
	repeat 7
endscript

script create_menu_backdrop \{texture = Venue_BG rgba = [255 255 255 255]}
	if ScreenelementExists \{Id = menu_backdrop_container}
		DestroyScreenelement \{Id = menu_backdrop_container}
	endif
	createScreenElement \{Type = containerElement PARENT = root_window Id = menu_backdrop_container pos = (0.0, 0.0) just = [Left top]}
	createScreenElement {
		Type = spriteElement
		PARENT = menu_backdrop_container
		Id = menu_backdrop
		texture = <texture>
		rgba = <rgba>
		pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [Center Center]
		z_priority = 0
	}
endscript

script destroy_menu_backdrop 
	if ScreenelementExists \{Id = menu_backdrop_container}
		DestroyScreenelement \{Id = menu_backdrop_container}
	endif
endscript

script create_pause_menu_frame \{x_scale = 1 y_scale = 1 tile_sprite = 1 container_id = pause_menu_frame_container Z = 0 gradient = 1 PARENT = root_window}
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Id = <container_id>
		pos = (0.0, 0.0)
		just = [Left top]
		z_priority = <Z>
	}
	<center_pos> = (640.0, 360.0)
	pos_scale_2 = ((0.0, -5.0) * <y_scale>)
	scale_1 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_2 = ((1.4, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_3 = ((1.4, 0.0) * <x_scale> + (0.0, 1.3499999) * <y_scale>)
	scale_4 = ((1.575, 0.0) * <x_scale> + (0.0, 1.5) * <y_scale>)
	scale_5 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	if (<gradient> = 1)
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			texture = gradient_128
			rgba = [0 0 0 180]
			pos = (0.0, 0.0)
			Dims = (1280.0, 720.0)
			just = [Left top]
			z_priority = (<Z> + 1)
		}
	endif
	if (<tile_sprite> = 1)
		createScreenElement {
			Type = WindowElement
			PARENT = <container_id>
			pos = (642.0, 360.0)
			Dims = ((508.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			just = [Center Center]
			z_priority = (<Z> - 1)
		}
		pause_menu_scrolling_bg_01 = <Id>
		TileSprite PARENT = <pause_menu_scrolling_bg_01> tile_dims = (980.0, 910.0) pos = (0.0, 0.0) texture = GH3_Pause_bg_tile
		runScriptOnScreenElement TileSpriteLoop Id = <Id> Params = {move_x = -2 move_y = -2}
	else
		createScreenElement {
			Type = spriteElement
			Id = frame_background
			PARENT = <container_id>
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			just = [Center Center]
			Dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			z_priority = (<Z> - 1)
		}
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [Bottom Right]
		z_priority = (<Z> + 2)
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top Right]
		z_priority = (<Z> + 2)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top Left]
		z_priority = (<Z> + 2)
		flip_v
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_02
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [Bottom Left]
		z_priority = (<Z> + 2)
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [Bottom Right]
		z_priority = (<Z> + 2)
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top Right]
		z_priority = (<Z> + 2)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top Left]
		z_priority = (<Z> + 2)
		flip_v
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [Bottom Left]
		z_priority = (<Z> + 2)
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [Bottom Right]
		z_priority = (<Z> + 2)
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top Right]
		z_priority = (<Z> + 2)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top Left]
		z_priority = (<Z> + 2)
		flip_v
		flip_h
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = GH3_Pause_Frame_01
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [Bottom Left]
		z_priority = (<Z> + 2)
		flip_h
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
default_menu_focus_color = [
	210
	210
	210
	250
]
default_menu_unfocus_color = [
	210
	130
	0
	250
]
menu_focus_color = [
	210
	210
	210
	250
]
menu_unfocus_color = [
	210
	130
	0
	250
]

script set_focus_color \{rgba = [210 210 210 250]}
	Change menu_focus_color = <rgba>
endscript

script set_unfocus_color \{rgba = [210 130 0 250]}
	Change menu_unfocus_color = <rgba>
endscript

script retail_menu_focus 
	if gotParam \{Id}
		if ScreenelementExists Id = <Id>
			setScreenElementProps Id = <Id> rgba = ($menu_focus_color)
		endif
	else
		getTags
		printStruct <...>
		setScreenElementProps Id = <Id> rgba = ($menu_focus_color)
	endif
endscript

script retail_menu_unfocus 
	if gotParam \{Id}
		if ScreenelementExists Id = <Id>
			setScreenElementProps Id = <Id> rgba = ($menu_unfocus_color)
		endif
	else
		getTags
		setScreenElementProps Id = <Id> rgba = ($menu_unfocus_color)
	endif
endscript

script fit_text_in_rectangle \{Dims = (100.0, 100.0) just = Center keep_ar = 0 only_if_larger_x = 0 only_if_larger_y = 0 start_x_scale = 1.0 start_y_scale = 1.0}
	if NOT gotParam \{Id}
		Scriptassert \{"No id passed to fit_text_in_rectangle!"}
	endif
	getScreenElementDims Id = <Id>
	x_dim = (<Dims>.(1.0, 0.0))
	y_dim = (<Dims>.(0.0, 1.0))
	x_scale = (<x_dim> / <width>)
	if (<keep_ar> = 1)
		y_scale = <x_scale>
	else
		y_scale = (<y_dim> / <Height>)
	endif
	if gotParam \{debug_me}
		printStruct <...>
	endif
	if (<only_if_larger_x> = 1)
		if (<x_scale> > 1)
			return
		endif
		elseif (<only_if_larger_y> = 1)
		if (<y_scale> > 1)
			return
		endif
	endif
	if (<just> = Center)
		if gotParam \{pos}
		endif
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> * <start_x_scale> + (0.0, 1.0) * <y_scale> * <start_y_scale>)
	setScreenElementProps {
		Id = <Id>
		scale = <scale_pair>
	}
	if gotParam \{pos}
		setScreenElementProps Id = <Id> pos = <pos>
	endif
endscript
num_user_control_helpers = 0
user_control_text_font = fontgrid_title_gh3
user_control_pill_color = [
	20
	20
	20
	155
]
user_control_pill_text_color = [
	180
	180
	180
	255
]
user_control_auto_center = 1
user_control_super_pill = 0
user_control_pill_y_position = 650
user_control_pill_scale = 0.4
user_control_pill_end_width = 50
user_control_pill_gap = 150
user_control_super_pill_gap = 0.4
pill_helper_max_width = 100

script clean_up_user_control_helpers 
	if ScreenelementExists \{Id = user_control_container}
		DestroyScreenelement \{Id = user_control_container}
	endif
	Change \{user_control_pill_gap = 150}
	Change \{pill_helper_max_width = 100}
	Change \{num_user_control_helpers = 0}
	Change \{user_control_pill_color = [20 20 20 155]}
	Change \{user_control_pill_text_color = [180 180 180 255]}
	Change \{user_control_auto_center = 1}
	Change \{user_control_super_pill = 0}
	Change \{user_control_pill_y_position = 650}
	Change \{user_control_pill_scale = 0.4}
endscript

script add_user_control_helper \{Z = 10 pill = 1 fit_to_rectangle = 1}
	scale = ($user_control_pill_scale)
	pos = ((0.0, 1.0) * ($user_control_pill_y_position))
	buttonoff = (0.0, 0.0)
	if NOT ScreenelementExists \{Id = user_control_container}
		createScreenElement \{Id = user_control_container Type = containerElement PARENT = root_window pos = (0.0, 0.0)}
	endif
	if gotParam \{button}
		switch (<button>)
			case Green
			buttonchar = "\\m0"
			case Red
			buttonchar = "\\m1"
			case Yellow
			buttonchar = "\\b6"
			case Blue
			buttonchar = "\\b7"
			case Orange
			buttonchar = "\\b8"
			case Strumbar
			buttonchar = "\\bb"
			offset_for_strumbar = 1
			case Start
			buttonchar = "\\ba"
			offset_for_strumbar = 1
		endswitch
	else
		buttonchar = ""
	endif
	if (<pill> = 0)
		createScreenElement {
			Type = textElement
			PARENT = user_control_container
			Text = <buttonchar>
			pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
			scale = (1 * <scale>)
			rgba = [255 255 255 255]
			font = ($gh3_button_font)
			just = [Left top]
			z_priority = (<Z> + 0.1)
		}
		createScreenElement {
			Type = textElement
			PARENT = user_control_container
			Text = <Text>
			rgba = $user_control_pill_text_color
			scale = (1.1 * <scale>)
			pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
			font = ($user_control_text_font)
			z_priority = (<Z> + 0.1)
			just = [Left top]
		}
		if (<fit_to_rectangle> = 1)
			setScreenElementProps Id = <Id> scale = (1.1 * <scale>)
			getScreenElementDims Id = <Id>
			if (<width> > $pill_helper_max_width)
				fit_text_in_rectangle Id = <Id> Dims = ($pill_helper_max_width * (0.5, 0.0) + <Height> * (0.0, 1.0) * $user_control_pill_scale)
			endif
		endif
	else
		if (($user_control_super_pill = 0) && ($user_control_auto_center = 0))
			createScreenElement {
				Type = textElement
				PARENT = user_control_container
				Text = <Text>
				Id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<Z> + 0.1)
				just = [Left top]
			}
			textid = <Id>
			if (<fit_to_rectangle> = 1)
				setScreenElementProps Id = <Id> scale = (1.1 * <scale>)
				getScreenElementDims Id = <Id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle Id = <Id> Dims = ($pill_helper_max_width * (0.5, 0.0) + <Height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			createScreenElement {
				Type = textElement
				PARENT = user_control_container
				Id = <buttonid>
				Text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
				scale = (1 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [Left top]
				z_priority = (<Z> + 0.1)
			}
			buttonid = <Id>
			if gotParam \{offset_for_strumbar}
				<textid> :SetTags is_strumbar = 1
				fastscreenelementpos Id = <textid> absolute
				setScreenElementProps Id = <textid> pos = (<ScreenELementPos> + (50.0, 0.0) * <scale>)
			else
			endif
			fastscreenelementpos Id = <buttonid> absolute
			top_left = <ScreenELementPos>
			fastscreenelementpos Id = <textid> absolute
			bottom_right = <ScreenELementPos>
			getScreenElementDims Id = <textid>
			bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
			pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
			pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
			pill_y_offset = (<pill_height> * 0.2)
			pill_height = (<pill_height> + <pill_y_offset>)
			<pos> = (<pos> + (0.0, 1.0) * (<scale> * 3))
			createScreenElement {
				Type = spriteElement
				PARENT = user_control_container
				texture = Control_pill_body
				Dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [Left top]
				z_priority = <Z>
			}
			createScreenElement {
				Type = spriteElement
				PARENT = user_control_container
				texture = Control_pill_end
				Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [Right top]
				z_priority = <Z>
				flip_v
			}
			createScreenElement {
				Type = spriteElement
				PARENT = user_control_container
				texture = Control_pill_end
				Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <pill_width>)
				rgba = ($user_control_pill_color)
				just = [Left top]
				z_priority = <Z>
			}
		else
			formatText Checksumname = textid 'uc_text_%d' D = ($num_user_control_helpers)
			createScreenElement {
				Type = textElement
				PARENT = user_control_container
				Text = <Text>
				Id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<Z> + 0.1)
				just = [Left top]
			}
			if (<fit_to_rectangle> = 1)
				setScreenElementProps Id = <Id> scale = (1.1 * <scale>)
				getScreenElementDims Id = <Id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle Id = <Id> Dims = ($pill_helper_max_width * (0.5, 0.0) + <Height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			formatText Checksumname = buttonid 'uc_button_%d' D = ($num_user_control_helpers)
			createScreenElement {
				Type = textElement
				PARENT = user_control_container
				Id = <buttonid>
				Text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
				scale = (1.2 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [Left top]
				z_priority = (<Z> + 0.1)
			}
			if gotParam \{offset_for_strumbar}
				<textid> :SetTags is_strumbar = 1
				fastscreenelementpos Id = <textid> absolute
				setScreenElementProps Id = <textid> pos = (<ScreenELementPos> + (50.0, 0.0) * <scale>)
			endif
			Change num_user_control_helpers = ($num_user_control_helpers + 1)
		endif
	endif
	if ($user_control_super_pill = 1)
		user_control_build_super_pill Z = <Z>
		elseif ($user_control_auto_center = 1)
		user_control_build_pills Z = <Z>
	endif
endscript

script user_control_cleanup_pills 
	destroy_menu \{menu_id = user_control_super_pill_object_main}
	destroy_menu \{menu_id = user_control_super_pill_object_l}
	destroy_menu \{menu_id = user_control_super_pill_object_r}
	Index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText Checksumname = pill_id 'uc_pill_%d' D = <Index>
		if ScreenelementExists Id = <pill_id>
			DestroyScreenelement Id = <pill_id>
		endif
		formatText Checksumname = pill_l_id 'uc_pill_l_%d' D = <Index>
		if ScreenelementExists Id = <pill_l_id>
			DestroyScreenelement Id = <pill_l_id>
		endif
		formatText Checksumname = pill_r_id 'uc_pill_r_%d' D = <Index>
		if ScreenelementExists Id = <pill_r_id>
			DestroyScreenelement Id = <pill_r_id>
		endif
		<Index> = (<Index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript
action_safe_width_for_helpers = 925

script user_control_build_pills 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	Index = 0
	max_pill_width = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText Checksumname = textid 'uc_text_%d' D = <Index>
		formatText Checksumname = buttonid 'uc_button_%d' D = <Index>
		fastscreenelementpos Id = <buttonid> absolute
		top_left = <ScreenELementPos>
		fastscreenelementpos Id = <textid> absolute
		bottom_right = <ScreenELementPos>
		getScreenElementDims Id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		if (<pill_width> > <max_pill_width>)
			<max_pill_width> = (<pill_width>)
		endif
		<Index> = (<Index> + 1)
		repeat ($num_user_control_helpers)
	endif
	<total_width> = (((<max_pill_width> + (<scale> * $user_control_pill_end_width * 2)) * ($num_user_control_helpers)) + (($user_control_pill_gap * <scale>) * ($num_user_control_helpers - 1)))
	if (<total_width> > $action_safe_width_for_helpers)
		<max_pill_width> = ((($action_safe_width_for_helpers - (($user_control_pill_gap * <scale>) * ($num_user_control_helpers - 1))) / ($num_user_control_helpers)) - (<scale> * $user_control_pill_end_width * 2))
	endif
	Index = 0
	initial_pill_x = (640 + -1 * (($num_user_control_helpers / 2.0) * <max_pill_width>) - ((0.5 * $user_control_pill_gap * <scale>) * ($num_user_control_helpers -1)))
	pos = ((1.0, 0.0) * <initial_pill_x> + (0.0, 1.0) * ($user_control_pill_y_position) + (0.0, 0.8) * (<scale>))
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText Checksumname = pill_id 'uc_pill_%d' D = <Index>
		formatText Checksumname = pill_l_id 'uc_pill_l_%d' D = <Index>
		formatText Checksumname = pill_r_id 'uc_pill_r_%d' D = <Index>
		formatText Checksumname = textid 'uc_text_%d' D = <Index>
		formatText Checksumname = buttonid 'uc_button_%d' D = <Index>
		fastscreenelementpos Id = <buttonid> absolute
		top_left = <ScreenELementPos>
		fastscreenelementpos Id = <textid> absolute
		bottom_right = <ScreenELementPos>
		getScreenElementDims Id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
		pill_width = (<max_pill_width>)
		pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
		pill_y_offset = (<pill_height> * 0.2)
		pill_height = (<pill_height> + <pill_y_offset>)
		createScreenElement {
			Type = spriteElement
			PARENT = user_control_container
			Id = <pill_id>
			texture = Control_pill_body
			Dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [Left top]
			z_priority = <Z>
		}
		createScreenElement {
			Type = spriteElement
			PARENT = user_control_container
			Id = <pill_l_id>
			texture = Control_pill_end
			Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [Right top]
			z_priority = <Z>
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = user_control_container
			Id = <pill_r_id>
			texture = Control_pill_end
			Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <max_pill_width>)
			rgba = ($user_control_pill_color)
			just = [Left top]
			z_priority = <Z>
		}
		<Index> = (<Index> + 1)
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> + <max_pill_width>))
		repeat ($num_user_control_helpers)
	endif
	Index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		align_user_control_with_pill pill_index = <Index>
		<Index> = (<Index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript

script align_user_control_with_pill 
	formatText Checksumname = pill_id 'uc_pill_%d' D = <pill_index>
	fastscreenelementpos Id = <pill_id> absolute
	getScreenElementDims Id = <pill_id>
	pill_midpoint_x = (<ScreenELementPos>.(1.0, 0.0) + 0.5 * <width>)
	align_user_control_with_x X = <pill_midpoint_x> pill_index = <pill_index>
endscript

script align_user_control_with_x 
	formatText Checksumname = textid 'uc_text_%d' D = <pill_index>
	formatText Checksumname = buttonid 'uc_button_%d' D = <pill_index>
	fastscreenelementpos Id = <buttonid> absolute
	top_left = <ScreenELementPos>
	button_pos = <ScreenELementPos>
	fastscreenelementpos Id = <textid> absolute
	bottom_right = <ScreenELementPos>
	text_pos = <ScreenELementPos>
	getScreenElementDims Id = <textid>
	bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
	pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
	text_button_midpoint = (<top_left>.(1.0, 0.0) + 0.5 * <pill_width>)
	midpoint_diff = (<text_button_midpoint> - <X>)
	new_button_pos = (<button_pos> - (1.0, 0.0) * <midpoint_diff>)
	new_text_pos = (<text_pos> - (1.0, 0.0) * <midpoint_diff>)
	setScreenElementProps Id = <textid> pos = <new_text_pos>
	setScreenElementProps Id = <buttonid> pos = <new_button_pos>
endscript

script user_control_build_super_pill 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	Index = 0
	pos = ((0.0, 1.0) * $user_control_pill_y_position)
	leftmost = 9999.0
	rightmost = -9999.0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText Checksumname = textid 'uc_text_%d' D = <Index>
		formatText Checksumname = buttonid 'uc_button_%d' D = <Index>
		fastscreenelementpos Id = <buttonid> absolute
		top_left = <ScreenELementPos>
		fastscreenelementpos Id = <textid> absolute
		bottom_right = <ScreenELementPos>
		getScreenElementDims Id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
		button_text_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		left_x = ((1.0, 0.0).<pos>)
		right_x = ((1.0, 0.0).<pos> + <button_text_width>)
		if (<left_x> < <leftmost>)
			<leftmost> = (<left_x>)
		endif
		if (<right_x> > <rightmost>)
			<rightmost> = (<right_x>)
		endif
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		<buttonid> :SetTags calc_width = <pill_width>
		<buttonid> :SetTags calc_pos = <pos>
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> * $user_control_super_pill_gap + <pill_width>))
		<Index> = (<Index> + 1)
		repeat ($num_user_control_helpers)
	endif
	whole_pill_width = (<rightmost> - <leftmost>)
	holy_midpoint_batman = (<leftmost> + 0.5 * <whole_pill_width>)
	midpoint_diff = (<holy_midpoint_batman> - 640)
	Index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText Checksumname = textid 'uc_text_%d' D = <Index>
		formatText Checksumname = buttonid 'uc_button_%d' D = <Index>
		<buttonid> :getTags
		<calc_pos> = (<calc_pos> - (1.0, 0.0) * <midpoint_diff>)
		setScreenElementProps Id = <buttonid> pos = (<calc_pos>)
		istextstrumbar Id = <textid>
		if (<is_strumbar> = 0)
			setScreenElementProps Id = <textid> pos = (<calc_pos> + (50.0, 7.0) * <scale>)
		else
			setScreenElementProps Id = <textid> pos = (<calc_pos> + (100.0, 7.0) * <scale>)
		endif
		<Index> = (<Index> + 1)
		repeat ($num_user_control_helpers)
	endif
	pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
	pill_y_offset = (<pill_height> * 0.2)
	pill_height = (<pill_height> + <pill_y_offset>)
	pos = ((1.0, 0.0) * (<leftmost> - <midpoint_diff>) + (0.0, 1.0) * $user_control_pill_y_position)
	createScreenElement {
		Type = spriteElement
		PARENT = user_control_container
		Id = user_control_super_pill_object_main
		texture = Control_pill_body
		Dims = ((1.0, 0.0) * <whole_pill_width> + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [Left top]
		z_priority = <Z>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = user_control_container
		Id = user_control_super_pill_object_l
		texture = Control_pill_end
		Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [Right top]
		z_priority = <Z>
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = user_control_container
		Id = user_control_super_pill_object_r
		texture = Control_pill_end
		Dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <whole_pill_width>)
		rgba = ($user_control_pill_color)
		just = [Left top]
		z_priority = <Z>
	}
endscript

script fastscreenelementpos 
	getScreenElementProps Id = <Id>
	return ScreenELementPos = <pos>
endscript

script istextstrumbar 
	<Id> :getTags
	if gotParam \{is_strumbar}
		return \{is_strumbar = 1}
	else
		return \{is_strumbar = 0}
	endif
endscript

script get_diff_completion_text \{for_p2_career = 0}
	pop_progression = 0
	if ($progression_pop_count = 1)
		progression_push_current
		pop_progression = 1
	endif
	diff_completion_text = ["" "" "" ""]
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	difficulty_array = [EASY MEDIUM HARD EXPERT]
	stored_difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		stored_difficulty2 = ($current_difficulty2)
		Change \{current_difficulty2 = EXPERT}
	endif
	num_tiers = ($g_gh3_setlist.num_tiers)
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	Change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{updateatoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.Prefix)
	formatText Checksumname = tiername '%ptier%i' P = <setlist_prefix> I = <tier_index>
	formatText Checksumname = tier_checksum 'tier%s' S = <tier_index>
	getArraySize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_Size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formatText Checksumname = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <tier_index> AddToStringLookup = TRUE
	getglobaltags <song_checksum> Params = {STARS score}
	if NOT (<STARS> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	if NOT (<for_p2_career>)
		formatText Textname = diff_completion_string "%a OF %b SONGS" A = <diff_songs_completed> B = <diff_num_songs>
		setarrayelement Arrayname = diff_completion_text Index = (<diff_index>) NewValue = (<diff_completion_string>)
	else
		formatText Textname = diff_completion_string "%a of %b songs completed" A = <diff_songs_completed> B = <diff_num_songs>
		setarrayelement Arrayname = diff_completion_text Index = (<diff_index>) NewValue = (<diff_completion_string>)
	endif
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	Change current_difficulty = <stored_difficulty>
	if ($game_mode = p2_career)
		Change current_difficulty2 = <stored_difficulty2>
	endif
	if (<pop_progression> = 1)
		progression_pop_current \{updateatoms = 0}
	endif
	return diff_completion_text = <diff_completion_text>
endscript

script get_diff_completion_percentage \{for_p2_career = 0}
	pop_progression = 0
	if ($progression_pop_count = 1)
		progression_push_current
		pop_progression = 1
	endif
	diff_completion_percentage = [0 0 0 0]
	diff_completion_score = [0 0 0 0]
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	difficulty_array = [EASY MEDIUM HARD EXPERT]
	stored_difficulty = ($current_difficulty)
	if ($game_mode = p2_career)
		stored_difficulty2 = ($current_difficulty2)
		Change \{current_difficulty2 = EXPERT}
	endif
	num_tiers = ($g_gh3_setlist.num_tiers)
	percentage_complete = 0
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	diff_songs_score = 0
	Change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{updateatoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.Prefix)
	formatText Checksumname = tiername '%ptier%i' P = <setlist_prefix> I = <tier_index>
	formatText Checksumname = tier_checksum 'tier%s' S = <tier_index>
	getArraySize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_Size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formatText Checksumname = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <tier_index> AddToStringLookup = TRUE
	getglobaltags <song_checksum> Params = {STARS score}
	if NOT (<STARS> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
		<diff_songs_score> = (<diff_songs_score> + <score>)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	percentage_complete = (<percentage_complete> + (100 * <diff_songs_completed>) / <diff_num_songs>)
	setarrayelement Arrayname = diff_completion_percentage Index = (<diff_index>) NewValue = ((100 * <diff_songs_completed>) / <diff_num_songs>)
	setarrayelement Arrayname = diff_completion_score Index = (<diff_index>) NewValue = <diff_songs_score>
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	Change current_difficulty = <stored_difficulty>
	if ($game_mode = p2_career)
		Change current_difficulty2 = <stored_difficulty2>
	endif
	if (<pop_progression> = 1)
		progression_pop_current \{updateatoms = 0}
	endif
	return diff_completion_percentage = <diff_completion_percentage> total_percentage_complete = (<percentage_complete> / 4) diff_completion_score = <diff_completion_score>
endscript
winport_confirm_exit_msg = "Are you sure you want to exit?"

script winport_create_confirm_exit_popup 
	create_popup_warning_menu \{textblock = {Text = $winport_confirm_exit_msg} Menu_pos = (640.0, 490.0) dialog_dims = (288.0, 64.0) options = [{func = {ui_flow_manager_respond_to_action Params = {action = Continue}} Text = "Yes" scale = (1.0, 1.0)}{func = {ui_flow_manager_respond_to_action Params = {action = go_back}} Text = "No" scale = (1.0, 1.0)}]}
endscript

script winport_destroy_confirm_exit_popup 
	destroy_popup_warning_menu
endscript
