
script create_practice_end_menu 
	if ($view_mode)
		return
	endif
	safe_create_gh3_pause_menu
	new_menu scrollid = scrolling_pause vmenuid = vmenu_pause Menu_pos = (480.0, 255.0) Spacing = -12 use_backdrop = (0)
	Z = 100
	create_pause_menu_frame Z = (<Z> - 10)
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = 1.1
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
			{pad_choose ui_flow_manager_respond_to_action Params = {action = restart}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = 1.1
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
			{pad_choose ui_flow_manager_respond_to_action Params = {action = change_speed}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = 1.1
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
			{pad_choose ui_flow_manager_respond_to_action Params = {action = change_section}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = 1.1
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
			{pad_choose ui_flow_manager_respond_to_action Params = {action = new_song}}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = vmenu_pause
		font = fontgrid_title_gh3
		scale = 1.1
		rgba = [210 130 0 250]
		Text = "EXIT"
		just = [Left top]
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba [0 0 0 255]
		z_priority = <Z>
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = exit}}
		]
	}
endscript

script destroy_practice_end_menu 
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
endscript
