audio_settings_menu_font = fontgrid_title_gh3
audio_settings_editing = BAND
aom_menu_pos = (480.0, 100.0)
as_pointer_pos = [
	(264.0, 160.0)
	(264.0, 330.0)
	(264.0, 500.0)
]
as_pointer_index = 0
as_pointer_scale = 1
as_is_popup = 0
as_ping_index = 0
audio_settings_locked = 0

script create_audio_settings_menu \{Popup = 0}
	exclusive_params = {}
	createScreenElement \{Type = containerElement PARENT = root_window Id = aom_container pos = (0.0, 0.0)}
	if (<Popup> = 1)
		kill_start_key_binding
		Z = 100
		Change \{as_is_popup = 1}
		new_menu {
			scrollid = as_scroll
			vmenuid = as_vmenu
			Menu_pos = (420.0, 280.0)
			exclusive_device = ($last_start_pressed_device)
			text_right
			Spacing = 40
		}
		create_pause_menu_frame Z = (<Z> - 10)
		Change \{menu_focus_color = [254 204 55 255]}
		Change \{menu_unfocus_color = [182 182 182 255]}
		text_params = {
			PARENT = as_vmenu
			Type = textElement
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = <Z>
			scale = 0.7
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		createScreenElement {
			Type = spriteElement
			PARENT = aom_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [Center Center]
			z_priority = (<Z> + 100)
		}
		createScreenElement {
			Type = textElement
			PARENT = <Id>
			Text = "AUDIO"
			font = text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
		if NOT IsSinglePlayerGame
			formatText Textname = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." D = (($last_start_pressed_device) + 1)
			displaySprite {
				PARENT = pause_menu_frame_container
				Id = pause_helper_text_bg
				tex = Control_pill_body
				pos = (640.0, 600.0)
				just = [Center Center]
				rgba = [96 0 0 255]
				Z = (<Z> + 10)
			}
			displayText {
				PARENT = pause_menu_frame_container
				pos = (640.0, 604.0)
				just = [Center Center]
				Text = <player_paused_text>
				rgba = [186 105 0 255]
				scale = (0.45000002, 0.6)
				Z = (<Z> + 11)
				font = text_a6
			}
			getScreenElementDims Id = <Id>
			bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
			pause_helper_text_bg :SetProps Dims = <bg_dims>
			displaySprite {
				PARENT = pause_menu_frame_container
				tex = Control_pill_end
				pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [Right Center]
				flip_v
				Z = (<Z> + 10)
			}
			displaySprite {
				PARENT = pause_menu_frame_container
				tex = Control_pill_end
				pos = ((640.0, 600.0) + <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [Left Center]
				Z = (<Z> + 10)
			}
		endif
		displaySprite \{PARENT = aom_container tex = Options_Audio_Knob pos = (725.0, 295.0) just = [Center Center] Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 150}
		displaySprite \{PARENT = aom_container tex = Options_Audio_Knob pos = (825.0, 365.0) just = [Center Center] Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 150}
		displaySprite \{PARENT = aom_container tex = Options_Audio_Knob pos = (725.0, 440.0) just = [Center Center] Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 150}
		displaySprite \{PARENT = aom_container Id = aom_knob_line_1 tex = Options_Audio_Knob_Line pos = (725.0, 295.0) Dims = (48.0, 12.0) Z = 151 rgba = [230 190 70 255] just = [1.0 0.0]}
		displaySprite \{PARENT = aom_container Id = aom_knob_line_2 tex = Options_Audio_Knob_Line pos = (825.0, 365.0) Dims = (48.0, 12.0) Z = 151 rgba = [230 190 70 255] just = [1.0 0.0]}
		displaySprite \{PARENT = aom_container Id = aom_knob_line_3 tex = Options_Audio_Knob_Line pos = (725.0, 440.0) Dims = (48.0, 12.0) Z = 151 rgba = [230 190 70 255] just = [1.0 0.0]}
	else
		Change \{as_is_popup = 0}
		Spacing = 105
		new_menu scrollid = as_scroll vmenuid = as_vmenu Spacing = <Spacing> Menu_pos = $aom_menu_pos exclusive_device = ($primary_controller)
		create_menu_backdrop \{texture = Venue_BG}
		createScreenElement \{Type = spriteElement PARENT = aom_container Id = as_light_overlay texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 99}
		set_focus_color \{rgba = [230 190 70 255]}
		set_unfocus_color \{rgba = [150 150 150 255]}
		displaySprite \{PARENT = aom_container tex = Options_Audio_Poster pos = (340.0, 40.0) Dims = (672.0, 672.0)}
		displaySprite \{PARENT = aom_container tex = Tape_H_01 pos = (360.0, 40.0) Dims = (192.0, 96.0) Z = 10 Rot_Angle = -20}
		displaySprite \{PARENT = aom_container tex = Tape_H_01 rgba = [0 0 0 128] pos = (360.0, 48.0) Dims = (192.0, 96.0) Z = 10 Rot_Angle = -20}
		displaySprite \{PARENT = aom_container tex = Tape_V_01 pos = (870.0, 550.0) Dims = (96.0, 192.0) Z = 10 Rot_Angle = 16}
		displaySprite \{PARENT = aom_container tex = Tape_V_01 rgba = [0 0 0 128] pos = (875.0, 551.0) Dims = (96.0, 192.0) Z = 10 Rot_Angle = 16}
		displaySprite PARENT = aom_container tex = Options_Audio_Knob pos = ($aom_menu_pos + (15.0, 50.0)) Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 9
		displaySprite PARENT = aom_container tex = Options_Audio_Knob pos = ($aom_menu_pos + (15.0, 219.0)) Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 9
		displaySprite PARENT = aom_container tex = Options_Audio_Knob pos = ($aom_menu_pos + (15.0, 386.0)) Dims = (96.0, 96.0) rgba = [150 150 150 255] Z = 9
		displaySprite \{PARENT = aom_container Id = aom_belly_strings tex = Options_Audio_BellyStrings pos = (744.0, 146.0) Dims = (74.0, 318.0) Z = 10}
		displaySprite PARENT = aom_container Id = aom_pointer tex = Options_Audio_Pointer_V2 pos = ($as_pointer_pos [0]) Dims = (256.0, 128.0) relative_scale Z = 10
		displaySprite PARENT = aom_container Id = aom_knob_line_1 tex = Options_Audio_Knob_Line pos = ($aom_menu_pos + (63.0, 94.0)) Dims = (48.0, 12.0) Z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaySprite PARENT = aom_container Id = aom_knob_line_2 tex = Options_Audio_Knob_Line pos = ($aom_menu_pos + (63.0, 263.0)) Dims = (48.0, 12.0) Z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaySprite PARENT = aom_container Id = aom_knob_line_3 tex = Options_Audio_Knob_Line pos = ($aom_menu_pos + (63.0, 430.0)) Dims = (48.0, 12.0) Z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		getScreenElementProps Id = <Id>
		text_params = {PARENT = as_vmenu Type = textElement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color)}
	endif
	I = 0
	begin
	formatText Checksumname = ping_id 'aom_ping_%d' D = <I>
	displaySprite PARENT = aom_container Id = <ping_id> tex = Options_Audio_Ping Alpha = 0 scale = 1 Z = 180 just = [Center Center]
	<I> = (<I> + 1)
	repeat 11
	getglobaltags \{user_options}
	formatText Textname = band_volume_text "%d" D = <band_volume>
	if (<Popup>)
		formatText Textname = Text "BAND: %d" D = <band_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaySprite \{PARENT = pause_menu_frame_container tex = Newspaper_Circle rgba = [0 0 0 255] pos = (615.0, 295.0) Dims = (58.0, 58.0) just = [Center Center] Z = 200}
		displaySprite \{PARENT = pause_menu_frame_container Id = band_yeller tex = Newspaper_Circle rgba = [0 0 0 255] pos = (615.0, 295.0) Dims = (44.0, 44.0) just = [Center Center] Z = 201}
		displayText {
			PARENT = pause_menu_frame_container
			Id = band_volume_text_id
			pos = (613.0, 298.0)
			just = [Center Center]
			rgba = ($menu_unfocus_color)
			Z = 202
			scale = 0.8
			font = text_a6
			Text = <band_volume_text>
			noshadow
		}
	else
		Text = "BAND"
		displayText PARENT = aom_container Id = band_volume_id Text = <band_volume_text> pos = ($aom_menu_pos + (130.0, 75.0)) Z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setScreenElementProps Id = aom_knob_line_1 Rot_Angle = ((<band_volume> / 11.0) * 180.0)
	createScreenElement {
		<text_params>
		Text = "BAND"
		Id = as_band
		pos = (600.0, 32.0)
		event_handlers = [
			{focus menu_audio_settings_focus Params = {editing = BAND}}
			{unfocus menu_audio_settings_unfocus Params = {editing = BAND}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{PAD_LEFT menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	formatText Textname = guitar_volume_text "%d" D = <guitar_volume>
	if (<Popup>)
		formatText Textname = Text "GUITAR: %d" D = <guitar_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaySprite \{PARENT = pause_menu_frame_container tex = HUD_score_nixie_2a rgba = [0 0 0 255] pos = (615.0, 365.0) Dims = (58.0, 58.0) just = [Center Center] Z = 200}
		displaySprite \{PARENT = pause_menu_frame_container Id = guitar_yeller tex = Newspaper_Circle rgba = [0 0 0 255] pos = (615.0, 365.0) Dims = (44.0, 44.0) just = [Center Center] Z = 201}
		displayText {
			PARENT = pause_menu_frame_container
			Id = guitar_volume_text_id
			pos = (613.0, 368.0)
			just = [Center Center]
			rgba = ($menu_unfocus_color)
			Z = 202
			scale = 0.8
			font = text_a6
			noshadow
			Text = <guitar_volume_text>
		}
	else
		displayText PARENT = aom_container Id = guitar_volume_id Text = <guitar_volume_text> pos = ($aom_menu_pos + (130.0, 243.0)) Z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setScreenElementProps Id = aom_knob_line_2 Rot_Angle = ((<guitar_volume> / 11.0) * 180.0)
	createScreenElement {
		<text_params>
		Text = "GUITAR"
		Id = as_guitar
		event_handlers = [
			{focus menu_audio_settings_focus Params = {editing = GUITAR}}
			{unfocus menu_audio_settings_unfocus Params = {editing = GUITAR}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{PAD_LEFT menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	formatText Textname = sfx_volume_text "%d" D = <sfx_volume>
	if (<Popup>)
		formatText Textname = Text "FX: %d" D = <sfx_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaySprite \{PARENT = pause_menu_frame_container tex = HUD_score_nixie_2a rgba = [0 0 0 255] pos = (615.0, 440.0) Dims = (58.0, 58.0) just = [Center Center] Z = 200}
		displaySprite \{PARENT = pause_menu_frame_container Id = fx_yeller tex = Newspaper_Circle rgba = [0 0 0 255] pos = (615.0, 440.0) Dims = (44.0, 44.0) just = [Center Center] Z = 201}
		displayText {
			PARENT = pause_menu_frame_container
			Id = fx_volume_text_id
			pos = (613.0, 443.0)
			just = [Center Center]
			rgba = ($menu_unfocus_color)
			Z = 202
			scale = 0.8
			font = text_a6
			Text = <sfx_volume_text>
			noshadow
		}
	else
		displayText PARENT = aom_container Id = sfx_volume_id Text = <sfx_volume_text> pos = ($aom_menu_pos + (130.0, 409.0)) Z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setScreenElementProps Id = aom_knob_line_3 Rot_Angle = ((<sfx_volume> / 11.0) * 180.0)
	createScreenElement {
		<text_params>
		Text = "FX"
		Id = as_sfx
		event_handlers = [
			{focus menu_audio_settings_focus Params = {editing = SFX}}
			{unfocus menu_audio_settings_unfocus Params = {editing = SFX}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{PAD_LEFT menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	if (<Popup>)
		getScreenElementDims \{Id = as_band}
		fit_text_in_rectangle Id = as_band only_if_larger_x = 1 Dims = ((160.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		getScreenElementDims \{Id = as_guitar}
		fit_text_in_rectangle Id = as_guitar only_if_larger_x = 1 Dims = ((160.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		getScreenElementDims \{Id = as_sfx}
		fit_text_in_rectangle Id = as_sfx only_if_larger_x = 1 Dims = ((160.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
	endif
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script destroy_audio_settings_menu 
	clean_up_user_control_helpers
	Change \{audio_settings_locked = 0}
	Change \{as_pointer_index = 0}
	destroy_menu \{menu_id = aom_container}
	destroy_menu \{menu_id = as_scroll}
	destroy_menu \{menu_id = as_highlight_sprite}
	destroy_menu_backdrop
	destroy_pause_menu_frame
endscript

script menu_audio_settings_focus 
	retail_menu_focus
	Change audio_settings_editing = <editing>
	last_index = $as_pointer_index
	switch (<editing>)
		case BAND
		Change \{as_pointer_index = 0}
		if ($as_is_popup)
			setScreenElementProps Id = band_yeller rgba = ($menu_focus_color)
			setScreenElementProps \{Id = band_volume_text_id rgba = [0 0 0 255]}
		endif
		case GUITAR
		Change \{as_pointer_index = 1}
		if ($as_is_popup)
			setScreenElementProps Id = guitar_yeller rgba = ($menu_focus_color)
			setScreenElementProps \{Id = guitar_volume_text_id rgba = [0 0 0 255]}
		endif
		case SFX
		Change \{as_pointer_index = 2}
		if ($as_is_popup)
			setScreenElementProps Id = fx_yeller rgba = ($menu_focus_color)
			setScreenElementProps \{Id = fx_volume_text_id rgba = [0 0 0 255]}
		endif
	endswitch
	aom_hilite_knob
	if NOT ($as_is_popup)
		aom_move_pointer last_index = <last_index>
	endif
endscript

script menu_audio_settings_unfocus 
	retail_menu_unfocus
	if ($as_is_popup)
		switch (<editing>)
			case BAND
			setScreenElementProps \{Id = band_yeller rgba = [0 0 0 255]}
			setScreenElementProps Id = band_volume_text_id rgba = ($menu_unfocus_color)
			case GUITAR
			setScreenElementProps \{Id = guitar_yeller rgba = [0 0 0 255]}
			setScreenElementProps Id = guitar_volume_text_id rgba = ($menu_unfocus_color)
			case SFX
			setScreenElementProps \{Id = fx_yeller rgba = [0 0 0 255]}
			setScreenElementProps Id = fx_volume_text_id rgba = ($menu_unfocus_color)
		endswitch
	endif
endscript

script menu_audio_settings_lock_selection 
	if NOT ($audio_settings_locked)
		Soundevent \{Event = ui_sfx_select}
	endif
	getTags
	launchevent \{Type = unfocus Target = as_vmenu}
	Wait \{1 GameFrame}
	launchevent Type = focus Target = <Id>
	setScreenElementProps {
		Id = <Id>
		event_handlers = [
			{pad_up menu_audio_settings_increase_volume_guitar_check}
			{pad_down menu_audio_settings_lower_volume_guitar_check}
		]
		Replace_Handlers
	}
	menu_audio_settings_highlight_item
	Change \{audio_settings_locked = 1}
endscript

script menu_audio_settings_press_back 
	Soundevent \{Event = Generic_Menu_Back_SFX}
	getTags
	launchevent Type = unfocus Target = <Id>
	Wait \{1 GameFrame}
	launchevent \{Type = focus Target = as_vmenu}
	setScreenElementProps {
		Id = <Id>
		event_handlers = [
			{pad_up null_script}
			{pad_down null_script}
		]
		Replace_Handlers
	}
	menu_audio_settings_remove_highlight
	Change \{audio_settings_locked = 0}
endscript

script ChangeSpinalTapVolume \{spinal_tap_volume_max = 11}
	<spinal_tap_volume> = (<spinal_tap_volume> + <Change>)
	if (<spinal_tap_volume> < 0)
		<spinal_tap_volume> = 0
		elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return Volume = <spinal_tap_volume>
endscript

script menu_audio_settings_lower_selection_volume 
	getglobaltags \{user_options}
	switch ($audio_settings_editing)
		case BAND
		ChangeSpinalTapVolume spinal_tap_volume = <band_volume> Change = -1
		setGlobalTags user_options Params = {band_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = band_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = band_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_1 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <Volume>
		if NOT (<band_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound
		else
			do_ping = 0
		endif
		case GUITAR
		ChangeSpinalTapVolume spinal_tap_volume = <guitar_volume> Change = -1
		setGlobalTags user_options Params = {guitar_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = guitar_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = guitar_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_2 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <Volume>
		if NOT (<guitar_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound
		else
			do_ping = 0
		endif
		case SFX
		ChangeSpinalTapVolume spinal_tap_volume = <sfx_volume> Change = -1
		setGlobalTags user_options Params = {sfx_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = fx_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = sfx_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_3 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <Volume>
		if NOT (<sfx_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound
		else
			do_ping = 0
		endif
	endswitch
	if (<do_ping>)
		formatText \{Checksumname = ping_id 'aom_ping_%d' D = $as_ping_index}
		Change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			Change \{as_ping_index = 0}
		endif
		runScriptOnScreenElement Id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_selection_volume 
	getglobaltags \{user_options}
	switch ($audio_settings_editing)
		case BAND
		ChangeSpinalTapVolume spinal_tap_volume = <band_volume> Change = 1
		setGlobalTags user_options Params = {band_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = band_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = band_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_1 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <Volume>
		if NOT (<band_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound
		else
			do_ping = 0
		endif
		case GUITAR
		ChangeSpinalTapVolume spinal_tap_volume = <guitar_volume> Change = 1
		setGlobalTags user_options Params = {guitar_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = guitar_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = guitar_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_2 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <Volume>
		if NOT (<guitar_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound
		else
			do_ping = 0
		endif
		case SFX
		ChangeSpinalTapVolume spinal_tap_volume = <sfx_volume> Change = 1
		setGlobalTags user_options Params = {sfx_volume = <Volume>}
		if ($as_is_popup)
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = fx_volume_text_id Text = <Text>
		else
			formatText Textname = Text "%d" D = <Volume>
			setScreenElementProps Id = sfx_volume_id Text = <Text>
		endif
		setScreenElementProps Id = aom_knob_line_3 Rot_Angle = ((<Volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <Volume>
		if NOT (<sfx_volume> = <Volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound
		else
			do_ping = 0
		endif
	endswitch
	if (<do_ping>)
		formatText \{Checksumname = ping_id 'aom_ping_%d' D = $as_ping_index}
		Change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			Change \{as_ping_index = 0}
		endif
		runScriptOnScreenElement Id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_volume_guitar_check 
	if isguitarcontroller controller = <device_num>
		menu_audio_settings_lower_selection_volume
	else
		menu_audio_settings_increase_selection_volume
	endif
endscript

script menu_audio_settings_lower_volume_guitar_check 
	if isguitarcontroller controller = <device_num>
		menu_audio_settings_increase_selection_volume
	else
		menu_audio_settings_lower_selection_volume
	endif
endscript

script menu_audio_settings_highlight_item 
	if NOT ScreenelementExists \{Id = as_highlight_sprite}
		getTags
		getScreenElementDims Id = <Id>
		GetScreenElementPosition Id = <Id> absolute
		if ($as_is_popup = 0)
			<highlight_pos> = (<ScreenELementPos> + (-0.05, 0.0) * <width> + (0.0, -0.05) * <Height>)
			<highlight_dims> = ((1.1, 0.0) * <width> + (0.0, 0.8) * <Height>)
		else
			<highlight_pos> = (<ScreenELementPos> + (-5.0, -3.0))
			<highlight_dims> = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height> + (12.0, 0.0))
		endif
		createScreenElement {
			Type = spriteElement
			PARENT = root_window
			Id = as_highlight_sprite
			pos = <highlight_pos>
			Dims = <highlight_dims>
			rgba = [210 130 0 125]
			just = [Left top]
			z_priority = 99
		}
	endif
endscript

script menu_audio_settings_remove_highlight 
	if ScreenelementExists \{Id = as_highlight_sprite}
		DestroyScreenelement \{Id = as_highlight_sprite}
	endif
endscript

script menu_audio_settings_get_buss_volume 
	switch <Volume>
		case 11
		<vol> = 0
		case 10
		<vol> = -1.2
		case 9
		<vol> = -2.4
		case 8
		<vol> = -3.7
		case 7
		<vol> = -4.9
		case 6
		<vol> = -6.2
		case 5
		<vol> = -8
		case 4
		<vol> = -10
		case 3
		<vol> = -13
		case 2
		<vol> = -17
		case 1
		<vol> = -21
		case 0
		<vol> = -100
	endswitch
	return vol = <vol>
endscript

script menu_audio_settings_update_guitar_volume \{vol = 11}
	menu_audio_settings_get_buss_volume Volume = <vol>
	SoundBussUnlock \{User_Guitar}
	Setsoundbussparams {User_Guitar = {vol = <vol>}}
	SoundBussLock \{User_Guitar}
endscript

script menu_audio_settings_update_band_volume \{vol = 11}
	menu_audio_settings_get_buss_volume Volume = <vol>
	SoundBussUnlock \{User_Band}
	Setsoundbussparams {User_Band = {vol = <vol>}}
	SoundBussLock \{User_Band}
endscript

script menu_audio_settings_update_sfx_volume \{vol = 11}
	Printf "Got vol = %v" v = <vol>
	menu_audio_settings_get_buss_volume Volume = <vol>
	Printf "Got vol-post = %v" v = <vol>
	SoundBussUnlock \{User_SFX}
	Printf Channel = SFX "setting user_sfx to %s " S = <vol>
	Setsoundbussparams {User_SFX = {vol = <vol>}}
	SoundBussLock \{User_SFX}
endscript

script aom_move_pointer 
	if NOT ($as_pointer_index = <last_index>)
		if (<last_index> < $as_pointer_index)
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, 85.0))
		else
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, -85.0))
		endif
		DoScreenElementMorph Id = aom_pointer pos = <middle_pos> scale = ($as_pointer_scale / 2.0) Time = 0.1 relative_scale
		Wait \{0.1 Seconds}
		DoScreenElementMorph Id = aom_pointer pos = ($as_pointer_pos [$as_pointer_index]) scale = $as_pointer_scale Time = 0.1 relative_scale
		Wait \{0.1 Seconds}
		<last_index> = $as_pointer_index
	endif
endscript

script aom_hilite_knob 
	switch ($as_pointer_index)
		case 0
		setScreenElementProps \{Id = aom_knob_line_1 rgba = [230 190 70 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = band_volume_id rgba = [230 190 70 255]}
		endif
		setScreenElementProps \{Id = aom_knob_line_2 rgba = [150 150 150 255]}
		setScreenElementProps \{Id = aom_knob_line_3 rgba = [150 150 150 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = guitar_volume_id rgba = [150 150 150 255]}
			setScreenElementProps \{Id = sfx_volume_id rgba = [150 150 150 255]}
		endif
		case 1
		setScreenElementProps \{Id = aom_knob_line_2 rgba = [230 190 70 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = guitar_volume_id rgba = [230 190 70 255]}
		endif
		setScreenElementProps \{Id = aom_knob_line_1 rgba = [150 150 150 255]}
		setScreenElementProps \{Id = aom_knob_line_3 rgba = [150 150 150 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = band_volume_id rgba = [150 150 150 255]}
			setScreenElementProps \{Id = sfx_volume_id rgba = [150 150 150 255]}
		endif
		case 2
		setScreenElementProps \{Id = aom_knob_line_3 rgba = [230 190 70 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = sfx_volume_id rgba = [230 190 70 255]}
		endif
		setScreenElementProps \{Id = aom_knob_line_1 rgba = [150 150 150 255]}
		setScreenElementProps \{Id = aom_knob_line_2 rgba = [150 150 150 255]}
		if NOT ($as_is_popup)
			setScreenElementProps \{Id = band_volume_id rgba = [150 150 150 255]}
			setScreenElementProps \{Id = guitar_volume_id rgba = [150 150 150 255]}
		endif
	endswitch
endscript

script aom_spawn_ping \{Time = 0.25}
	getTags
	if NOT ($as_is_popup)
		switch ($audio_settings_editing)
			case BAND
			pos = ($aom_menu_pos + (145.0, 96.0))
			case GUITAR
			pos = ($aom_menu_pos + (145.0, 266.0))
			case SFX
			pos = ($aom_menu_pos + (145.0, 436.0))
		endswitch
	else
		switch ($audio_settings_editing)
			case BAND
			pos = (725.0, 295.0)
			case GUITAR
			pos = (825.0, 365.0)
			case SFX
			pos = (725.0, 440.0)
		endswitch
	endif
	<Id> :doMorph scale = 1 pos = <pos> Alpha = 1
	<Id> :doMorph scale = 5 Alpha = 0 Time = <Time>
	if NOT ($as_is_popup)
		<center_belly_pos> = (744.0, 146.0)
		<left_belly_pos> = (724.0, 146.0)
		<right_belly_pos> = (764.0, 146.0)
		<jiggle_time> = 0.05
		begin
		DoScreenElementMorph Id = aom_belly_strings pos = <left_belly_pos> Time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph Id = aom_belly_strings pos = <center_belly_pos> Time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph Id = aom_belly_strings pos = <right_belly_pos> Time = <jiggle_time>
		Wait <jiggle_time> Seconds
		DoScreenElementMorph Id = aom_belly_strings pos = <center_belly_pos> Time = <jiggle_time>
		<left_belly_pos> = (<left_belly_pos> + (3.33, 0.0))
		<right_belly_pos> = (<right_belly_pos> + (-3.33, 0.0))
		repeat 6
	endif
endscript
