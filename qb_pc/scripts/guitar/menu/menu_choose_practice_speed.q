menu_choose_practice_destroy_previous_menu = 1
menu_choose_practice_speed_font = text_a3

script create_choose_practice_speed_menu 
	disable_pause
	if ScreenElementExists \{id = cps_menu}
		LaunchEvent \{type = unfocus target = cps_menu}
	endif
	if ScreenElementExists \{id = newspaper_vmenu}
		LaunchEvent \{type = unfocus target = newspaper_vmenu}
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back practice_speed_go_back}
	]
	new_menu scrollid = cps_scroll vmenuid = cps_vmenu menu_pos = (640.0, 280.0) spacing = -70 event_handlers = <event_handlers>
	change \{menu_unfocus_color = [250 245 195 255]}
	change \{menu_focus_color = [250 245 195 255]}
	text_params = {
		parent = cps_vmenu
		type = TextElement
		font = ($menu_choose_practice_speed_font)
		rgba = ($menu_unfocus_color)
		z_priority = 700
		Scale = 1.2
		just = [center center]
	}
	menu_z = 500
	CreateScreenElement \{type = ContainerElement id = cps_speed_container parent = root_window Pos = (0.0, 0.0)}
	displaySprite \{parent = cps_speed_container Pos = (640.0, 360.0) just = [RIGHT bottom] tex = practice_speed_bg dims = (320.0, 320.0) z = 600 flip_v}
	displaySprite \{parent = cps_speed_container Pos = (640.0, 360.0) just = [left bottom] tex = practice_speed_bg dims = (320.0, 320.0) z = 600}
	displaySprite \{parent = cps_speed_container Pos = (640.0, 360.0) just = [left top] tex = practice_speed_bg dims = (320.0, 320.0) z = 600 flip_h}
	CreateScreenElement \{type = SpriteElement parent = cps_speed_container Pos = (640.0, 360.0) just = [RIGHT top] texture = practice_speed_bg dims = (320.0, 320.0) z_priority = 600 flip_v flip_h}
	displaySprite \{parent = cps_speed_container id = cps_hilite tex = white z = 550 rgba = [215 120 40 255] just = [center center] z = 699}
	displaySprite \{parent = cps_speed_container id = cps_hilite_be1 tex = character_hub_hilite_bookend z = 550 rgba = [215 120 40 255] just = [RIGHT center] z = 699}
	displaySprite \{parent = cps_speed_container id = cps_hilite_be2 tex = character_hub_hilite_bookend z = 550 rgba = [215 120 40 255] just = [left center] z = 699}
	CreateScreenElement \{type = SpriteElement parent = cps_speed_container texture = gradient_128 rgba = [0 0 0 180] Pos = (0.0, 0.0) dims = (1280.0, 720.0) just = [left top] z_priority = 500}
	CreateScreenElement \{type = TextElement parent = cps_speed_container text = "Select Speed" font = text_a10 rgba = [215 120 40 255] Scale = 1.5 Pos = (640.0, 240.0) just = [center center] z_priority = 700}
	CreateScreenElement {
		<text_params>
		type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_fullspeed Pos = (640.0, 337.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_fullspeed}}
			{pad_choose menu_choose_practice_speed_set_speed params = {Speed = full}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_fullspeed
		text = "Full Speed"
	}
	CreateScreenElement {
		<text_params>
		type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slow Pos = (640.0, 385.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slow}}
			{pad_choose menu_choose_practice_speed_set_speed params = {Speed = slow}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slow
		text = "Slow"
	}
	CreateScreenElement {
		<text_params>
		type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slower Pos = (640.0, 434.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slower}}
			{pad_choose menu_choose_practice_speed_set_speed params = {Speed = slower}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slower
		text = "Slower"
	}
	CreateScreenElement {
		<text_params>
		type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slowest Pos = (640.0, 484.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slowest}}
			{pad_choose menu_choose_practice_speed_set_speed params = {Speed = slowest}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slowest
		text = "Slowest"
	}
	change \{menu_choose_practice_destroy_previous_menu = 0}
endscript

script destroy_choose_practice_speed_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		change \{menu_choose_practice_destroy_previous_menu = 1}
	endif
	destroy_choose_practice_section_menu
	destroy_newspaper_menu
	destroy_menu \{menu_id = cps_speed_container}
	destroy_menu \{menu_id = cps_scroll}
endscript

script practice_speed_go_back 
	change \{menu_choose_practice_destroy_previous_menu = 0}
	menu_flow_go_back
endscript

script practice_choose_speed_hilite 
	GetScreenElementDims id = <id>
	new_dims = (<width> * (1.25, 0.0) + (0.0, 45.0))
	SetScreenElementProps id = cps_hilite Pos = <Pos> dims = <new_dims>
	SetScreenElementProps id = cps_hilite_be1 Pos = (<Pos> - (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) + (12.0, 0.0))
	SetScreenElementProps id = cps_hilite_be2 Pos = (<Pos> + (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) - (4.0, 0.0))
endscript

script menu_choose_practice_speed_set_speed \{Speed = full}
	switch <Speed>
		case full
		change \{current_speedfactor = 1.0}
		change \{structurename = PitchShiftSlow1 pitch = 1.0}
		case slow
		change \{current_speedfactor = 0.8}
		change \{structurename = PitchShiftSlow1 pitch = 1.25}
		case slower
		change \{current_speedfactor = 0.66666675}
		change \{structurename = PitchShiftSlow1 pitch = 1.5}
		case slowest
		change \{current_speedfactor = 0.5}
		change \{structurename = PitchShiftSlow1 pitch = 2.0}
	endswitch
	change \{menu_choose_practice_destroy_previous_menu = 1}
	ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
endscript
