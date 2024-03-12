tutorial_select_menu_font = text_a4
menu_tutorial_select_num_items = 3
winport_in_tutorial = 0

script create_tutorial_select_menu 
	Change \{winport_in_tutorial = 0}
	Change \{rich_presence_context = presence_tutorial}
	createScreenElement {
		PARENT = root_window
		Id = ts_container
		Type = containerElement
		pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	new_menu \{scrollid = ts_scroll vmenuid = ts_vmenu font = $video_settings_menu_font Menu_pos = (300.0, 405.0) Spacing = 2 text_left}
	Change \{menu_focus_color = [115 10 10 255]}
	Change \{menu_unfocus_color = [150 170 215 255]}
	displayText \{PARENT = ts_container pos = (800.0, 560.0) just = [Center Center] Text = "TUTORIALS" scale = 1.5 rgba = [180 180 180 255] font = $video_settings_menu_font noshadow}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{PARENT = ts_container tex = options_video_poster pos = (640.0, 365.0) Dims = (1024.0, 512.0) just = [Center Center] Z = 1 font = $video_settings_menu_font}
	displaySprite \{tex = Tape_H_02 PARENT = ts_container pos = (275.0, 120.0) Dims = (160.0, 64.0) Rot_Angle = -40 just = [Center Center] Z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 6
	}
	displaySprite \{tex = Tape_H_02 PARENT = ts_container pos = (980.0, 110.0) Dims = (160.0, 64.0) Rot_Angle = 20 just = [Center Center] Z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 6
	}
	displaySprite \{PARENT = ts_container Id = ts_hilite tex = White pos = (285.0, 415.0) rgba = [185 190 200 255] Dims = (305.0, 35.0) Z = 2}
	text_params = {PARENT = ts_vmenu Type = textElement font = $video_settings_menu_font rgba = ($menu_unfocus_color) scale = 0.75 z_priority = 3}
	createScreenElement {
		<text_params>
		Id = ts_basic
		Text = "BASIC LESSONS"
		event_handlers = [
			{focus ts_focus Params = {item = basic hilite_pos = (285.0, 423.0)}}
			{unfocus ts_unfocus Params = {item = basic}}
			{pad_choose menu_tutorial_select_choose_basic}
		]
	}
	createScreenElement {
		<text_params>
		Id = ts_star
		Text = "STAR POWER"
		event_handlers = [
			{focus ts_focus Params = {item = Star hilite_pos = (285.0, 466.0)}}
			{unfocus ts_unfocus Params = {item = Star}}
			{pad_choose menu_tutorial_select_choose_star_power}
		]
	}
	createScreenElement {
		<text_params>
		Id = ts_battle
		Text = "GUITAR BATTLE"
		event_handlers = [
			{focus ts_focus Params = {item = battle hilite_pos = (285.0, 510.0)}}
			{unfocus ts_unfocus Params = {item = battle}}
			{pad_choose menu_tutorial_select_choose_battle}
		]
	}
	createScreenElement {
		<text_params>
		Id = ts_advanced
		Text = "ADVANCED TECHNIQUES"
		event_handlers = [
			{focus ts_focus Params = {item = advanced hilite_pos = (285.0, 553.0)}}
			{unfocus ts_unfocus Params = {item = advanced}}
			{pad_choose menu_tutorial_select_choose_advanced}
		]
	}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	getglobaltags \{training}
	complete_color = [150 20 50 255]
	not_complete_color = $menu_unfocus_color
	if (<basic_lesson> = Complete)
		ts_add_skull pos = (282.0, 440.0) Color = <complete_color>
	else
		ts_add_skull pos = (282.0, 440.0) Color = <not_complete_color>
	endif
	if (<star_power_lesson> = Complete)
		ts_add_skull pos = (282.0, 483.0) Color = <complete_color>
	else
		ts_add_skull pos = (282.0, 483.0) Color = <not_complete_color>
	endif
	if (<guitar_battle_lesson> = Complete)
		ts_add_skull pos = (282.0, 526.0) Color = <complete_color>
	else
		ts_add_skull pos = (282.0, 526.0) Color = <not_complete_color>
	endif
	if (<advanced_techniques_lesson> = Complete)
		ts_add_skull pos = (282.0, 569.0) Color = <complete_color>
	else
		ts_add_skull pos = (282.0, 569.0) Color = <not_complete_color>
	endif
	if ($select_battle_tutorial = 1)
		launchevent \{Type = pad_down}
		launchevent \{Type = pad_down}
		Change \{select_battle_tutorial = 0}
	else
		retail_menu_focus \{Id = ts_basic}
	endif
endscript

script ts_add_skull 
	displaySprite {
		tex = Toprockers_Skull
		PARENT = ts_container
		pos = <pos>
		Dims = (24.0, 24.0)
		Rot_Angle = 0
		just = [Center Center]
		rgba = <Color>
		Z = 7
	}
	displaySprite {
		tex = Toprockers_Skull
		PARENT = ts_container
		pos = <pos>
		Dims = (26.0, 26.0)
		Rot_Angle = 0
		just = [Center Center]
		rgba = [0 0 0 255]
		Z = 6
	}
endscript

script ts_focus 
	retail_menu_focus
	getTags
	<Id> :getTags
	if ScreenelementExists \{Id = ts_hilite}
		ts_hilite :SetProps pos = <hilite_pos>
	endif
endscript

script ts_unfocus 
	retail_menu_unfocus
	return
endscript

script destroy_tutorial_select_menu 
	Printf \{Channel = newdebug "destroy tutorial select screen......"}
	if NOT isWinPort
		restore_start_key_binding
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ts_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = ts_scroll}
	destroy_menu \{menu_id = ts_basic}
	destroy_menu \{menu_id = ts_star}
	destroy_menu \{menu_id = ts_battle}
	destroy_menu \{menu_id = ts_advanced}
endscript

script menu_tutorial_select_choose_basic 
	Change \{winport_in_tutorial = 1}
	set_training_script \{Name = training_basic_tutorial_script}
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script menu_tutorial_select_choose_star_power 
	Change \{winport_in_tutorial = 1}
	set_training_script \{Name = training_star_power_tutorial_script}
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script menu_tutorial_select_choose_battle 
	Change \{winport_in_tutorial = 1}
	set_training_script \{Name = training_battle_tutorial_script}
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script menu_tutorial_select_choose_advanced 
	Change \{winport_in_tutorial = 1}
	set_training_script \{Name = training_advanced_techniques_tutorial_script}
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
