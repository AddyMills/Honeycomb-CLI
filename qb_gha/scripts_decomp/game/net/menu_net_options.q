save_changes_message = "You are about to exit the Player Options. Any changes made will not be saved if you continue. Would you like to SAVE your changes first?"

script create_online_options_menu \{menu_title = "OPTIONS" menu_subtitle = "ONLINE OPTIONS" menu_id = online_options_menu vmenu_id = online_options_vmenu}
	setup_options_globals
	CreateScreenElement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (256.0, 350.0)
		Pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	CreateScreenElement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [center top]
		internal_just = [center center]
		dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{type = ContainerElement parent = root_window id = online_menu_ui_container Pos = (0.0, 0.0)}
	displaySprite id = online_frame_crown parent = online_menu_ui_container tex = online_frame_crown Pos = (($online_general_menu_pos) + (0.0, -48.0)) dims = (192.0, 96.0) just = [center top] z = 3
	displaySprite id = online_menu_box_top parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = ($online_general_menu_pos) dims = (256.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_top_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = ($online_general_menu_pos) dims = (256.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_body parent = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (256.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_body_fill parent = online_menu_ui_container tex = window_fill_body_large rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (256.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (256.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (256.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_title_bar parent = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue) Pos = (($online_general_menu_pos) + (0.0, 128.0)) dims = (256.0, 128.0) just = [center center] z = 3
	displaySprite id = online_highlight parent = online_menu_ui_container tex = hilite_bar_01 rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) dims = (256.0, 40.0) just = [center top] z = 3
	displaySprite id = online_bookend1 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) dims = (40.0, 40.0) just = [center center] z = 3 flip_v
	displaySprite id = online_bookend2 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) dims = (40.0, 40.0) just = [center center] z = 3
	CreateScreenElement {
		type = TextElement
		parent = online_menu_ui_container
		font = text_a4
		Scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [center top]
		Pos = (($online_general_menu_pos) + (0.0, 32.0))
		z_priority = 3.0
	}
	CreateScreenElement {
		type = TextElement
		parent = online_menu_ui_container
		font = fontgrid_title_gh3
		Scale = (0.7, 0.75)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [center top]
		Pos = (($online_general_menu_pos) + (0.0, 115.0))
		z_priority = 4.0
	}
	selectable_menu_items = 0
	CreateScreenElement {
		type = TextElement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.5, 0.75)
		rgba = ($online_light_blue)
		text = "QUICK MATCH OPTIONS"
		just = [left top]
		z_priority = 4.0
	}
	<id> :settags menu_item = <selectable_menu_items>
	<id> :setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_quickmatch_player}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		type = TextElement
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = "GAME OPTIONS"
		just = [left top]
		z_priority = 4.0
	}
	<id> :settags menu_item = <selectable_menu_items>
	<id> :setprops event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_player_pref}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_online_options_menu 
	if ScreenElementExists \{id = online_menu_ui_container}
		DestroyScreenElement \{id = online_menu_ui_container}
	endif
	if ScreenElementExists \{id = online_options_menu}
		DestroyScreenElement \{id = online_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_options_select_quickmatch_player 
	ui_flow_manager_respond_to_action \{action = select_quickmatch_pref}
endscript

script online_options_select_player_pref 
	ui_flow_manager_respond_to_action \{action = select_player_pref}
endscript

script create_online_quickmatch_prefs \{menu_id = quickmatch_options_menu vmenu_id = quickmatch_options_vmenu}
	save_intial_option_values
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	CreateScreenElement \{type = ContainerElement parent = root_window id = quickmatch_options_container Pos = (0.0, 0.0)}
	CreateScreenElement {
		type = vscrollingmenu
		parent = quickmatch_options_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		Pos = (640.0, 300.0)
		z_priority = 1
	}
	CreateScreenElement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_option check_for_options_change_go_forward}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_UI_frame {
		parent = quickmatch_options_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaySprite \{id = online_frame_crown parent = quickmatch_options_container tex = online_frame_crown Pos = (640.0, 42.0) just = [center top] z = 3 dims = (256.0, 105.0)}
	if ($ui_flow_manager_state [0] = quickmatch_player_options_fs)
		Title = "QUICK MATCH: PLAYER"
		game_mode_global = OptionsGameModeValue
		num_songs_global = OptionsNumSongsValue
		difficulty_global = OptionsDifficultyValue
		button_down_events = 2
		player_match = 1
	else
		Title = "QUICK MATCH: RANKED"
		game_mode_global = OptionsGameModeRanked
		num_songs_global = OptionsNumSongsRanked
		difficulty_global = OptionsDifficultyRanked
		button_down_events = 3
		player_match = 0
	endif
	CreateScreenElement {
		type = TextElement
		parent = quickmatch_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_purple)
		text = <Title>
		Pos = (640.0, 153.0)
		just = [center top]
		z_priority = 10.0
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((500.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.85 start_y_scale = 0.85 only_if_larger_x = 1
	CreateScreenElement {
		type = TextElement
		id = game_mode
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = "GAME MODE:"
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = game_mode text_id = <game_mode_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <game_mode_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = <game_mode_global> copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		type = vmenu
		id = <game_mode_vmenu_id>
		parent = game_mode
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <game_mode_text_id> global = CopyOfGlobal type = mode direction = up player_match = <player_match>}}
			{pad_down net_custom_up_down params = {text = <game_mode_text_id> global = CopyOfGlobal type = mode direction = down player_match = <player_match>}}
			{pad_back net_commit_or_reset_params params = {text = <game_mode_text_id> global = <game_mode_global> type = mode}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = <game_mode_global>}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
		]
	}
	CreateScreenElement {
		type = TextElement
		id = <game_mode_text_id>
		parent = <game_mode_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.mode.values [($<game_mode_global>)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	if NOT ($ui_flow_manager_state [0] = quickmatch_player_options_fs)
		CreateScreenElement {
			type = TextElement
			id = difficulty
			parent = <vmenu_id>
			font = fontgrid_title_gh3
			Scale = 0.65000004
			rgba = ($online_light_blue)
			text = "DIFFICULTY:"
			just = [left top]
			z_priority = 10.0
			event_handlers = [
				{focus net_custom_ui_focus params = {this_id = difficulty text_id = <difficulty_text_id> vmenu = <vmenu_id>}}
				{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
				{pad_choose net_custom_ui_change_focus params = {this_id = difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
				{pad_choose net_copy_intial_params params = {copy_from = <difficulty_global> copy_to = CopyOfGlobal}}
			]
		}
		CreateScreenElement {
			type = vmenu
			id = <difficulty_vmenu_id>
			parent = difficulty
			Pos = (550.0, 0.0)
			just = [left top]
			internal_just = [left top]
			event_handlers = [
				{pad_up animate_helper_arrows params = {direction = up}}
				{pad_down animate_helper_arrows params = {direction = down}}
				{pad_up net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = diff direction = up player_match = <player_match>}}
				{pad_down net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = diff direction = down player_match = <player_match>}}
				{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> global = <difficulty_global> type = diff}}
				{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
				{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = <difficulty_global>}}
				{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
			]
		}
		CreateScreenElement {
			type = TextElement
			id = <difficulty_text_id>
			parent = <difficulty_vmenu_id>
			font = fontgrid_title_gh3
			Scale = 1.0
			rgba = ($online_light_blue)
			text = ($FilterTypes.diff.values [($<difficulty_global>)])
			just = [left top]
			z_priority = 10.0
		}
		fit_text_into_menu_item id = <id> max_width = 375
	endif
	CreateScreenElement {
		type = TextElement
		id = number_of_songs
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = "NUMBER OF SONGS:"
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <num_songs_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = <num_songs_global> copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		type = vmenu
		id = <num_songs_vmenu_id>
		parent = number_of_songs
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <num_songs_text_id> global = CopyOfGlobal type = num_songs direction = up player_match = <player_match>}}
			{pad_down net_custom_up_down params = {text = <num_songs_text_id> global = CopyOfGlobal type = num_songs direction = down player_match = <player_match>}}
			{pad_back net_commit_or_reset_params params = {text = <num_songs_text_id> global = <num_songs_global> type = num_songs}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = <num_songs_global>}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
		]
	}
	if ($OptionsGameModeValue = 4)
		<text> = ($FilterTypes.num_songs.values_coop [($<num_songs_global>)])
	else
		<text> = ($FilterTypes.num_songs.values [($<num_songs_global>)])
	endif
	CreateScreenElement {
		type = TextElement
		id = <num_songs_text_id>
		parent = <num_songs_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = <text>
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		type = TextElement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = "DONE"
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :settags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "CANCEL" button = red z = 100}
	add_user_control_helper \{text = "START SEARCH" button = blue z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
	LaunchEvent type = focus target = <vmenu_id>
	begin
	LaunchEvent type = pad_down target = <vmenu_id>
	repeat <button_down_events>
endscript

script destroy_online_quickmatch_prefs 
	if ScreenElementExists \{id = quickmatch_options_container}
		DestroyScreenElement \{id = quickmatch_options_container}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = quickmatch_options_menu}
	destroy_menu_backdrop
