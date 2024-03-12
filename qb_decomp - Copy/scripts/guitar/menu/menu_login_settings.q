login_settings_menu_font = text_a10

script create_login_settings_menu 
	create_menu_backdrop \{texture = Venue_BG}
	createScreenElement \{Type = containerElement PARENT = root_window Id = login_settings_container}
	rot = -3
	displaySprite PARENT = login_settings_container tex = data_settings_poster pos = (640.0, 360.0) Dims = (384.0, 768.0) just = [Center Center] Rot_Angle = <rot>
	Change \{menu_unfocus_color = [60 60 30 255]}
	Change \{menu_focus_color = [235 240 200 255]}
	text_params = {
		Type = textElement
		font = $login_settings_menu_font
		rgba = $menu_unfocus_color
		Rot_Angle = <rot>
		z_priority = 5
	}
	new_menu \{scrollid = cds_scroll vmenuid = cds_vmenu Menu_pos = (830.0, 105.0) Spacing = -10 default_colors = 0 just = [Center top]}
	createScreenElement \{Type = containerElement PARENT = cds_vmenu Dims = (200.0, 52.0) event_handlers = [{focus menu_login_settings_on_focus}{unfocus menu_login_settings_on_unfocus}{pad_choose menu_login_settings_on_select}]}
	createScreenElement {
		<text_params>
		PARENT = <Id>
		Text = "AUTO LOGIN ON"
		Id = login_on_id
		Rot_Angle = -3
	}
	createScreenElement \{Type = containerElement PARENT = cds_vmenu Dims = (200.0, 52.0) event_handlers = [{focus menu_login_settings_off_focus}{unfocus menu_login_settings_off_unfocus}{pad_choose menu_login_settings_off_select}]}
	createScreenElement {
		<text_params>
		PARENT = <Id>
		Text = "AUTO LOGIN OFF"
		Id = login_off_id
		Rot_Angle = -1
		Shadow
		shadow_rgba = [175 175 150 255]
		shadow_offs = (5.0, 5.0)
	}
	createScreenElement \{Type = containerElement PARENT = cds_vmenu Dims = (200.0, 52.0) event_handlers = [{focus menu_login_settings_prompt_focus}{unfocus menu_login_settings_prompt_unfocus}{pad_choose menu_login_settings_prompt_select}]}
	createScreenElement {
		<text_params>
		PARENT = <Id>
		Text = "ALWAYS PROMPT"
		Id = login_prompt_id
		Shadow
		shadow_rgba = [175 175 150 255]
		shadow_offs = (5.0, 5.0)
	}
	SetScreenElementLock \{Id = login_prompt_id OFF}
	SetScreenElementLock \{Id = login_prompt_id On}
	getScreenElementDims \{Id = login_prompt_id}
	fit_text_in_rectangle Id = login_prompt_id Dims = ((140.0, 0.0) + (0.0, 1.0) * <Height>) only_if_larger_x = 1
	<checkmark_tex> = data_settings_checkmark
	createScreenElement {
		Type = spriteElement
		PARENT = login_settings_container
		Id = login_checkmark_id
		pos = ($login_settings_hilite_pos.loginPrompt + (100.0, -10.0))
		just = [Center Center]
		texture = <checkmark_tex>
		z_priority = 5
		Rot_Angle = <rot>
	}
	createScreenElement {
		Type = spriteElement
		PARENT = login_settings_container
		pos = ($login_settings_hilite_pos.loginOn)
		Id = ds_hilite
		just = [Center Center]
		texture = data_settings_hilite
		z_priority = 4
		rgba = [180 55 25 255]
		Rot_Angle = <rot>
	}
	createScreenElement {
		Type = textElement
		PARENT = login_settings_container
		Text = "AUTO LOGIN SETTING"
		font = text_a10
		pos = (650.0, 600.0)
		just = [Center Center]
		z_priority = 5
		rgba = [223 223 223 255]
		Rot_Angle = <rot>
	}
	getScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((240.0, 0.0) + (0.0, 1.0) * <Height>) pos = (650.0, 600.0) only_if_larger_x = 1
	createScreenElement \{Type = spriteElement PARENT = login_settings_container texture = Tape_H_02 pos = (480.0, 90.0) z_priority = 20 Dims = (128.0, 64.0) flip_h flip_v}
	createScreenElement {
		Type = spriteElement
		PARENT = <Id>
		texture = Tape_H_02
		pos = (10.0, 10.0)
		rgba = [0 0 0 128]
		just = [Left top]
		z_priority = 19
	}
	createScreenElement \{Type = spriteElement PARENT = login_settings_container texture = Tape_H_02 pos = (800.0, 630.0) z_priority = 20 Dims = (128.0, 64.0) Rot_Angle = -25}
	createScreenElement {
		Type = spriteElement
		PARENT = <Id>
		texture = Tape_H_02
		pos = (10.0, 10.0)
		rgba = [0 0 0 128]
		just = [Left top]
		z_priority = 19
	}
	createScreenElement \{Type = spriteElement PARENT = login_settings_container texture = tape_V_02 pos = (820.0, 260.0) z_priority = 20 Dims = (64.0, 128.0) Rot_Angle = -25 flip_v}
	createScreenElement {
		Type = spriteElement
		PARENT = <Id>
		texture = tape_V_02
		pos = (-20.0, 20.0)
		rgba = [0 0 0 128]
		just = [Left top]
		z_priority = 19
	}
	createScreenElement \{Type = spriteElement PARENT = login_settings_container texture = Venue_Overlay pos = (640.0, 360.0) just = [Center Center] Dims = (1280.0, 720.0) z_priority = 99 rgba = [255 255 255 255]}
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	NetSessionfunc \{func = GetAutoLoginSetting}
	switch <autoLoginSetting>
		case autoLoginOff
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginOff + (135.0, -10.0)) Time = 0
		case autoLoginOn
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginOn + (135.0, -10.0)) Time = 0
		case autoLoginUnknown
		case autoLoginPrompt
		menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginPrompt + (135.0, -10.0)) Time = 0
	endswitch
