manage_band_menu_font = text_a4

script create_manage_band_menu 
	get_band_game_mode_name
	formatText Checksumname = bandname_id 'band%i_info_%g' I = ($current_band) G = <game_mode_name>
	getglobaltags <bandname_id>
	formatText Textname = the_bands_name "''%n''" N = <Name>
	new_menu \{scrollid = mb_scroll vmenuid = mb_vmenu use_backdrop = 0 Menu_pos = (732.0, 314.0) Rot_Angle = -2 Spacing = 1}
	create_menu_backdrop \{texture = Toprockers_bg}
	createScreenElement \{Type = containerElement Id = mb_helper_container PARENT = root_window pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement Id = mb_menu_container PARENT = mb_vmenu pos = (0.0, 0.0) NOT_FOCUSABLE}
	createScreenElement \{Type = spriteElement PARENT = mb_helper_container Id = light_overlay texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 99}
	createScreenElement \{Type = spriteElement PARENT = mb_helper_container Id = ticket_image texture = band_name_ticket rgba = [255 255 255 255] pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 1}
	createScreenElement {
		Type = spriteElement
		PARENT = mb_helper_container
		Id = mb_random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		pos = (($enter_band_name_big_vals).right_side_img_pos)
		Dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{Name = rand Integer A = 0 B = 2}
	if (<rand> = 0)
		setScreenElementProps \{Id = mb_random_image texture = band_name_graphic01}
		elseif (<rand> = 1)
		setScreenElementProps \{Id = mb_random_image texture = band_name_graphic02}
		elseif (<rand> = 2)
		setScreenElementProps \{Id = mb_random_image texture = band_name_graphic03}
	endif
	<manage_band_pos> = (725.0, 190.0)
	createScreenElement {
		Type = textElement
		PARENT = mb_helper_container
		pos = <manage_band_pos>
		font = text_a10_large
		rgba = [90 25 5 255]
		Text = "MANAGE BAND"
		scale = 1.75
		z_priority = 3
		Rot_Angle = -2
	}
	fit_text_in_rectangle Id = <Id> Dims = (850.0, 200.0) pos = <manage_band_pos>
	createScreenElement {
		Type = textElement
		PARENT = mb_helper_container
		pos = (<manage_band_pos> + (0.0, 110.0))
		font = ($choose_band_menu_font)
		rgba = [230 230 200 255]
		Text = <the_bands_name>
		scale = (1.75, 1.25)
		z_priority = 3
		Rot_Angle = -2
	}
	getScreenElementDims Id = <Id>
	if (<width> > 600)
		fit_text_in_rectangle Id = <Id> Dims = (1000.0, 70.0) pos = (<manage_band_pos> + (0.0, 110.0))
	endif
	displaySprite {
		PARENT = mb_helper_container
		tex = White
		rgba = [90 25 5 255]
		pos = (<manage_band_pos> + (-325.0, 92.0))
		Dims = (656.0, 48.0)
		Z = 3
		Rot_Angle = -2
	}
	<mb_hlBar_pos_1> = (408.0, 385.0)
	<mb_hlBar_pos_2> = (408.0, 441.0)
	<mb_hlBar_dims> = (654.0, 58.0)
	displaySprite {
		Id = mb_hlBarID
		PARENT = mb_helper_container
		tex = White
		rgba = [205 105 110 255]
		pos = <mb_hlBar_pos_1>
		Dims = <mb_hlBar_dims>
		Z = 3
		Rot_Angle = -2
	}
	createScreenElement {
		Id = mb_rename_band_id
		PARENT = mb_menu_container
		Type = textElement
		font = ($choose_band_menu_font)
		rgba = ($menu_unfocus_color)
		Text = "RENAME  BAND"
		just = [Center top]
	}
	createScreenElement {
		PARENT = mb_vmenu
		Type = textElement
		font = ($choose_band_menu_font)
		Text = ""
		scale = 1.3
		just = [Center top]
		event_handlers = [
			{focus setScreenElementProps Params = {
					Id = mb_hlBarID
					pos = <mb_hlBar_pos_1>
				}
			}
			{focus manage_band_highlighter Params = {Id = mb_rename_band_id Select}}
			{unfocus manage_band_highlighter Params = {Id = mb_rename_band_id unselect}}
			{pad_choose menu_manage_band_rename_band}
		]
	}
	createScreenElement {
		Id = mb_delete_band_id
		PARENT = mb_menu_container
		Type = textElement
		font = ($choose_band_menu_font)
		rgba = [90 25 5 255]
		Text = "DELETE  BAND"
		just = [Center top]
		pos = (0.0, 56.0)
	}
	createScreenElement {
		PARENT = mb_vmenu
		Type = textElement
		font = ($choose_band_menu_font)
		Text = ""
		just = [Center top]
		event_handlers = [
			{focus setScreenElementProps Params = {
					Id = mb_hlBarID
					pos = <mb_hlBar_pos_2>
				}
			}
			{focus setScreenElementProps Params = {
					Id = mb_delete_band_id
					scale = 1.3
					rgba = [255 220 140 255]
				}
			}
			{unfocus setScreenElementProps Params = {
					Id = mb_delete_band_id
					scale = 1.0
					rgba = [90 25 5 255]
				}
			}
			{pad_choose menu_manage_band_delete_band}
		]
	}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script manage_band_highlighter 
	if gotParam \{Select}
		setScreenElementProps Id = <Id> scale = 1.3 rgba = [255 220 140 255]
		getScreenElementDims Id = <Id>
		if (<width> > 634)
			fit_text_in_rectangle Id = <Id> Dims = ((626.0, 0.0) + ((0.0, 1.0) * <Height>)) start_x_scale = 1.3 start_y_scale = 1.3
		endif
		elseif gotParam \{unselect}
		setScreenElementProps Id = <Id> scale = 1.0 rgba = [90 25 5 255]
		getScreenElementDims Id = <Id>
		if (<width> > 634)
			fit_text_in_rectangle Id = <Id> Dims = ((626.0, 0.0) + ((0.0, 1.0) * <Height>)) start_x_scale = 1.0 start_y_scale = 1.0
		endif
	endif
endscript

script destroy_manage_band_menu 
	destroy_menu \{menu_id = mb_scroll}
	destroy_menu \{menu_id = mb_helper_container}
	destroy_menu \{menu_id = mb_menu_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script menu_manage_band_rename_band 
	ui_flow_manager_respond_to_action \{action = select_rename_band}
endscript

script menu_manage_band_delete_band 
	ui_flow_manager_respond_to_action \{action = select_delete_band}
endscript
