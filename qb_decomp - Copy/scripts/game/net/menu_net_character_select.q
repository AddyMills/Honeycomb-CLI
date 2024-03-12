
script create_leaving_lobby_dialog \{menu_id = leaving_lobby_dialog_menu vmenu_id = leaving_lobby_dialog_vmenu pad_back_script = leaving_lobby_select_cancel pad_choose_script = leaving_lobby_select_yes pos = (640.0, 520.0) Z = 110}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	if gotParam \{PARENT}
		PARENT = <PARENT>
	else
		PARENT = root_window
	endif
	createScreenElement {
		Type = containerElement
		PARENT = <PARENT>
		Id = warning_message_container
		pos = (0.0, 0.0)
	}
	createScreenElement {
		exclusive_device = ($primary_controller)
		Type = VScrollingMenu
		PARENT = warning_message_container
		Id = <menu_id>
		just = [Center top]
		Dims = (500.0, 150.0)
		pos = (640.0, 465.0)
		z_priority = 1
	}
	createScreenElement {
		exclusive_device = ($primary_controller)
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = (298.0, 0.0)
		just = [Center top]
		internal_just = [Center top]
		Dims = (500.0, 150.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	}
	go_to_net_warning_from_pause_menu
	<Menu_pos> = (575.0, 487.0)
	<bookend_r_pos> = (675.0, 533.0)
	<bookend_l_pos> = (540.0, 533.0)
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame container_id = net_quit_warning PARENT = warning_message_container Z = <Z>
	displaySprite PARENT = warning_message_container tex = Dialog_Title_BG scale = (1.7, 1.7) Z = (<Z> + 4) pos = (640.0, 100.0) just = [Right top] flip_v
	displaySprite PARENT = warning_message_container tex = Dialog_Title_BG scale = (1.7, 1.7) Z = (<Z> + 4) pos = (640.0, 100.0) just = [Left top]
	displaySprite PARENT = warning_message_container tex = Dialog_Frame_Joiner pos = (480.0, 510.0) Rot_Angle = 5 scale = (1.575, 1.5) Z = (<Z> + 5)
	displaySprite PARENT = warning_message_container tex = Dialog_Frame_Joiner pos = (750.0, 514.0) flip_v Rot_Angle = -5 scale = (1.575, 1.5) Z = (<Z> + 5)
	displaySprite PARENT = warning_message_container tex = Dialog_BG pos = (480.0, 500.0) scale = (1.25, 1.0) Z = (<Z> + 4) just = [Left botom]
	displaySprite PARENT = warning_message_container tex = Dialog_BG pos = (480.0, 530.0) scale = (1.25, 1.0) Z = (<Z> + 4) just = [Left top] flip_h
	createScreenElement {
		Type = textElement
		PARENT = warning_message_container
		font = fontgrid_title_gh3
		scale = 1.3
		rgba = [223 223 223 250]
		Text = "WARNING"
		just = [Center top]
		z_priority = (<Z> + 5)
		pos = (640.0, 175.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textblockelement
		PARENT = warning_message_container
		font = fontgrid_title_gh3
		scale = 0.6
		rgba = [210 210 210 250]
		Text = "You are about to leave the current game. Are you sure you want to leave?"
		just = [Center top]
		internal_just = [Center top]
		z_priority = (<Z> + 5)
		pos = (640.0, 310.0)
		Dims = (700.0, 320.0)
		line_spacing = 1.0
	}
	createScreenElement {
		Type = containerElement
		PARENT = leaving_lobby_dialog_vmenu
		Dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_back_script>}
		]
	}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "NO"
		just = [Center top]
		z_priority = (<Z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 1.0
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
	}
	createScreenElement {
		Type = containerElement
		PARENT = leaving_lobby_dialog_vmenu
		Dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose <pad_choose_script> Params = <pad_choose_params>}
		]
	}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "YES"
		just = [Center top]
		z_priority = (<Z> + 5)
	}
	fit_text_into_menu_item Id = <Id> max_width = 240
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		Alpha = 0.0
		z_priority = (<Z> + 6)
		scale = (1.0, 1.0)
	}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		Change \{user_control_pill_text_color = [0 0 0 255]}
		Change \{user_control_pill_color = [180 180 180 255]}
		add_user_control_helper Text = "SELECT" button = Green Z = (<Z> - 10)
		add_user_control_helper Text = "BACK" button = Red Z = (<Z> - 10)
		add_user_control_helper Text = "UP/DOWN" button = Strumbar Z = (<Z> - 10)
	endif
	leaving_lobby_dialog_focus
endscript

script net_warning_focus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = Text}
		DoScreenElementMorph Id = {<objId> child = Text} rgba = ($menu_focus_color)
	endif
	if ScreenelementExists Id = {<objId> child = bookend_right}
		DoScreenElementMorph Id = {<objId> child = bookend_right} Alpha = 1.0 preserve_flip
	endif
	if ScreenelementExists Id = {<objId> child = bookend_left}
		DoScreenElementMorph Id = {<objId> child = bookend_left} Alpha = 1.0 preserve_flip
	endif
endscript

script net_warning_unfocus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = Text}
		DoScreenElementMorph Id = {<objId> child = Text} rgba = ($menu_unfocus_color)
	endif
	if ScreenelementExists Id = {<objId> child = bookend_right}
		DoScreenElementMorph Id = {<objId> child = bookend_right} Alpha = 0.0 preserve_flip
	endif
	if ScreenelementExists Id = {<objId> child = bookend_left}
		DoScreenElementMorph Id = {<objId> child = bookend_left} Alpha = 0.0 preserve_flip
	endif
endscript

script net_cs_go_back 
	if (<Player> = 1)
		create_leaving_lobby_dialog \{Z = 300 PARENT = menu_container}
	else
		drop_client_from_character_select
		if isHost
			net_lobby_state_message \{current_state = character_hub action = request request_state = leaving_lobby}
		endif
	endif
endscript

script leaving_lobby_select_yes 
	leaving_lobby_dialog_unfocus
	if ScreenelementExists \{Id = vmenu_character_select_p1}
		launchevent \{Type = unfocus Target = vmenu_character_select_p1}
	endif
	destroy_leaving_lobby_dialog
	destroy_net_popup
	EndGameNetScriptPump
	killspawnedScript \{Name = net_hub_stream}
	destroy_ready_icons
	network_player_lobby_message \{Type = character_select action = deselect}
	cs_go_back \{Params = {Player = 1}}
endscript

script leaving_lobby_select_cancel 
	leaving_lobby_dialog_unfocus
	destroy_leaving_lobby_dialog
endscript

script destroy_leaving_lobby_dialog 
	destroy_pause_menu_frame \{container_id = net_quit_warning}
	if (($ui_flow_manager_state [0]) = online_pause_fs)
		clean_up_user_control_helpers
	endif
	if ScreenelementExists \{Id = warning_message_container}
		DestroyScreenelement \{Id = warning_message_container}
	endif
	if ScreenelementExists \{Id = leaving_lobby_dialog_menu}
		DestroyScreenelement \{Id = leaving_lobby_dialog_menu}
	endif
endscript

script leaving_lobby_dialog_focus 
	if ScreenelementExists \{Id = vmenu_character_select_p1}
		launchevent \{Type = unfocus Target = vmenu_character_select_p1}
	endif
	if ScreenelementExists \{Id = leaving_lobby_dialog_vmenu}
		launchevent \{Type = focus Target = leaving_lobby_dialog_vmenu}
	endif
endscript

script leaving_lobby_dialog_unfocus 
	if ScreenelementExists \{Id = leaving_lobby_dialog_vmenu}
		launchevent \{Type = unfocus Target = leaving_lobby_dialog_vmenu}
	endif
	if ScreenelementExists \{Id = vmenu_character_select_p1}
		launchevent \{Type = focus Target = vmenu_character_select_p1}
	endif
endscript

script go_to_net_warning_from_pause_menu 
	if ScreenelementExists \{Id = pause_menu_frame_container}
		destroy_pause_menu_frame \{container_id = net_quit_warning}
		destroy_menu \{menu_id = scrolling_pause}
		destroy_menu \{menu_id = pause_menu_frame_container}
		killspawnedScript \{Name = animate_bunny_flame}
	endif
endscript

script return_to_pause_menu_from_net_warning 
	destroy_leaving_lobby_dialog
	create_pause_menu
endscript

script pause_menu_really_quit_net_game 
	leaving_lobby_dialog_unfocus
	destroy_leaving_lobby_dialog
	ui_flow_manager_respond_to_action \{action = select_quit create_params = {Player = 1}}
endscript
