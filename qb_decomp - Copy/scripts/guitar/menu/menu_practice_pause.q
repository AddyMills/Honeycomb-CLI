
script create_practice_pause_menu 
	if ($view_mode)
		return
	endif
	if isWinPort
		Change \{winport_in_top_pause_menu = 1}
	endif
	safe_create_gh3_pause_menu
	new_menu scrollid = scrolling_pause vmenuid = vmenu_pause Menu_pos = (0.0, 245.0) Spacing = -12 use_backdrop = (0)
	setScreenElementProps \{Id = vmenu_pause internal_just = [Center top] Dims = (1280.0, 720.0)}
	Z = 100
	create_pause_menu_frame x_scale = 1.2 Z = (<Z> - 10)
	scale = 1
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Text = "RESUME"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose gh3_start_pressed}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Text = "RESTART"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_restart}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Text = "CHANGE SPEED"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_speed}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Text = "CHANGE SECTION"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_change_section}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Text = "NEW SONG"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_new_song}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = <scale>
		rgba = [210 130 0 250]
		Id = quit_id
		Text = "QUIT"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = select_quit}}
		]
	}
	switch ($came_to_practice_from)
		case Career
		quit_id :SetProps \{Text = "QUIT TO CAREER SETLIST"}
		case QUICKPLAY
		quit_id :SetProps \{Text = "QUIT TO QUICKPLAY SETLIST"}
	endswitch
endscript

script destroy_practice_pause_menu 
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	if isWinPort
		Change \{winport_in_top_pause_menu = 1}
	endif
endscript
