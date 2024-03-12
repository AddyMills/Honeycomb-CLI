
script create_gamma_brightness_menu \{Popup = 0}
	header_font = text_A5
	menu_font = fontgrid_title_gh3
	Menu_pos = (0.0, 340.0)
	Z = 100.0
	createScreenElement \{Type = containerElement PARENT = root_window Id = gamma_warning_container pos = (0.0, 0.0)}
	event_handlers = [
		{pad_up gamma_brightness_menu_change Params = {Up}}
		{pad_down gamma_brightness_menu_change Params = {Down}}
		{pad_back menu_flow_go_back}
	]
	new_menu scrollid = scrolling_gamma_warning vmenuid = vmenu_gamma_warning Menu_pos = <Menu_pos> event_handlers = <event_handlers>
	if (<Popup> = 1)
		create_pause_menu_frame Z = (<Z> - 10)
	else
		createScreenElement \{Type = spriteElement PARENT = gamma_warning_container pos = (640.0, 360.0) just = [Center Center] rgba = [50 50 50 255] Dims = (1280.0, 720.0)}
		add_user_control_helper \{Text = "BACK" button = Red Z = 100}
		add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	endif
	setScreenElementProps \{Id = vmenu_gamma_warning Dims = (1280.0, 720.0) internal_just = [Center top]}
	createScreenElement {
		Type = textElement
		PARENT = gamma_warning_container
		Text = "BRIGHTNESS"
		font = <header_font>
		scale = 1.5
		pos = (640.0, 280.0)
		just = [Center Center]
		rgba = ($menu_unfocus_color)
		z_priority = <Z>
	}
	formatText Textname = brightness_text "Brightness: %d" D = ($SE_Brightness)
	createScreenElement {
		Type = textElement
		PARENT = vmenu_gamma_warning
		Text = <brightness_text>
		Id = gamma_brightness_text
		font = <menu_font>
		scale = (1.25)
		z_priority = <Z>
		rgba = [223 223 223 255]
		event_handlers = [
			{focus retail_menu_focus}
		]
	}
endscript

script destroy_gamma_brightness_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_gamma_warning}
	destroy_menu \{menu_id = gamma_warning_container}
	destroy_pause_menu_frame
endscript

script gamma_brightness_menu_change 
	Printf \{"gamma_brightness_menu_change"}
	if gotParam \{Up}
		Change SE_Brightness = ($SE_Brightness + 1)
		if ($SE_Brightness > 10)
			Change \{SE_Brightness = 10}
		endif
		elseif gotParam \{Down}
		Change SE_Brightness = ($SE_Brightness - 1)
		if ($SE_Brightness < 0)
			Change \{SE_Brightness = 0}
		endif
	endif
	setGlobalTags \{user_options Params = {gamma_brightness = $SE_Brightness}}
	if ViewportExists \{Id = Bg_Viewport}
		TOD_Proxim_Update_Global_Brightness \{viewport = Bg_Viewport}
	endif
	if ScreenelementExists \{Id = gamma_brightness_text}
		formatText Textname = brightness_text "Brightness: %d" D = ($SE_Brightness)
		Printf <brightness_text>
		setScreenElementProps Id = gamma_brightness_text Text = <brightness_text>
	endif
endscript
