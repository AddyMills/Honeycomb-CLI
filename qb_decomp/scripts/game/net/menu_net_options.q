save_changes_message = "You are about to exit the Player Options. Any changes made will not be saved if you continue. Would you like to SAVE your changes first?"

script create_online_options_menu \{menu_title = "OPTIONS"
		menu_subtitle = "ONLINE OPTIONS"
		menu_id = online_options_menu
		vmenu_id = online_options_vmenu}
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
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = online_menu_ui_container
		Pos = (0.0, 0.0)}
	displaySprite id = online_frame_crown parent = online_menu_ui_container tex = online_frame_crown Pos = (($online_general_menu_pos) + (0.0, -48.0)) dims = (192.0, 96.0) just = [center top] z = 3
	displaySprite id = online_menu_box_top parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = ($online_general_menu_pos) dims = (256.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_top_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = ($online_general_menu_pos) dims = (256.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_body parent = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (256.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_body_fill parent = online_menu_ui_container tex = window_fill_body_large rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (256.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (256.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (256.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_title_bar parent = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue) Pos = (($online_general_menu_pos) + (0.0, 128.0)) dims = (256.0, 128.0) just = [center center] z = 3
	displaySprite id = online_highlight parent = online_menu_ui_container tex = white rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) dims = (256.0, 40.0) just = [center top] z = 3
	displaySprite id = online_bookend1 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) dims = (40.0, 35.0) just = [center center] z = 3
	displaySprite id = online_bookend2 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) dims = (40.0, 35.0) just = [center center] z = 3
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
	setup_options_globals
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = quickmatch_options_container
		Pos = (0.0, 0.0)}
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
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite \{id = online_frame
		parent = quickmatch_options_container
		tex = Online_Frame_Large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = online_frame_crown
		parent = quickmatch_options_container
		tex = online_frame_crown
		Pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	CreateScreenElement {
		type = TextElement
		parent = quickmatch_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = "QUICK MATCH OPTIONS"
		Pos = (640.0, 135.0)
		just = [center top]
		z_priority = 10.0
	}
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
			{pad_choose net_copy_intial_params params = {copy_from = OptionsGameModeValue copy_to = CopyOfGlobal}}
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
			{pad_up net_custom_up_down params = {text = <game_mode_text_id> global = CopyOfGlobal type = mode direction = up}}
			{pad_down net_custom_up_down params = {text = <game_mode_text_id> global = CopyOfGlobal type = mode direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <game_mode_text_id> global = OptionsGameModeValue type = mode}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <game_mode_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = OptionsGameModeValue}}
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
		text = ($FilterTypes.mode.values [($OptionsGameModeValue)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
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
			{pad_choose net_copy_intial_params params = {copy_from = OptionsDifficultyValue copy_to = CopyOfGlobal}}
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
			{pad_up net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = diff direction = up}}
			{pad_down net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = diff direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> global = OptionsDifficultyValue type = diff}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = options diff_focus}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = OptionsDifficultyValue}}
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
		text = ($FilterTypes.diff.values [($OptionsDifficultyValue)])
		just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
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
			{pad_choose net_copy_intial_params params = {copy_from = OptionsNumSongsValue copy_to = CopyOfGlobal}}
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
			{pad_up net_custom_up_down params = {text = <num_songs_text_id> global = CopyOfGlobal type = num_songs direction = up}}
			{pad_down net_custom_up_down params = {text = <num_songs_text_id> global = CopyOfGlobal type = num_songs direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <num_songs_text_id> global = OptionsNumSongsValue type = num_songs}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = OptionsNumSongsValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> menu = options}}
		]
	}
	CreateScreenElement {
		type = TextElement
		id = <num_songs_text_id>
		parent = <num_songs_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.num_songs.values [($OptionsNumSongsValue)])
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
	block_unblock_difficulty_actions \{menu = options}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_online_quickmatch_prefs 
	if ScreenElementExists \{id = quickmatch_options_container}
		DestroyScreenElement \{id = quickmatch_options_container}
	endif
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
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
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = player_options_container
		Pos = (0.0, 0.0)}
	displaySprite \{id = online_frame
		parent = player_options_container
		tex = Online_Frame_Large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = online_frame_crown
		parent = player_options_container
		tex = online_frame_crown
		Pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	CreateScreenElement {
		type = TextElement
		parent = player_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = "GAME OPTIONS"
		Pos = (640.0, 135.0)
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

script create_online_options_changed_dialog \{menu_id = online_options_changed_menu
		vmenu_id = online_options_changed_vmenu
		Pos = (500.0, 516.0)
		z = 100}
	CreateScreenElement \{type = ContainerElement
		parent = quickmatch_options_container
		id = warning_message_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		type = vscrollingmenu
		parent = warning_message_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 150.0)
		Pos = (640.0, 465.0)
		z_priority = 15
	}
	CreateScreenElement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (298.0, 0.0)
		just = [center top]
		internal_just = [center top]
		dims = (500.0, 150.0)
		event_handlers = [
			{pad_back remove_save_dialog}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	<menu_pos> = (575.0, 487.0)
	<bookend_r_pos> = (745.0, 533.0)
	<bookend_l_pos> = (470.0, 533.0)
	change \{menu_focus_color = [180 50 50 255]}
	change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame \{parent = warning_message_container z = 16}
	displaySprite \{parent = warning_message_container
		tex = Dialog_Title_BG
		Scale = (1.7, 1.7)
		z = 19
		Pos = (640.0, 100.0)
		just = [
			RIGHT
			top
		]
		flip_v}
	displaySprite \{parent = warning_message_container
		tex = Dialog_Title_BG
		Scale = (1.7, 1.7)
		z = 19
		Pos = (640.0, 100.0)
		just = [
			left
			top
		]}
	displaySprite \{parent = warning_message_container
		tex = Dialog_Frame_Joiner
		Pos = (480.0, 510.0)
		rot_angle = 5
		Scale = (1.575, 1.5)
		z = 19}
	displaySprite \{parent = warning_message_container
		tex = Dialog_Frame_Joiner
		Pos = (750.0, 514.0)
		flip_v
		rot_angle = -5
		Scale = (1.575, 1.5)
		z = 19}
	displaySprite \{parent = warning_message_container
		tex = dialog_bg
		Pos = (480.0, 500.0)
		Scale = (1.25, 1.0)
		z = 19
		just = [
			left
			botom
		]}
	displaySprite \{parent = warning_message_container
		tex = dialog_bg
		Pos = (480.0, 530.0)
		Scale = (1.25, 1.0)
		z = 19
		just = [
			left
			top
		]
		flip_h}
	CreateScreenElement \{type = TextElement
		parent = warning_message_container
		font = fontgrid_title_gh3
		Scale = 1.3
		rgba = [
			223
			223
			223
			250
		]
		text = "WARNING"
		just = [
			center
			top
		]
		z_priority = 20.0
		Pos = (640.0, 175.0)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	CreateScreenElement \{type = TextBlockElement
		parent = warning_message_container
		font = fontgrid_title_gh3
		Scale = 0.6
		rgba = [
			210
			210
			210
			250
		]
		text = $save_changes_message
		just = [
			center
			top
		]
		internal_just = [
			center
			top
		]
		z_priority = 20.0
		Pos = (640.0, 290.0)
		dims = (700.0, 320.0)
		line_spacing = 1.0}
	CreateScreenElement \{type = ContainerElement
		parent = online_options_changed_vmenu
		dims = (100.0, 50.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				options_changed_select_save
			}
		]}
	container_id = <id>
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = (0.7, 0.85)
		rgba = ($menu_unfocus_color)
		text = "SAVE CHANGES"
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		alpha = 1.0
		just = [RIGHT center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		alpha = 1.0
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	CreateScreenElement \{type = ContainerElement
		parent = online_options_changed_vmenu
		dims = (100.0, 50.0)
		event_handlers = [
			{
				focus
				net_warning_focus
			}
			{
				unfocus
				net_warning_unfocus
			}
			{
				pad_choose
				options_changed_select_dont_save
			}
		]}
	container_id = <id>
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		local_id = text
		font = fontgrid_title_gh3
		Scale = (0.45000002, 0.85)
		rgba = ($menu_unfocus_color)
		text = "CONTINUE WITHOUT SAVING"
		just = [center top]
		z_priority = (<z> + 5)
	}
	fit_text_into_menu_item id = <id> max_width = 240
	GetScreenElementDims id = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [RIGHT center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [left center]
		Pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		alpha = 0.0
		z_priority = (<z> + 6)
		Scale = (1.0, 1.0)
	}
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_online_options_changed_dialog 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	if ScreenElementExists \{id = online_options_changed_menu}
		DestroyScreenElement \{id = online_options_changed_menu}
	endif
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
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
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_save}
endscript

script options_changed_select_dont_save 
	revert_option_changes
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_dont_save}
endscript

script check_for_options_change_go_forward 
	if ScreenElementExists \{id = quickmatch_options_vmenu}
		LaunchEvent \{type = unfocus target = quickmatch_options_vmenu}
	endif
	create_online_options_changed_dialog
endscript

script check_for_options_change_go_back 
	if ((($OptionsGameModeValue) = ($TempGameModeValue)) &&
			(($OptionsDifficultyValue) = ($TempDifficultyValue)) &&
			(($OptionsNumSongsValue) = ($TempNumSongsValue)) &&
			(($OptionsTieBreakerValue) = ($TempTieBreakerValue)) &&
			(($OptionsHighwayValue) = ($TempHighwayValue)))
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		if ScreenElementExists \{id = quickmatch_options_vmenu}
			LaunchEvent \{type = unfocus target = quickmatch_options_vmenu}
		endif
		create_online_options_changed_dialog
	endif
endscript

script save_intial_option_values 
	change TempGameModeValue = ($OptionsGameModeValue)
	change TempDifficultyValue = ($OptionsDifficultyValue)
	change TempNumSongsValue = ($OptionsNumSongsValue)
	change TempTieBreakerValue = ($OptionsTieBreakerValue)
	change TempHighwayValue = ($OptionsHighwayValue)
endscript

script revert_option_changes 
	change OptionsGameModeValue = ($TempGameModeValue)
	change OptionsDifficultyValue = ($TempDifficultyValue)
	change OptionsNumSongsValue = ($TempNumSongsValue)
	change OptionsTieBreakerValue = ($TempTieBreakerValue)
	change OptionsHighwayValue = ($TempHighwayValue)
endscript

script setup_options_globals 
	GetGlobalTags \{user_options}
	change OptionsGameModeValue = <online_game_mode>
	change OptionsDifficultyValue = <online_difficulty>
	change OptionsNumSongsValue = <online_num_songs>
	change OptionsTieBreakerValue = <online_tie_breaker>
	change OptionsHighwayValue = <online_highway>
endscript

script remove_save_dialog 
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenElementExists \{id = quickmatch_options_vmenu}
		LaunchEvent \{type = focus target = quickmatch_options_vmenu}
	endif
endscript
