
script create_boss_confirmation_screen 
	new_menu \{scrollid = bc_scroll vmenuid = bc_vmenu tile_sprite = 0 Menu_pos = (605.0, 380.0)}
	create_pause_menu_frame
	text_params = {PARENT = bc_vmenu Type = textElement font = text_a4 rgba = ($menu_unfocus_color)}
	createScreenElement {
		PARENT = bc_scroll Type = textElement font = text_a4 rgba = ($menu_unfocus_color)
		Text = "PLAY BOSS BATTLE?"
		pos = {(35.0, -45.0) Relative}
	}
	createScreenElement {
		<text_params>
		Text = "YES"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = choose_yes}}
		]
	}
	createScreenElement {
		<text_params>
		Text = "NO"
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = choose_no}}
		]
	}
endscript

script destroy_boss_confirmation_screen 
	destroy_menu \{menu_id = bc_scroll}
	destroy_pause_menu_frame
endscript
