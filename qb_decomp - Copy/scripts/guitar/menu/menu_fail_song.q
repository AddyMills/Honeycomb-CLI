is_boss_song = 0
is_guitar_controller = 0

script create_fail_song_menu 
	menu_font = fontgrid_title_gh3
	get_song_struct Song = ($current_song)
	if structureContains Structure = <song_struct> boss
		Change \{is_boss_song = 1}
	else
		Change \{is_boss_song = 0}
	endif
	<Menu_pos> = (640.0, 420.0)
	<song_name_pos> = (640.0, 367.0)
	<completion_text_pos> = (640.0, 422.0)
	completion = 0
	get_song_end_time Song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	castToInteger \{completion}
	if (($game_mode = p1_career))
		if ($is_boss_song = 1)
			<Menu_pos> = (640.0, 420.0)
		else
			<Menu_pos> = (640.0, 401.0)
			<song_name_pos> = (640.0, 358.0)
			<completion_text_pos> = (640.0, 410.0)
		endif
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop)
		Min = ($difficulty_list_props.($current_difficulty).Index)
		MathMin A = <Min> B = ($difficulty_list_props.($current_difficulty2).Index)
		castToInteger \{Min}
		difficulty_index = <Min>
		get_difficulty_text_upper DIFFICULTY = ($difficulty_list [<difficulty_index>])
	else
		get_difficulty_text_upper DIFFICULTY = ($current_difficulty)
	endif
	get_song_title Song = ($current_song)
	GetUppercaseString <Song_Title>
	formatText Textname = completion_text "%d" D = <completion>
	song_failed_off = (640.0, 217.0)
	Z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = fail_song_scrolling_menu vmenuid = fail_song_vmenu_id use_backdrop = 0 Spacing = -58 Menu_pos = <Menu_pos>
	create_pause_menu_frame Z = (<Z> - 10)
	setScreenElementProps \{Id = fail_song_vmenu_id internal_just = [Center Center]}
	createScreenElement \{Type = containerElement PARENT = root_window Id = fail_song_static_text_container internal_just = [Center Center] pos = (0.0, 0.0) z_priority = 2}
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Title_BG flip_v pos = (416.0, 100.0) scale = (1.75, 1.75) Z = <Z>
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Title_BG pos = (640.0, 100.0) scale = (1.75, 1.75) Z = <Z>
	if ($is_boss_song = 1)
		title = "BATTLE LOST"
	else
		title = "SONG FAILED"
	endif
	createScreenElement {
		Type = textElement
		PARENT = fail_song_static_text_container
		font = <menu_font>
		Text = <title>
		just = [Center Center]
		pos = {<song_failed_off> Relative}
		rgba = [223 223 223 255]
		scale = (1.2, 1.2)
		z_priority = (<Z> + 0.1)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((285.0, 0.0) + (<Height> * (0.0, 1.0))) keep_ar = 1 only_if_larger_x = 1 start_x_scale = 1.2 start_y_scale = 1.2
	if ($current_song = bosstom || $current_song = bossslash || $current_song = bossdevil)
		final_blow_powerup = -1
		<final_blow_powerup> = ($player2_status.final_blow_powerup)
		Printf Channel = trchen "FINAL BLOW %s" S = <final_blow_powerup>
		if (<final_blow_powerup> > -1)
			<completion_text_pos> = (420.0, 360.0)
			<completion_text_just> = [Left Center]
			<completion_fit_dims> = (400.0, 400.0)
			createScreenElement {
				Type = HMenu
				PARENT = fail_song_static_text_container
				Id = final_blow_stacker
				just = [Right Center]
				pos = (840.0, 415.0)
				internal_just = [Right Center]
				scale = <completion_text_scale>
			}
			<finalblow_scale> = 0.7
			createScreenElement {
				Type = textElement
				font = <menu_font>
				PARENT = final_blow_stacker
				just = [Center Center]
				rgba = [210 130 0 255]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = (<Z> + 0.1)
				scale = <finalblow_scale>
				Text = "FINAL BLOW:"
				rgba = [223 223 223 255]
			}
			fit_text_in_rectangle {
				Id = <Id>
				Dims = (320.0, 400.0)
				keep_ar = 1
				only_if_larger_x = 1
				start_x_scale = <finalblow_scale>
				start_y_scale = <finalblow_scale>
			}
			createScreenElement \{Type = containerElement PARENT = final_blow_stacker Dims = (64.0, 64.0)}
			final_blow_attack_icon = ($battlemode_powerups [<final_blow_powerup>].card_texture)
			createScreenElement {
				Type = spriteElement
				PARENT = <Id>
				texture = <final_blow_attack_icon>
				rgba = [255 255 255 255]
				just = [Left top]
				pos = (10.0, -5.0)
				Dims = (64.0, 64.0)
				z_priority = (<Z> + 0.1)
			}
		else
			<completion_text_pos> = (640.0, 383.0)
			<completion_text_just> = [Center Center]
			<completion_fit_dims> = (425.0, 400.0)
		endif
		createScreenElement {
			Type = HMenu
			PARENT = fail_song_static_text_container
			Id = fail_completion_stacker
			just = <completion_text_just>
			pos = <completion_text_pos>
			internal_just = [Center Center]
			scale = <completion_text_scale>
		}
		<completion_text_params> = {
			Type = textElement
			font = <menu_font>
			PARENT = fail_completion_stacker
			just = [Center Center]
			rgba = [210 130 0 255]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 0.1)
		}
		if ($current_song = bosstom)
			lost_text = "TOM MORELLO "
			elseif ($current_song = bossslash)
			lost_text = "SLASH "
			elseif ($current_song = bossdevil)
			lost_text = "LOU "
		endif
		createScreenElement <completion_text_params> scale = 2 Text = <lost_text> rgba = [223 223 223 255]
		createScreenElement <completion_text_params> scale = 2 Text = "WINS" rgba = [223 223 223 255]
		createScreenElement <completion_text_params> scale = 1 Text = " "
		createScreenElement <completion_text_params> scale = 1 Text = "ON"
		createScreenElement <completion_text_params> scale = 1 Text = " "
		createScreenElement <completion_text_params> scale = 1 Text = <difficulty_text>
		SetScreenElementLock \{Id = fail_completion_stacker On}
		fit_text_in_rectangle {
			Id = fail_completion_stacker
			Dims = <completion_fit_dims>
			keep_ar = 1
			only_if_larger_x = 1
			start_x_scale = <completion_text_scale>
			start_y_scale = <completion_text_scale>
		}
	else
		<song_title_scale> = 1.65
		fill_song_title_and_completion_details <...> PARENT = fail_song_static_text_container
	endif
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	text_scale = (0.9, 0.95)
	if NOT English
		text_scale = (0.9, 0.85)
	endif
	displaySprite PARENT = fail_song_static_text_container tex = White pos = (492.0, 517.0) scale = (75.0, 6.0) Z = (<Z> + 0.1) rgba = <offwhite>
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Frame_Joiner pos = (480.0, 510.0) Rot_Angle = 5 scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Frame_Joiner pos = (750.0, 514.0) flip_v Rot_Angle = -5 scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite Id = hi_right PARENT = fail_song_static_text_container tex = Dialog_Highlight pos = (770.0, 533.0) just [Left top] scale = (1.0, 1.0) Z = (<Z> + 0.3)
	displaySprite Id = hi_left PARENT = fail_song_static_text_container tex = Dialog_Highlight flip_v just = [Right top] pos = (500.0, 533.0) scale = (1.0, 1.0) Z = (<Z> + 0.3)
	if NOT gotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	createScreenElement {
		Type = containerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{focus retry_highlight_focus Params = {Id = song_failed_retry}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_retry}}
			{pad_choose fail_song_menu_select_retry_song}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	createScreenElement {
		Type = textElement
		PARENT = <Id>
		Id = song_failed_retry
		font = <menu_font>
		Text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [Center top]
	}
	setScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
	endif
	Change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	if (($game_mode = p1_career && $is_boss_song = 0))
		createScreenElement {
			Type = containerElement
			PARENT = fail_song_vmenu_id
			event_handlers = [
				{focus practice_highlight_focus Params = {Id = song_failed_practice}}
				{unfocus retail_menu_unfocus Params = {Id = song_failed_practice}}
				{pad_choose fail_song_menu_select_practice}
			]
			Dims = (100.0, 100.0)
			z_priority = (<Z> + 0.1)
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			Id = song_failed_practice
			font = <menu_font>
			Text = "PRACTICE"
			rgba = ($menu_unfocus_color)
			scale = <text_scale>
			just = [Center top]
		}
		setScreenElementProps {
			Id = <Id>
			exclusive_device = <exclusive_device>
			scale = <text_scale>
		}
		getScreenElementDims Id = <Id>
		if (<width> > 220)
			fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
		endif
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG pos = (480.0, 428.0) scale = (1.25, 1.6) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h pos = (480.0, 530.0) scale = (1.25, 1.6) Z = <Z>
		elseif ($is_boss_song = 1 && $is_guitar_controller = 1)
		createScreenElement {
			Type = containerElement
			PARENT = fail_song_vmenu_id
			event_handlers = [
				{focus practice_highlight_focus Params = {Id = song_failed_tutorial}}
				{unfocus retail_menu_unfocus Params = {Id = song_failed_tutorial}}
				{pad_choose fail_song_menu_select_tutorial}
			]
			Dims = (100.0, 100.0)
			z_priority = (<Z> + 0.1)
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			Id = song_failed_tutorial
			font = <menu_font>
			Text = "TUTORIAL"
			rgba = ($menu_unfocus_color)
			scale = <text_scale>
			just = [Center top]
		}
		setScreenElementProps {
			Id = <Id>
			exclusive_device = <exclusive_device>
			scale = <text_scale>
		}
		getScreenElementDims Id = <Id>
		if (<width> > 220)
			fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
		endif
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG pos = (480.0, 450.0) scale = (1.25, 1.6) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h pos = (480.0, 552.0) scale = (1.25, 1.6) Z = <Z>
	else
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG pos = (480.0, 450.0) scale = (1.25, 1.25) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h pos = (480.0, 530.0) scale = (1.25, 1.25) Z = <Z>
	endif
	createScreenElement {
		Type = containerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{focus newsong_highlight_focus Params = {Id = song_failed_new_song}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_new_song}}
			{pad_choose fail_song_menu_select_new_song}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	createScreenElement {
		Type = textElement
		PARENT = <Id>
		Id = song_failed_new_song
		font = <menu_font>
		Text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [Center top]
	}
	setScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = containerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{focus quit_highlight_focus Params = {Id = song_failed_new_quit}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_new_quit}}
			{pad_choose fail_song_menu_select_quit}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	createScreenElement {
		Type = textElement
		PARENT = <Id>
		Id = song_failed_new_quit
		font = <menu_font>
		Text = "QUIT"
		rgba = ($menu_unfocus_color)
		scale = <text_scale>
		just = [Center top]
	}
	setScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		scale = <text_scale>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	Pausegame
	kill_start_key_binding
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if isguitarcontroller controller = <player_device>
		ui_flow_manager_respond_to_action \{action = select_tutorial}
	endif
