
script create_select_num_songs_menu \{menu_title = "CREATE MATCH" menu_subtitle = "NUMBER OF SONGS" menu_id = create_num_songs_menu vmenu_id = create_num_songs_vmenu}
	createScreenElement \{Type = containerElement PARENT = root_window Id = online_menu_ui_container pos = (0.0, 0.0)}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = online_menu_ui_container
		Id = <menu_id>
		just = [Center top]
		Dims = (256.0, 350.0)
		pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [Center top]
		internal_just = [Center Center]
		Dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite Id = Online_Frame_Crown PARENT = online_menu_ui_container tex = Online_Frame_Crown pos = (($online_general_menu_pos) + (0.0, -48.0)) Dims = (192.0, 96.0) just = [Center top] Z = 3
	displaySprite Id = online_menu_box_top PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) pos = ($online_general_menu_pos) Dims = (288.0, 64.0) just = [Center top] Z = 2
	displaySprite Id = online_menu_box_top_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] pos = ($online_general_menu_pos) Dims = (288.0, 64.0) just = [Center top] Z = 2
	displaySprite Id = online_menu_box_body PARENT = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (($online_general_menu_pos) + (0.0, 64.0)) Dims = (288.0, 432.0) just = [Center top] Z = 2 flip_h
	displaySprite Id = online_menu_box_body_fill PARENT = online_menu_ui_container tex = window_fill_body_large rgba = [0 0 0 200] pos = (($online_general_menu_pos) + (0.0, 64.0)) Dims = (288.0, 432.0) just = [Center top] Z = 2 flip_h
	displaySprite Id = online_menu_box_bottom PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (($online_general_menu_pos) + (0.0, 496.0)) Dims = (288.0, 64.0) just = [Center top] Z = 2 flip_h
	displaySprite Id = online_menu_box_bottom_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] pos = (($online_general_menu_pos) + (0.0, 496.0)) Dims = (288.0, 64.0) just = [Center top] Z = 2 flip_h
	displaySprite Id = online_title_bar PARENT = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue) pos = (($online_general_menu_pos) + (0.0, 128.0)) Dims = (288.0, 128.0) just = [Center Center] Z = 3
	displaySprite Id = online_highlight PARENT = online_menu_ui_container tex = White rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) Dims = (288.0, 40.0) just = [Center top] Z = 3
	displaySprite Id = online_bookend1 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) Dims = (40.0, 35.0) just = [Center Center] Z = 3
	displaySprite Id = online_bookend2 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) Dims = (40.0, 35.0) just = [Center Center] Z = 3
	createScreenElement {
		Type = textElement
		PARENT = online_menu_ui_container
		font = text_a4
		scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		Text = <menu_title>
		just = [Center top]
		pos = (($online_general_menu_pos) + (-5.0, 32.0))
		z_priority = 3.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	createScreenElement {
		Type = textElement
		PARENT = online_menu_ui_container
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_dark_purple)
		Text = <menu_subtitle>
		just = [Center top]
		pos = (($online_general_menu_pos) + (0.0, 115.0))
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	selectable_menu_items = 0
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = "1"
		just = [Left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_1}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		formatText \{Textname = option_text_num3 "3"}
	else
		formatText \{Textname = option_text_num3 "Best of 3"}
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num3>
		just = [Left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_3}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		formatText \{Textname = option_text_num5 "5"}
	else
		formatText \{Textname = option_text_num5 "Best of 5"}
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num5>
		just = [Left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_5}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	if ($game_mode = p2_coop)
		formatText \{Textname = option_text_num7 "7"}
	else
		formatText \{Textname = option_text_num7 "Best of 7"}
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = <option_text_num7>
		just = [Left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 223
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_num_songs Params = {Type = num_7}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos Menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	launchevent Type = focus Target = <vmenu_id>
endscript

script destroy_select_num_songs_menu 
	if ScreenelementExists \{Id = online_menu_ui_container}
		DestroyScreenelement \{Id = online_menu_ui_container}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_num_songs 
	Change num_songs = <Type>
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