endscript

script create_online_player_prefs \{menu_id = game_options_menu vmenu_id = game_options_vmenu}
	highway_layout_vmenu_id = highway_layout_selection
	highway_layout_text_id = highway_layout_selection_text
	CreateScreenElement {
		type = vscrollingmenu
		parent = root_window
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		Pos = (640.0, 330.0)
		z_priority = 1
	}
	CreateScreenElement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (250.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{type = ContainerElement parent = root_window id = player_options_container Pos = (0.0, 0.0)}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_UI_frame {
		parent = player_options_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaySprite \{id = online_frame_crown parent = player_options_container tex = online_frame_crown Pos = (640.0, 42.0) just = [center top] z = 3 dims = (256.0, 105.0)}
	CreateScreenElement {
		type = TextElement
		parent = player_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_purple)
		text = "GAME OPTIONS"
		Pos = (640.0, 153.0)
		just = [center top]
		z_priority = 10.0
	}
	CreateScreenElement {
		type = TextElement
		id = highway_layout
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = "HIGHWAY LAYOUT:"
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = highway_layout text_id = <highway_layout_text_id> vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <highway_layout_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = highway_layout text_id = <highway_layout_text_id> to = <highway_layout_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = OptionsHighwayValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		type = vmenu
		id = <highway_layout_vmenu_id>
		parent = highway_layout
		Pos = (500.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <highway_layout_text_id> global = CopyOfGlobal type = vport direction = up}}
			{pad_down net_custom_up_down params = {text = <highway_layout_text_id> global = CopyOfGlobal type = vport direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <highway_layout_text_id> global = OptionsHighwayValue type = vport}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <highway_layout_vmenu_id>}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = OptionsHighwayValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <highway_layout_vmenu_id>}}
		]
	}
	CreateScreenElement {
		type = TextElement
		id = <highway_layout_text_id>
		parent = <highway_layout_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.vport.values [($OptionsHighwayValue)])
		just = [left top]
		z_priority = 10.0
	}
	CreateScreenElement {
		type = TextElement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = "DONE"
		just = [left top]
		z_priority = 10.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection vmenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :settags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_online_player_prefs 
	if ScreenElementExists \{id = player_options_container}
		DestroyScreenElement \{id = player_options_container}
	endif
	if ScreenElementExists \{id = game_options_menu}
		DestroyScreenElement \{id = game_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_online_options_changed_dialog \{menu_id = online_options_changed_menu vmenu_id = online_options_changed_vmenu Pos = (500.0, 516.0) z = 100 save_func = options_changed_select_save save_params = {} nosave_func = options_changed_select_dont_save nosave_params = {}}
	<menu_pos> = (575.0, 487.0)
	set_focus_color \{color = pink}
	set_unfocus_color \{color = dk_violet_grey}
	create_popup_warning_menu {
		textblock = {
			text = $save_changes_message
			dims = (700.0, 320.0)
			Scale = 0.6
		}
		no_background
		menu_pos = <menu_pos>
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = <save_func>
				params = <save_params>
				text = "SAVE CHANGES"
			}
			{
				func = <nosave_func>
				params = <nosave_params>
				text = "CONTINUE WITHOUT SAVING"
			}
		]
	}
