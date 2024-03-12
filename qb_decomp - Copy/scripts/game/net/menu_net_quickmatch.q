
script create_quickmatch_searching_dialog {
		menu_id = quickmatch_searching_dialog_menu
		vmenu_id = quickmatch_searching_dialog_vmenu
		pos = (($Menu_pos) + (-400.0, 100.0))
	}
	if ScreenelementExists \{Id = quickmatch_options_menu}
		destroy_menu \{menu_id = quickmatch_options_menu}
	endif
	if ScreenelementExists \{Id = online_main_menu}
		destroy_menu \{menu_id = online_main_menu}
	endif
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) Menu_pos = <pos>
	if isxenon
		createScreenElement {
			Type = textElement
			PARENT = <vmenu_id>
			font = text_A1
			scale = 0.5
			rgba = [210 210 210 250]
			Text = "Online"
			just = [Left top]
			z_priority = 100.0
			block_events
		}
	else
		createScreenElement {
			Type = textElement
			PARENT = <vmenu_id>
			font = text_A1
			scale = 0.5
			rgba = [210 210 210 250]
			Text = "Online"
			just = [Left top]
			z_priority = 100.0
			block_events
		}
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		scale = 0.5
		rgba = [210 210 210 250]
		Text = "Finding sessions..."
		just = [Left top]
		z_priority = 100.0
		block_events
	}
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		scale = 0.5
		rgba = [210 210 210 250]
		Text = "CANCEL"
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_searching_dialog_select_cancel}
		]
	}
	launchevent Type = focus Target = <vmenu_id>
	NetSessionfunc \{Obj = match func = stop_server_list}
	NetSessionfunc \{Obj = match func = free_server_list}
	NetSessionfunc \{Obj = match func = set_server_list_mode Params = {quickmatch}}
	NetSessionfunc \{Obj = match func = start_server_list}
endscript

script destroy_quickmatch_searching_dialog 
	destroy_menu \{menu_id = quickmatch_searching_dialog_menu}
	destroy_menu_backdrop
endscript

script quickmatch_searching_dialog_select_cancel 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_quickmatch_create_match_dialog {
		menu_id = quickmatch_create_match_dialog_menu
		vmenu_id = quickmatch_create_match_dialog_vmenu
		pos = (($Menu_pos) + (-400.0, 100.0))
	}
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) Menu_pos = <pos>
	if isxenon
		createScreenElement {
			Type = textElement
			PARENT = <vmenu_id>
			font = text_A1
			scale = 0.5
			rgba = [210 210 210 250]
			Text = "Online"
			just = [Left top]
			z_priority = 100.0
			block_events
		}
	else
		createScreenElement {
			Type = textElement
			PARENT = <vmenu_id>
			font = text_A1
			scale = 0.5
			rgba = [210 210 210 250]
			Text = "PLAYSTATION®Network"
			just = [Left top]
			z_priority = 100.0
			block_events
		}
	endif
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		scale = 0.5
		rgba = [210 210 210 250]
		Text = "No sessions are available. Would you like to Create a Match?"
		just = [Left top]
		z_priority = 100.0
		block_events
	}
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		scale = 0.5
		rgba = [210 210 210 250]
		Text = "CREATE MATCH"
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_create}
		]
	}
	createScreenElement {
		Type = textElement
		PARENT = <vmenu_id>
		font = text_A1
		scale = 0.5
		rgba = [210 210 210 250]
		Text = "CANCEL"
		just = [Left top]
		z_priority = 100.0
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose quickmatch_dialog_select_cancel}
		]
	}
	launchevent Type = focus Target = <vmenu_id>
endscript

script destroy_quickmatch_create_match_dialog 
	destroy_online_server_list
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	destroy_menu_backdrop
endscript

script quickmatch_dialog_select_create 
	ui_flow_manager_respond_to_action \{action = response_create_selected create_params = {menu_type = create_match}}
endscript

script quickmatch_dialog_select_cancel 
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript
