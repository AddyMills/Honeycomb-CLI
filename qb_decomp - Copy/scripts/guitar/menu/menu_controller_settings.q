
script winport_wait_for_device_press 
	begin
	begin
	if NOT WinPortSioGetDevicePress
		break
	endif
	Wait \{1 GameFrame}
	repeat
	begin
	if WinPortSioGetDevicePress
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if (<deviceNum> = -2)
		if gotParam \{backScript}
			<backScript>
			break
		endif
	else
		if gotParam \{bindable}
			if ((WinPortSioIsDirectInputGamepad deviceNum = <deviceNum>) || (WinPortSioIsKeyboard deviceNum = <deviceNum>))
				if gotParam \{proceedScript}
					<proceedScript> deviceNum = <deviceNum>
				endif
				break
			endif
		else
			if gotParam \{proceedScript}
				<proceedScript> deviceNum = <deviceNum>
			endif
			break
		endif
	endif
	repeat
	return deviceNum = <deviceNum>
endscript

script winport_select_p1_controller 
	ui_flow_manager_respond_to_action \{action = winport_select_p1_controller}
endscript

script winport_create_p1_controller_popup 
	create_popup_warning_menu \{title = "Select Controller" textblock = {Text = "Press any button on the controller to be used in single player mode and in the menus." Dims = (800.0, 400.0) scale = 0.55} no_background Menu_pos = (640.0, 520.0) dialog_dims = (600.0, 80.0)}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	SpawnScriptNOw \{winport_wait_for_device_press Params = {backScript = winport_p1_controller_back proceedScript = winport_p1_controller_proceed}}
endscript

script winport_destroy_p1_controller_popup 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
endscript

script winport_p1_controller_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script winport_p1_controller_proceed 
	WinPortSioSetDevice0 deviceNum = <deviceNum>
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script winport_select_bind_buttons 
	deviceNum = 0
	begin
	if WinPortSioIsKeyboard deviceNum = <deviceNum>
		Change winport_bb_device_num = <deviceNum>
		break
	endif
	deviceNum = (<deviceNum> + 1)
	repeat 4
	ui_flow_manager_respond_to_action \{action = winport_select_bind_buttons}
endscript

script winport_create_bind_buttons_popup 
	create_popup_warning_menu \{title = "Select Controller" textblock = {Text = "Press any button on the controller you want to configure." Dims = (800.0, 400.0) scale = 0.55} no_background Menu_pos = (640.0, 520.0) dialog_dims = (600.0, 80.0)}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	SpawnScriptNOw \{winport_wait_for_device_press Params = {bindable backScript = winport_bind_buttons_back proceedScript = winport_bind_buttons_proceed}}
endscript

script winport_destroy_bind_buttons_popup 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
endscript

script winport_bind_buttons_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script winport_bind_buttons_proceed 
	if ((WinPortSioIsDirectInputGamepad deviceNum = <deviceNum>) || (WinPortSioIsKeyboard deviceNum = <deviceNum>))
		Change winport_bb_device_num = <deviceNum>
		ui_flow_manager_respond_to_action \{action = proceed}
	else
		SpawnScriptNOw \{winport_wait_for_device_press Params = {backScript = winport_bind_buttons_back proceedScript = winport_bind_buttons_proceed}}
	endif
endscript
cs_highlighter_positions = [
	(620.0, 178.0)
	(621.0, 212.0)
	(622.0, 246.0)
	(623.0, 279.0)
	(624.0, 313.0)
]
cs_is_popup = 0
cs_menu_font = fontgrid_title_gh3

script create_controller_settings_menu \{Popup = 0}
	if isWinPort
		if (<Popup> = 1)
			kill_start_key_binding
		endif
	else
		kill_start_key_binding
	endif
	if NOT (<Popup>)
		Menu_pos = (638.0, 173.0)
	else
		Menu_pos = (465.0, 310.0)
	endif
	createScreenElement \{Type = containerElement PARENT = root_window Id = cs_container pos = (0.0, 0.0) just = [Left top]}
	if (<Popup>)
		Z = 100
		Change \{cs_is_popup = 1}
		new_menu scrollid = cs_scroll vmenuid = cs_vmenu Menu_pos = <Menu_pos> Spacing = -10 exclusive_device = ($last_start_pressed_device)
		createScreenElement {
			Type = textElement
			font = ($cs_menu_font)
			PARENT = cs_scroll
			pos = (180.0, -30.0)
			scale = 1.3
			Text = "CONTROLLER SETTINGS"
			rgba = ($menu_unfocus_color)
			z_priority = <Z>
		}
		create_pause_menu_frame x_scale = 1.3 Z = (<Z> - 10)
		text_params = {PARENT = cs_vmenu Type = textElement font = ($cs_menu_font) rgba = ($menu_unfocus_color) z_priority = <Z> scale = (0.9, 0.8)}
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		createScreenElement {
			Type = spriteElement
			PARENT = cs_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [Center Center]
			z_priority = (<Z> + 100)
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			Text = "PAUSED"
			font = text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
	else
		Change \{cs_is_popup = 0}
		new_menu scrollid = cs_scroll vmenuid = cs_vmenu Menu_pos = <Menu_pos> text_left
		set_focus_color \{rgba = [190 185 165 255]}
		set_unfocus_color \{rgba = [60 45 30 255]}
		create_menu_backdrop \{texture = Venue_BG}
		createScreenElement \{Type = spriteElement PARENT = cs_container Id = cs_light_overlay texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 99}
		displaySprite \{PARENT = cs_container tex = Options_Controller_Poster pos = (135.0, 30.0) Dims = (640.0, 620.0) Rot_Angle = -1.5 Z = 5}
		displaySprite \{PARENT = cs_container tex = Options_Controller_Poster2 pos = (525.0, 130.0) Dims = (552.0, 266.0)}
		displaySprite \{PARENT = cs_container tex = tape_H_03 pos = (610.0, 0.0) Dims = (120.0, 60.0) Z = 6 Rot_Angle = 60}
		displaySprite \{PARENT = cs_container tex = tape_H_03 rgba = [0 0 0 128] pos = (608.0, 5.0) Dims = (120.0, 60.0) Z = 6 Rot_Angle = 60}
		displaySprite \{PARENT = cs_container tex = tape_H_04 pos = (760.0, 106.0) Dims = (140.0, 65.0) Z = 4}
		displaySprite \{PARENT = cs_container tex = tape_H_04 rgba = [0 0 0 128] pos = (763.0, 111.0) Dims = (140.0, 65.0) Z = 4}
		displaySprite \{PARENT = cs_container tex = Tape_V_01 pos = (250.0, 360.0) Dims = (80.0, 142.0) Z = 6 flip_v Rot_Angle = -10}
		displaySprite \{PARENT = cs_container tex = Tape_V_01 rgba = [0 0 0 128] pos = (255.0, 363.0) Dims = (80.0, 142.0) Z = 6 flip_v Rot_Angle = -10}
		displaySprite \{PARENT = cs_container tex = Tape_H_02 pos = (1090.0, 300.0) Dims = (112.0, 54.0) Z = 4 Rot_Angle = -80}
		displaySprite \{PARENT = cs_container tex = Tape_H_02 rgba = [0 0 0 128] pos = (1095.0, 305.0) Dims = (112.0, 54.0) Z = 4 Rot_Angle = -80}
		createScreenElement {
			Type = textElement
			Id = cs_controller_text
			PARENT = cs_container
			pos = (465.0, 571.0)
			scale = (0.65000004, 0.8)
			Text = "Controller"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			Rot_Angle = -1.5
		}
		createScreenElement {
			Type = textElement
			Id = cs_options_text
			PARENT = cs_container
			pos = (460.0, 293.0)
			scale = (0.5, 0.4)
			Text = "Options"
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = 6
			Rot_Angle = -16
		}
		displaySprite \{PARENT = cs_container tex = Options_Controller_CheckBG pos = (945.0, 190.0) Z = 4 flip_h Rot_Angle = -5 scale = 0.7}
		displaySprite \{PARENT = cs_container Id = cs_check_1 tex = options_controller_X pos = (975.0, 197.0) Z = 6 scale = 0.7}
		displaySprite \{PARENT = cs_container tex = Options_Controller_CheckBG pos = (950.0, 236.0) Z = 5 Rot_Angle = -5 scale = 0.7}
		displaySprite \{PARENT = cs_container Id = cs_check_2 tex = options_controller_X pos = (970.0, 230.0) Z = 6 scale = 0.7}
		displaySprite {
			PARENT = cs_container
			Id = cs_highlighter
			tex = Options_Controller_Highlight
			pos = ($cs_highlighter_positions [0])
			Dims = (460.0, 58.0)
			Z = 4
			Rot_Angle = 1
		}
		font = text_a6
		Z = 5
		text_params = {PARENT = cs_vmenu Type = textElement font = <font> scale = 0.7 rgba = ($menu_unfocus_color) z_priority = <Z> Rot_Angle = 1.5}
		<exclusive_params> = {exclusive_device = ($primary_controller)}
		Change \{user_control_pill_text_color = [0 0 0 255]}
		Change \{user_control_pill_color = [180 180 180 255]}
		add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
		add_user_control_helper \{Text = "BACK" button = Red Z = 100}
		add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	endif
	if (<Popup>)
		<p1_l_flip_text> = "P1 Lefty Flip: OFF"
		<p2_l_flip_text> = "P2 Lefty Flip: OFF"
	else
		<p1_l_flip_text> = "P1 Lefty Flip:"
		<p2_l_flip_text> = "P2 Lefty Flip:"
	endif
	createScreenElement {
		<text_params>
		Text = <p1_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p1 Params = {Popup = <Popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter Params = {Index = 0}}
			{unfocus retail_menu_unfocus}
		]
		Id = lefty_flip_p1_se
		<exclusive_params>
	}
	if NOT (<Popup>)
		getScreenElementDims Id = <Id>
		if (<width> > 300)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	createScreenElement {
		<text_params>
		Text = <p2_l_flip_text>
		event_handlers = [
			{pad_choose controller_settings_menu_choose_lefty_flip_p2 Params = {Popup = <Popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter Params = {Index = 1}}
			{unfocus retail_menu_unfocus}
		]
		Id = lefty_flip_p2_se
		<exclusive_params>
	}
	if NOT (<Popup>)
		getScreenElementDims Id = <Id>
		if (<width> > 300)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	getglobaltags \{user_options}
	controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	createScreenElement {
		Id = cs_calibrate_whammy_menu_item
		<text_params>
		Text = "Calibrate Whammy"
		event_handlers = [
			{pad_choose controller_settings_menu_choose_whammy_bar Params = {Popup = <Popup>}}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter Params = {Index = 2}}
			{unfocus retail_menu_unfocus}
		]
		<exclusive_params>
	}
	if NOT (<Popup>)
		getScreenElementDims Id = <Id>
		if (<width> > 300)
			setScreenElementProps Id = <Id> scale = 1
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
		endif
	endif
	createScreenElement {
		Id = cs_bind_buttons_menu_item
		<text_params>
		Text = "Configure Keyboard"
		event_handlers = [
			{pad_choose winport_select_bind_buttons}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter Params = {Index = 3}}
			{unfocus retail_menu_unfocus}
		]
		<exclusive_params>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 300)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Id = cs_show_default_keyboard_layout_menu_item
		<text_params>
		Text = "View Defaults"
		event_handlers = [
			{pad_choose controller_settings_show_default_keyboard_layout}
			{focus retail_menu_focus}
			{focus controller_settings_menu_highlighter Params = {Index = 4}}
			{unfocus retail_menu_unfocus}
		]
		<exclusive_params>
	}
	getScreenElementDims Id = <Id>
	if (<width> > 300)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((300.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	if NOT isguitarcontroller controller = ($primary_controller)
		setScreenElementProps \{Id = cs_calibrate_whammy_menu_item rgba = [128 128 128 255] NOT_FOCUSABLE}
	endif
	if WinPortSioIsKeyboard deviceNum = ($primary_controller)
		setScreenElementProps \{Id = cs_calibrate_whammy_menu_item rgba = [128 128 128 255] NOT_FOCUSABLE}
	endif
endscript

script controller_settings_menu_highlighter \{Index = 0}
	if NOT ($cs_is_popup)
		setScreenElementProps Id = cs_highlighter pos = ($cs_highlighter_positions [<Index>])
	endif
endscript

script destroy_controller_settings_menu 
	if isWinPort
		if ($cs_is_popup = 1)
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
	destroy_pause_menu_frame
	destroy_menu \{menu_id = cs_container}
	destroy_menu \{menu_id = cs_scroll}
	clean_up_user_control_helpers
endscript

script controller_settings_menu_update_lefty_flip_p1_value \{lefty_flip_p1 = 0}
	if (<lefty_flip_p1>)
		if NOT ($cs_is_popup)
			setScreenElementProps \{Id = cs_check_1 texture = options_controller_check}
			Change \{pad_event_up_inversion = TRUE}
		else
			setScreenElementProps \{Id = lefty_flip_p1_se Text = "P1 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			setScreenElementProps \{Id = cs_check_1 texture = options_controller_X}
			Change \{pad_event_up_inversion = FALSE}
		else
			setScreenElementProps \{Id = lefty_flip_p1_se Text = "P1 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_update_lefty_flip_p2_value \{lefty_flip_p2 = 0}
	if (<lefty_flip_p2>)
		if NOT ($cs_is_popup)
			setScreenElementProps \{Id = cs_check_2 texture = options_controller_check}
		else
			setScreenElementProps \{Id = lefty_flip_p2_se Text = "P2 Lefty Flip: ON"}
		endif
	else
		if NOT ($cs_is_popup)
			setScreenElementProps \{Id = cs_check_2 texture = options_controller_X}
		else
			setScreenElementProps \{Id = lefty_flip_p2_se Text = "P2 Lefty Flip: OFF"}
		endif
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p1 
	if (<Popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip create_params = {Player = 1}}
	else
		getglobaltags \{user_options}
		if (<lefty_flip_p1> = 1)
			<lefty_flip_p1> = 0
			Soundevent \{Event = CheckBox_SFX}
		else
			<lefty_flip_p1> = 1
			Soundevent \{Event = CheckBox_Check_SFX}
		endif
		setGlobalTags user_options Params = {lefty_flip_p1 = <lefty_flip_p1>}
		controller_settings_menu_update_lefty_flip_p1_value lefty_flip_p1 = <lefty_flip_p1>
	endif
endscript

script controller_settings_menu_choose_lefty_flip_p2 
	if (<Popup>)
		ui_flow_manager_respond_to_action \{action = select_lefty_flip create_params = {Player = 2}}
	else
		getglobaltags \{user_options}
		if (<lefty_flip_p2> = 1)
			<lefty_flip_p2> = 0
			Soundevent \{Event = CheckBox_SFX}
		else
			<lefty_flip_p2> = 1
			Soundevent \{Event = CheckBox_Check_SFX}
		endif
		setGlobalTags user_options Params = {lefty_flip_p2 = <lefty_flip_p2>}
		controller_settings_menu_update_lefty_flip_p2_value lefty_flip_p2 = <lefty_flip_p2>
	endif
endscript

script controller_settings_menu_choose_star_power 
	ui_flow_manager_respond_to_action action = select_calibrate_star_power_trigger create_params = {controller = <device_num> Popup = <Popup>}
endscript

script controller_settings_menu_choose_whammy_bar 
	ui_flow_manager_respond_to_action action = select_calibrate_whammy_bar create_params = {controller = <device_num> Popup = <Popup>}
endscript

script controller_settings_show_default_keyboard_layout 
	ui_flow_manager_respond_to_action \{action = show_default_keyboard_layout create_params = {keyboard = 1}}
endscript