endscript

script destroy_online_options_changed_dialog 
	destroy_popup_warning_menu
	destroy_menu_backdrop
	if ScreenElementExists \{id = online_options_changed_menu}
		DestroyScreenElement \{id = online_options_changed_menu}
	endif
endscript

script options_changed_select_save 
	FormatText \{checksumname = player_status 'player1_status'}
	switch (($OptionsHighwayValue))
		case 0
		change structurename = <player_status> highway_layout = default_highway
		case 1
		change structurename = <player_status> highway_layout = solo_highway
	endswitch
	SetGlobalTags user_options params = {
		online_game_mode = ($OptionsGameModeValue)
		online_difficulty = ($OptionsDifficultyValue)
		online_num_songs = ($OptionsNumSongsValue)
		online_tie_breaker = ($OptionsTieBreakerValue)
		online_highway = ($OptionsHighwayValue)
	}
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_save}
endscript

script options_changed_select_dont_save 
	revert_option_changes
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_dont_save}
endscript

script check_for_options_change_go_forward 
	if ((($OptionsGameModeValue) = ($TempGameModeValue)) &&
			(($OptionsDifficultyValue) = ($TempDifficultyValue)) &&
			(($OptionsNumSongsValue) = ($TempNumSongsValue)) &&
			(($OptionsTieBreakerValue) = ($TempTieBreakerValue)) &&
			(($OptionsHighwayValue) = ($TempHighwayValue)) &&
			(($OptionsGameModeRanked) = ($TempGameModeRanked)) &&
			(($OptionsDifficultyRanked) = ($TempDifficultyRanked)) &&
			(($OptionsNumSongsRanked) = ($TempNumSongsRanked)))
		ui_flow_manager_respond_to_action \{action = start_quickmatch}
	else
		SetGlobalTags user_options params = {
			online_game_mode = ($OptionsGameModeValue)
			online_difficulty = ($OptionsDifficultyValue)
			online_num_songs = ($OptionsNumSongsValue)
			online_tie_breaker = ($OptionsTieBreakerValue)
			online_highway = ($OptionsHighwayValue)
			online_game_mode_ranked = ($OptionsGameModeRanked)
			online_difficulty_ranked = ($OptionsDifficultyRanked)
			online_num_songs_ranked = ($OptionsNumSongsRanked)
		}
		if ScreenElementExists \{id = quickmatch_options_vmenu}
			LaunchEvent \{type = unfocus target = quickmatch_options_vmenu}
		endif
		create_online_options_changed_dialog \{save_func = ui_flow_manager_respond_to_action save_params = {action = save} nosave_func = check_for_options_change_no_save_continue}
	endif
endscript

script check_for_options_change_no_save_continue 
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = start_quickmatch}
endscript

script check_for_options_change_go_back 
	revert_option_changes
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script save_intial_option_values 
	printf \{"--- save_intial_option_values ---"}
	change TempGameModeValue = ($OptionsGameModeValue)
	change TempDifficultyValue = ($OptionsDifficultyValue)
	change TempNumSongsValue = ($OptionsNumSongsValue)
	change TempTieBreakerValue = ($OptionsTieBreakerValue)
	change TempHighwayValue = ($OptionsHighwayValue)
	change TempGameModeRanked = ($OptionsGameModeRanked)
	change TempDifficultyRanked = ($OptionsDifficultyRanked)
	change TempNumSongsRanked = ($OptionsNumSongsRanked)
endscript

script revert_option_changes 
	printf \{"--- revert_option_changes ---"}
	change OptionsGameModeValue = ($TempGameModeValue)
	change OptionsDifficultyValue = ($TempDifficultyValue)
	change OptionsNumSongsValue = ($TempNumSongsValue)
	change OptionsTieBreakerValue = ($TempTieBreakerValue)
	change OptionsHighwayValue = ($TempHighwayValue)
	change OptionsGameModeRanked = ($TempGameModeRanked)
	change OptionsDifficultyRanked = ($TempDifficultyRanked)
	change OptionsNumSongsRanked = ($TempNumSongsRanked)
endscript

script setup_options_globals 
	printf \{"--- setup_options_globals ---"}
	GetGlobalTags \{user_options}
	change OptionsGameModeValue = <online_game_mode>
	change OptionsDifficultyValue = <online_difficulty>
	change OptionsNumSongsValue = <online_num_songs>
	change OptionsTieBreakerValue = <online_tie_breaker>
	change OptionsHighwayValue = <online_highway>
	change OptionsGameModeRanked = <online_game_mode_ranked>
	change OptionsDifficultyRanked = <online_difficulty_ranked>
	change OptionsNumSongsRanked = <online_num_songs_ranked>
endscript

script remove_save_dialog 
	destroy_popup_warning_menu
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenElementExists \{id = quickmatch_options_vmenu}
		LaunchEvent \{type = focus target = quickmatch_options_vmenu}
	endif
endscript
