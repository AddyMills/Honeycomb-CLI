menu_using_guitar_controller_font = text_a4
menu_using_guitar_controller_kb = 0

script create_using_guitar_controller_menu \{keyboard = 0}
	Change menu_using_guitar_controller_kb = <keyboard>
	create_menu_backdrop \{texture = boot_usingGuitar_BG}
	createScreenElement \{Type = containerElement PARENT = root_window Id = ugc_container pos = (0.0, 0.0)}
	guitar_tex = boot_usingGuitar_gtr_LesPaul
	getplatform
	switch <Platform>
		case PS3
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS3
	endswitch
	if ($menu_using_guitar_controller_kb = 1)
		if NotIsMacPort
			guitar_tex = boot_usingKeyboard
			if German
				guitar_tex = boot_usingKeyboard_g
				elseif French
				guitar_tex = boot_usingKeyboard_f
				elseif Italian
				guitar_tex = boot_usingKeyboard_i
				elseif Spanish
				guitar_tex = boot_usingKeyboard_s
				elseif korean
				guitar_tex = boot_usingKeyboard_k
			endif
		else
			guitar_tex = boot_usingMacKeyboard
			if German
				guitar_tex = boot_usingMacKeyboard_g
				elseif French
				guitar_tex = boot_usingMacKeyboard_f
				elseif Italian
				guitar_tex = boot_usingMacKeyboard_i
				elseif Spanish
				guitar_tex = boot_usingMacKeyboard_s
			endif
		endif
	endif
	if ($menu_using_guitar_controller_kb = 1)
		displaySprite PARENT = ugc_container tex = <guitar_tex> pos = (665.0, 510.0) just = [Center Center] Z = 1 scale = (1.2, 1.2)
		displaySprite \{PARENT = ugc_container tex = boot_usingKeyboard_illo pos = (640.0, 240.0) just = [Center Center] Z = 1}
	else
		displaySprite PARENT = ugc_container tex = <guitar_tex> pos = (660.0, 530.0) just = [Center Center] Z = 1
		displaySprite \{PARENT = ugc_container tex = boot_usingGuitar_illo pos = (640.0, 270.0) just = [Center Center] Z = 1}
	endif
	displaySprite \{PARENT = ugc_container Id = bg_helper tex = White rgba = [83 95 147 255] Dims = (221.0, 40.0) just = [Center top] Z = 0.5}
	displayText \{PARENT = ugc_container Id = bg_helper_text font = text_a4 rgba = [223 223 223 255] scale = 0.5 just = [Center top] Z = 0.6 noshadow}
	if ($menu_using_guitar_controller_kb = 0)
		menu_using_guitar_controller_add_text_start
		menu_using_guitar_controller_add_text_back
		menu_using_guitar_controller_add_text_continue
		menu_using_guitar_controller_add_text_up_down
		menu_using_guitar_controller_add_text_tilt_starpower
	endif
	menu_using_guitar_controller_add_text_header
	SpawnScriptNOw \{go_through_using_guitar_text}
	SpawnScriptNOw \{check_for_any_input Params = {use_primary_controller button1 = Start button2 = X}}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	destroy_menu \{menu_id = ugc_container}
	destroy_menu_backdrop
	killspawnedScript \{Name = go_through_using_guitar_text}
	killspawnedScript \{Name = check_for_any_input}
endscript

script go_through_using_guitar_text 
	max_width = 200
	begin
	if ScreenelementExists \{Id = bg_helper}
		setScreenElementProps \{Id = bg_helper pos = (406.0, 135.0)}
	endif
	if ScreenelementExists \{Id = bg_helper_text}
		if ($menu_using_guitar_controller_kb = 1)
			setScreenElementProps \{Id = bg_helper_text pos = (407.0, 130.0) Text = "1) BOOT UP"}
		else
			setScreenElementProps \{Id = bg_helper_text pos = (407.0, 130.0) Text = "1) STRAP ON"}
		endif
		getScreenElementDims \{Id = bg_helper_text}
		setScreenElementProps \{Id = bg_helper_text scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			setScreenElementProps \{Id = bg_helper_text scale = 0.5}
		endif
	endif
	Wait \{2 Seconds}
	if ScreenelementExists \{Id = bg_helper}
		setScreenElementProps \{Id = bg_helper pos = (639.0, 135.0)}
	endif
	if ScreenelementExists \{Id = bg_helper_text}
		setScreenElementProps \{Id = bg_helper_text pos = (640.0, 130.0) Text = "2) BANG HEAD"}
		getScreenElementDims \{Id = bg_helper_text}
		setScreenElementProps \{Id = bg_helper_text scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			setScreenElementProps \{Id = bg_helper_text scale = 0.5}
		endif
	endif
	Wait \{2 Seconds}
	if ScreenelementExists \{Id = bg_helper}
		setScreenElementProps \{Id = bg_helper pos = (872.0, 135.0)}
	endif
	if ScreenelementExists \{Id = bg_helper_text}
		setScreenElementProps \{Id = bg_helper_text pos = (873.0, 130.0) Text = "3) LOSE CONTROL"}
		getScreenElementDims \{Id = bg_helper_text}
		setScreenElementProps \{Id = bg_helper_text scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle Id = bg_helper_text Dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			setScreenElementProps \{Id = bg_helper_text scale = 0.5}
		endif
	endif
	Wait \{2 Seconds}
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = "START"
	text1_pos = (785.0, 594.0)
	text2 = "button"
	text2_pos = (785.0, 627.0)
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Right top]
		scale = (0.7, 0.7)
	}
	getScreenElementDims Id = <Id>
	if (<width> > 80)
		extra_space = (<width> - 80)
		getScreenElementProps Id = <Id>
		setScreenElementProps Id = <Id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = "BACK"
	text1_pos = (459.0, 592.0)
	text2 = "Red Button"
	text2_pos = (459.0, 625.0)
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		text1 = "CONTINUE"
		text1_pos = (459.0, 592.0)
		text2 = "Red Button"
		text2_pos = (459.0, 625.0)
	endif
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Left top]
		scale = (0.7, 0.7)
	}
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [Left top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = "CONTINUE"
	text1_pos = (397.0, 592.0)
	text2 = "Green Button"
	text2_pos = (397.0, 625.0)
	GetEnterButtonAssignment
	if (<assignment> = CIRCLE)
		text1 = "BACK"
		text1_pos = (397.0, 592.0)
		text2 = "Green Button"
		text2_pos = (397.0, 625.0)
	endif
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Right top]
		scale = (0.7, 0.7)
	}
	getScreenElementDims Id = <Id>
	if (<width> > 125)
		extra_space = (<width> - 125)
		getScreenElementProps Id = <Id>
		setScreenElementProps Id = <Id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [Right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = "UP/DOWN"
	text1_pos = (565.0, 409.0)
	text2 = "Strum Bar"
	text2_pos = (565.0, 442.0)
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center top]
		scale = (0.7, 0.7)
	}
	getScreenElementDims Id = <Id>
	if (<width> > 180)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center top]
		scale = 0.6
	}
	getScreenElementDims Id = <Id>
	if (<width> > 180)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = "TILT UP"
	text1_pos = (290.0, 390.0)
	text2 = "for Star Power"
	text2_pos = (290.0, 423.0)
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Left top]
		scale = (0.7, 0.7)
	}
	getScreenElementDims Id = <Id>
	if (<width> > 180)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Left top]
		scale = 0.6
	}
	getScreenElementDims Id = <Id>
	if (<width> > 180)
		setScreenElementProps Id = <Id> scale = 1
		fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	createScreenElement \{Type = spriteElement PARENT = ugc_container texture = boot_usingGuitar_arrow pos = (275.0, 480.0) just = [Right Center]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = "IN THE EVENT OF ROCK"
	text1_pos = (660.0, 55.0)
	if ($menu_using_guitar_controller_kb = 1)
		text2 = "USING THE KEYBOARD AND MOUSE"
	else
		text2 = "USING THE GUITAR CONTROLLER"
	endif
	text2_pos = (660.0, 95.0)
	createScreenElement {
		Type = textElement
		Text = <text1>
		pos = <text1_pos>
		PARENT = ugc_container
		rgba = [100 110 145 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center top]
		scale = (1.4, 1.0)
	}
	createScreenElement {
		Type = textElement
		Text = <text2>
		pos = <text2_pos>
		PARENT = ugc_container
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [Center top]
		scale = (0.9, 0.7)
	}
endscript
