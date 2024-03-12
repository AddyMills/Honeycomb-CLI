
script find_unlocked_guitar_info_by_id 
	getArraySize ($Secret_Guitars)
	I = 0
	begin
	if (<Id> = ($Secret_Guitars [<I>].Id))
		return icon_texture = ($Secret_Guitars [<I>].icon_texture)
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	getArraySize ($Secret_Basses)
	I = 0
	begin
	if (<Id> = ($Secret_Basses [<I>].Id))
		return icon_texture = ($Secret_Basses [<I>].icon_texture)
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script create_unlock_menu 
	createScreenElement \{Type = containerElement PARENT = root_window Id = unlock_container pos = (0.0, 0.0)}
	find_unlocked_guitar_info_by_id Id = ($progression_unlocked_guitar)
	get_instrument_name_and_index Id = ($progression_unlocked_guitar)
	Change progression_unlocked_guitar = ($progression_unlocked_guitar2)
	Change \{progression_unlocked_guitar2 = -1}
	unlock_item_tex = <icon_texture>
	GetUppercaseString <instrument_name>
	unlock_item_name = <UppercaseString>
	unlock_font = text_a4
	padlock_pos_start = (850.0, 430.0)
	padlock_pos_end = (850.0, 412.0)
	create_menu_backdrop \{texture = unlock_bg}
	createScreenElement \{Type = spriteElement Id = unlock_velvet_backdrop PARENT = unlock_container texture = Unlock_Velvet rgba = [255 255 255 255] pos = (640.0, 320.0) Dims = (865.0, 420.0) just = [Center Center] z_priority = -0.1}
	createScreenElement {
		Type = spriteElement
		Id = unlock_item
		PARENT = unlock_container
		texture = <unlock_item_tex>
		rgba = [255 255 255 255]
		pos = (640.0, 330.0)
		Dims = (650.0, 325.0)
		just = [Center Center]
	}
	runScriptOnScreenElement \{Id = unlock_item unlock_guitar_hover}
	createScreenElement \{Type = spriteElement Id = unlock_dialog_backdrop PARENT = unlock_container texture = Unlock_Dialog_BG rgba = [255 255 255 255] pos = (850.0, 550.0) just = [Center Center]}
	createScreenElement {
		Type = spriteElement
		Id = unlock_dialog_padlock
		PARENT = unlock_container
		texture = Unlock_Padlock
		rgba = [255 255 255 255]
		pos = <padlock_pos_start>
		just = [Center Center]
	}
	createScreenElement {
		Type = textElement
		Id = unlock_text_congrats
		PARENT = unlock_container
		scale = (1.0, 1.0)
		Text = "CONGRATULATIONS!"
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [Left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{Id = unlock_text_congrats Dims = (350.0, 32.0) pos = (680.0, 483.0)}
	createScreenElement {
		Type = textElement
		Id = unlock_text_buyitinthestore
		PARENT = unlock_container
		scale = (1.0, 1.0)
		Text = "BUY IT IN THE STORE"
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [Left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{Id = unlock_text_buyitinthestore Dims = (350.0, 32.0) pos = (680.0, 555.0)}
	createScreenElement {
		Type = textElement
		Id = unlock_text_name
		PARENT = unlock_container
		scale = (1.0, 1.0)
		Text = <unlock_item_name>
		pos = (850.0, 505.0)
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 32 32 255]
		just = [Center top]
		z_priority = 3
	}
	fit_text_in_rectangle \{Id = unlock_text_name only_if_larger_x = 1 Dims = (345.0, 64.0) pos = (850.0, 497.0)}
	createScreenElement {
		Type = textElement
		PARENT = unlock_container
		Id = continue_button
		scale = 0.8
		pos = (400.0, 590.0)
		font = <unlock_font>
		rgba = [223 223 223 255]
		just = [Left top]
		z_priority = 3
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
	Wait \{2 Seconds}
	DoScreenElementMorph Id = unlock_dialog_padlock pos = <padlock_pos_end> Time = 0.1 Motion = ease_in
	createScreenElement {
		Type = spriteElement
		Id = unlock_dialog_starburst
		PARENT = unlock_container
		texture = Unlock_Starburst
		rgba = [255 255 255 255]
		pos = <padlock_pos_end>
		just = [Center Center]
		z_priority = 3.1
		scale = 0.1
		Alpha = 1
	}
	rot = 180
	scale = 5
	Alpha = 0.0
	DoScreenElementMorph Id = unlock_dialog_starburst Rot_Angle = <rot> scale = <scale> Alpha = <Alpha> pos = <padlock_pos_end> Time = 0.7 Motion = ease_out
	launchevent \{Type = focus Target = continue_button}
	createScreenElement \{Type = spriteElement Id = unlock_twinkle_1 PARENT = unlock_container texture = Unlock_Starburst rgba = [255 255 255 255] pos = (350.0, 350.0) just = [Center Center] z_priority = 0 scale = 0.5 Alpha = 0}
	runScriptOnScreenElement \{Id = unlock_twinkle_1 unlock_twinkle_anim}
	add_user_control_helper \{Text = "CONTINUE" button = Green Z = 10000}
endscript

script unlock_guitar_hover 
	if NOT ScreenelementExists \{Id = unlock_item}
		return
	endif
	begin
	unlock_item :doMorph \{pos = {(0.0, -5.0) Relative} Rot_Angle = 0 Motion = ease_out Time = 1}
	unlock_item :doMorph \{pos = {(0.0, 5.0) Relative} Rot_Angle = 1 Motion = ease_in Time = 1}
	unlock_item :doMorph \{pos = {(0.0, -5.0) Relative} Rot_Angle = 2 Motion = ease_out Time = 1}
	unlock_item :doMorph \{pos = {(0.0, 5.0) Relative} Rot_Angle = 1 Motion = ease_in Time = 1}
	repeat
endscript

script unlock_twinkle_anim 
	if NOT ScreenelementExists \{Id = unlock_twinkle_1}
		return
	endif
	twinkle_time = 0.3
	Printf \{"twinkling!"}
	begin
	unlock_twinkle_1 :doMorph \{pos = (350.0, 400.0) scale = 0 Alpha = 0.5 Rot_Angle = 0}
	unlock_twinkle_1 :doMorph Rot_Angle = -180 scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
	unlock_twinkle_1 :doMorph \{pos = (600.0, 200.0) scale = 0 Alpha = 0.5 Rot_Angle = 0}
	unlock_twinkle_1 :doMorph Rot_Angle = -180 scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
	unlock_twinkle_1 :doMorph \{pos = (900.0, 250.0) scale = 0 Alpha = 0.5 Rot_Angle = 0}
	unlock_twinkle_1 :doMorph Rot_Angle = -180 scale = 1 Alpha = 0 Motion = ease_out Time = <twinkle_time>
	Wait \{3 Seconds}
	repeat
endscript

script destroy_unlock_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = unlock_container}
	destroy_menu_backdrop
endscript