endscript

script destroy_fail_song_menu 
	restore_start_key_binding
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = fail_song_static_text_container}
endscript

script fail_song_menu_select_practice 
	GH3_SFX_fail_song_stop_sounds
	ui_flow_manager_respond_to_action \{action = select_practice}
endscript

script fail_song_menu_select_retry_song 
	GH3_SFX_fail_song_stop_sounds
	unpauseGame
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script fail_song_menu_select_new_song 
	GH3_SFX_fail_song_stop_sounds
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_faceoff}
	endif
	ui_flow_manager_respond_to_action \{action = select_new_song}
endscript

script fail_song_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script retry_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenelementExists \{Id = hi_left}
		if ScreenelementExists \{Id = hi_right}
			getScreenElementDims Id = <Id>
			setScreenElementProps Id = hi_left pos = ((635.0, 475.0) - <width> * (0.5, 0.0)) flip_v
			setScreenElementProps Id = hi_right pos = ((645.0, 475.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setScreenElementProps Id = hi_left pos = ((635.0, 471.0) - <width> * (0.5, 0.0)) flip_v
						setScreenElementProps Id = hi_right pos = ((645.0, 471.0) + <width> * (0.5, 0.0))
					endif
				else
					setScreenElementProps Id = hi_left pos = ((635.0, 455.0) - <width> * (0.5, 0.0)) flip_v
					setScreenElementProps Id = hi_right pos = ((645.0, 455.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script practice_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenelementExists \{Id = hi_left}
		if ScreenelementExists \{Id = hi_right}
			getScreenElementDims Id = <Id>
			setScreenElementProps Id = hi_left pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
			setScreenElementProps Id = hi_right pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setScreenElementProps Id = hi_left pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
						setScreenElementProps Id = hi_right pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
					endif
				else
					setScreenElementProps Id = hi_left pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
					setScreenElementProps Id = hi_right pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script newsong_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenelementExists \{Id = hi_left}
		if ScreenelementExists \{Id = hi_right}
			getScreenElementDims Id = <Id>
			setScreenElementProps Id = hi_left pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
			setScreenElementProps Id = hi_right pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setScreenElementProps Id = hi_left pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
						setScreenElementProps Id = hi_right pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
					endif
				else
					setScreenElementProps Id = hi_left pos = ((635.0, 535.0) - <width> * (0.5, 0.0)) flip_v
					setScreenElementProps Id = hi_right pos = ((645.0, 535.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script quit_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenelementExists \{Id = hi_left}
		if ScreenelementExists \{Id = hi_right}
			getScreenElementDims Id = <Id>
			setScreenElementProps Id = hi_left pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
			setScreenElementProps Id = hi_right pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						setScreenElementProps Id = hi_left pos = ((635.0, 596.0) - <width> * (0.5, 0.0)) flip_v
						setScreenElementProps Id = hi_right pos = ((645.0, 596.0) + <width> * (0.5, 0.0))
					endif
				else
					setScreenElementProps Id = hi_left pos = ((635.0, 575.0) - <width> * (0.5, 0.0)) flip_v
					setScreenElementProps Id = hi_right pos = ((645.0, 575.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script fill_song_title_and_completion_details 
	Requireparams \{[PARENT UppercaseString] All}
	createScreenElement {
		Type = textElement
		PARENT = <PARENT>
		Id = fail_song_song_name
		font = <menu_font>
		just = [Center Center]
		Text = <UppercaseString>
		pos = <song_name_pos>
		rgba = [223 223 223 255]
		scale = <song_title_scale>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 0.1)
	}
	fit_text_in_rectangle {
		Id = fail_song_song_name
		Dims = (430.0, 65.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <song_title_scale>
		start_y_scale = <song_title_scale>
	}
	<completion_text_scale> = 0.5
	createScreenElement {
		Type = HMenu
		PARENT = <PARENT>
		Id = fail_completion_stacker
		just = [Center Center]
		pos = <completion_text_pos>
		internal_just = [Center Center]
		scale = <completion_text_scale>
	}
	<completion_text_params> = {
		Type = textElement
		font = <menu_font>
		PARENT = fail_completion_stacker
		just = [Center Center]
		rgba = [210 130 0 255]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 0.1)
	}
	createScreenElement <completion_text_params> scale = 1 Text = "COMPLETED"
	createScreenElement <completion_text_params> scale = 1 Text = " "
	createScreenElement <completion_text_params> scale = 2 Text = <completion_text>
	createScreenElement <completion_text_params> scale = 1 Text = "% "
	createScreenElement <completion_text_params> scale = 1 Text = "ON"
	createScreenElement <completion_text_params> scale = 1 Text = " "
	createScreenElement <completion_text_params> scale = 2 Text = <difficulty_text>
	SetScreenElementLock \{Id = fail_completion_stacker On}
	fit_text_in_rectangle {
		Id = fail_completion_stacker
		Dims = (405.0, 400.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <completion_text_scale>
		start_y_scale = <completion_text_scale>
	}
endscript
