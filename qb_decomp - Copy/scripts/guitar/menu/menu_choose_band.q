choose_band_menu_font = text_a3

script create_choose_band_menu 
	Menu_pos = (400.0, 270.0)
	new_menu {
		scrollid = scrolling_choose_band
		vmenuid = vmenu_choose_band
		use_backdrop = 0
		Menu_pos = <Menu_pos>
		Spacing = -9
	}
	set_focus_color \{rgba = [255 220 140 255]}
	set_unfocus_color \{rgba = [90 25 5 255]}
	create_menu_backdrop \{texture = Toprockers_bg}
	rotation_angle = -2
	setScreenElementProps \{Id = scrolling_choose_band}
	setScreenElementProps \{Id = vmenu_choose_band internal_just = [Center top] Dims = (650.0, 365.0)}
	createScreenElement \{Type = containerElement Id = cb_helper_container PARENT = root_window pos = (0.0, 0.0)}
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		pos = ($Menu_pos)
		Id = choose_band_header_container
	}
	createScreenElement {
		Type = spriteElement
		PARENT = choose_band_header_container
		Id = big_blue_box
		just = [Left Bottom]
		rgba = [30 110 160 0]
		pos = (-283.0, 165.0)
		Dims = (655.0, 80.0)
		Rot_Angle = <rotation_angle>
	}
	createScreenElement \{Type = spriteElement PARENT = cb_helper_container Id = light_overlay texture = Venue_Overlay pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 99}
	createScreenElement \{Type = spriteElement PARENT = cb_helper_container Id = ticket_image texture = band_name_ticket rgba = [255 255 255 255] pos = (640.0, 360.0) Dims = (1280.0, 720.0) just = [Center Center] z_priority = 1}
	createScreenElement {
		Type = spriteElement
		PARENT = cb_helper_container
		Id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		pos = (($enter_band_name_big_vals).right_side_img_pos)
		Dims = (($enter_band_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	<rand> = 0
	GetRandomValue \{Name = rand Integer A = 0 B = 2}
	if (<rand> = 0)
		setScreenElementProps \{Id = random_image texture = band_name_graphic01}
		elseif (<rand> = 1)
		setScreenElementProps \{Id = random_image texture = band_name_graphic02}
		elseif (<rand> = 2)
		setScreenElementProps \{Id = random_image texture = band_name_graphic03}
	endif
	createScreenElement \{Type = spriteElement PARENT = cb_helper_container Id = ticket_overlay texture = band_name_ticket_bar_overlay rgba = [255 255 255 255] pos = (734.0, 360.0) Dims = (684.0, 680.0) just = [Center Center] z_priority = 2}
	choose_band_text = "CHOOSE BAND"
	createScreenElement {
		Type = textElement
		PARENT = big_blue_box
		just = [Right Bottom]
		font = text_a10_large
		rgba = [105 50 35 255]
		Text = <choose_band_text>
		scale = 1.75
	}
	fit_text_in_rectangle Id = <Id> Dims = (850.0, 200.0) pos = (510.0, 75.0)
	createScreenElement \{Type = spriteElement PARENT = big_blue_box just = [Right Bottom] Id = logo_vault_image texture = setlist_icon_generic pos = (660.0, 96.0) Dims = (128.0, 128.0) BLEND = Subtract}
	<cb_hlBar_pos> = [(6.0, 96.0) (6.0, 145.0) (6.0, 204.0) (8.0, 255.0) (9.0, 312.0)]
	<cb_hlBar_dims> = [(656.0, 48.0) (656.0, 58.0) (656.0, 48.0) (654.0, 58.0) (653.0, 54.0)]
	displaySprite {
		PARENT = big_blue_box
		tex = White
		rgba = [205 105 110 255]
		pos = ((<cb_hlBar_pos>) [0])
		Dims = ((<cb_hlBar_dims>) [0])
		Z = 3
	}
	<cb_hlBarID> = <Id>
	<loop_count> = 5
	band_index = 1
	begin
	band_name = "- NEW BAND -"
	get_band_game_mode_name
	formatText Checksumname = bandname_id 'band%i_info_%g' I = <band_index> G = <game_mode_name>
	getglobaltags <bandname_id> param = Name
	if NOT (<Name> = "")
		<band_name> = <Name>
	endif
	createScreenElement {
		Type = textElement
		PARENT = vmenu_choose_band
		font = ($choose_band_menu_font)
		scale = (1.1, 1.3)
		rgba = ($menu_unfocus_color)
		Text = <band_name>
		just = [Center top]
		Rot_Angle = <rotation_angle>
		event_handlers = [
			{focus retail_menu_focus}
			{focus setScreenElementProps Params = {
					Id = <cb_hlBarID>
					pos = ((<cb_hlBar_pos>) [(<band_index> - 1)])
					Dims = ((<cb_hlBar_dims>) [(<band_index> - 1)])
				}
			}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_choose_band_make_selection Params = {band_index = <band_index>}}
		]
	}
	getScreenElementDims Id = <Id>
	if (<width> > 500)
		setScreenElementProps Id = <Id> scale = (1.0, 1.3)
		elseif (<width> > 300)
		setScreenElementProps Id = <Id> scale = (1.2, 1.3)
	else
		setScreenElementProps Id = <Id> scale = (1.5, 1.3)
	endif
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script destroy_choose_band_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_choose_band}
	destroy_menu \{menu_id = choose_band_header_container}
	destroy_menu \{menu_id = cb_helper_container}
	destroy_menu_backdrop
endscript

script menu_choose_band_make_selection 
	Change current_band = <band_index>
	get_band_game_mode_name
	formatText Checksumname = bandname_id 'band%i_info_%g' I = <band_index> G = <game_mode_name>
	getglobaltags <bandname_id> param = Name
	if (<Name> = "")
		ui_flow_manager_respond_to_action \{action = select_new_band}
	else
		ui_flow_manager_respond_to_action \{action = select_existing_band}
	endif
endscript