endscript

script destroy_login_settings_menu \{Destroy = 1}
	if (<Destroy>)
		clean_up_user_control_helpers
		destroy_menu \{menu_id = login_settings_container}
		destroy_menu \{menu_id = cds_scroll}
	endif
endscript
login_settings_hilite_pos = {
	loginOn = (630.0, 141.0)
	loginOff = (630.0, 180.0)
	loginPrompt = (630.0, 225.0)
}

script menu_login_settings_on_focus 
	retail_menu_focus \{Id = login_on_id}
	if ScreenelementExists \{Id = login_on_id}
		login_on_id :SetProps \{no_shadow}
	endif
	if ScreenelementExists \{Id = ds_hilite}
		ds_hilite :doMorph pos = ($login_settings_hilite_pos.loginOn) Time = 0.05
	endif
endscript

script menu_login_settings_on_unfocus 
	retail_menu_unfocus \{Id = login_on_id}
	if ScreenelementExists \{Id = login_on_id}
		login_on_id :SetProps \{Shadow shadow_rgba = [175 175 150 255] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_off_focus 
	retail_menu_focus \{Id = login_off_id}
	if ScreenelementExists \{Id = login_off_id}
		login_off_id :SetProps \{no_shadow}
	endif
	if ScreenelementExists \{Id = ds_hilite}
		ds_hilite :doMorph pos = ($login_settings_hilite_pos.loginOff) Time = 0.05
	endif
endscript

script menu_login_settings_off_unfocus 
	retail_menu_unfocus \{Id = login_off_id}
	if ScreenelementExists \{Id = login_off_id}
		login_off_id :SetProps \{Shadow shadow_rgba = [175 175 150 255] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_prompt_focus 
	retail_menu_focus \{Id = login_prompt_id}
	if ScreenelementExists \{Id = login_prompt_id}
		login_prompt_id :SetProps \{no_shadow}
	endif
	if ScreenelementExists \{Id = ds_hilite}
		ds_hilite :doMorph pos = ($login_settings_hilite_pos.loginPrompt) Time = 0.05
	endif
endscript

script menu_login_settings_prompt_unfocus 
	retail_menu_unfocus \{Id = login_prompt_id}
	if ScreenelementExists \{Id = login_prompt_id}
		login_prompt_id :SetProps \{Shadow shadow_rgba = [175 175 150 255] shadow_offs = (5.0, 5.0)}
	endif
endscript

script menu_login_settings_on_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginOn + (135.0, -10.0)) Time = 0.25
	NetSessionfunc \{func = SetAutoLoginSetting Params = {autoLoginSetting = autoLoginOn}}
endscript

script menu_login_settings_off_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginOff + (135.0, -10.0)) Time = 0.25
	NetSessionfunc \{func = SetAutoLoginSetting Params = {autoLoginSetting = autoLoginOff}}
endscript

script menu_login_settings_prompt_select 
	menu_login_settings_place_checkmark pos = ($login_settings_hilite_pos.loginPrompt + (135.0, -10.0)) Time = 0.25
	NetSessionfunc \{func = SetAutoLoginSetting Params = {autoLoginSetting = autoLoginPrompt}}
endscript

script menu_login_settings_place_checkmark 
	Soundevent \{Event = Generic_Menu_Back_SFX}
	if ScreenelementExists \{Id = login_checkmark_id}
		login_checkmark_id :doMorph pos = <pos> Time = <Time>
	endif
endscript
