menu_choose_practice_part_font = fontgrid_title_gh3

script create_choose_practice_part_menu 
	printf \{"create_choose_practice_part_menu"}
	spawnscriptnow \{menu_music_on}
	kill_start_key_binding
	menu_pos = (845.0, 258.0)
	CreateScreenElement \{type = ContainerElement id = cpp_container parent = root_window just = [left top] Pos = (0.0, 0.0)}
	new_menu scrollid = cpp_scroll vmenuid = cpp_vmenu menu_pos = <menu_pos> spacing = -45
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{type = SpriteElement parent = cpp_container texture = Venue_Overlay Pos = (640.0, 360.0) dims = (1280.0, 720.0) just = [center center] z_priority = 99}
	displaySprite \{parent = cpp_container tex = Practice_Poster_3 Pos = (186.0, 15.0) dims = (672.0, 672.0) rot_angle = -2 z = 1}
	displaySprite \{parent = cpp_container tex = Toprockers_Tape_2 Pos = (500.0, 650.0) z = 3 rot_angle = -12 flip_v}
	displaySprite \{parent = cpp_container tex = Toprockers_Tape_1 Pos = (565.0, -95.0) z = 3 rot_angle = 80}
	displaySprite \{parent = cpp_container tex = Toprockers_Tape_2 Pos = (500.0, -85.0) z = 3 rot_angle = 80}
	displaySprite \{parent = cpp_container tex = Toprockers_Tape_2 Pos = (435.0, -75.0) z = 3 rot_angle = 78}
	CreateScreenElement {
		type = TextBlockElement
		parent = cpp_container
		id = header
		text = "PRACTICE PART"
		Pos = (360.0, 70.0)
		dims = (100.0, 300.0)
		Scale = 1.5
		just = [left top]
		internal_just = [left top]
		line_spacing = 0.62
		rgba = [35 100 130 255]
		font = ($menu_choose_practice_part_font)
		z = 2
		rot_angle = -2
	}
	GetScreenElementChildren id = <id>
	GetArraySize (<children>)
	i = 0
	begin
	GetScreenElementDims id = (<children> [<i>])
	width_to_check_for = 225
	if (<i> = 1)
		<width_to_check_for> = 120
	endif
	if (<width> > <width_to_check_for>)
		fit_text_in_rectangle id = (<children> [<i>]) dims = (<width_to_check_for> * (1.0, 0.0) + <height> * (0.0, 1.0))
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	displaySprite \{parent = cpp_container tex = dialog_bg Pos = (680.0, 256.0) dims = (332.0, 70.0) z = 2}
	displaySprite \{parent = cpp_container tex = dialog_bg flip_h Pos = (680.0, 326.0) dims = (332.0, 70.0) z = 2}
	displaySprite {
		id = cpp_hi_left
		parent = cpp_container
		tex = Dialog_Highlight
		flip_v
		Pos = (720.0, 325.0)
		z = 5
		just = [RIGHT center]
		rgba = (($g_menu_colors).pink)
	}
	displaySprite {
		id = cpp_hi_right
		parent = cpp_container
		tex = Dialog_Highlight
		Pos = (910.0, 325.0)
		z = 5
		just = [left center]
		rgba = (($g_menu_colors).pink)
	}
	guitar_or_lead_text = "GUITAR"
	bass_or_rhythm_text = "BASS"
	get_song_rhythm_track song = ($current_song)
	if (<rhythm_track> = 1)
		<guitar_or_lead_text> = "LEAD"
		<bass_or_rhythm_text> = "RHYTHM"
	endif
	set_focus_color \{color = pink}
	set_unfocus_color \{color = dk_violet_grey}
	CreateScreenElement \{type = ContainerElement id = cpp_guitar parent = cpp_vmenu event_handlers = [{focus retail_menu_focus params = {id = guitar_text}}{focus menu_choose_practice_part_highlighter params = {text_id = guitar_text guitar}}{unfocus retail_menu_unfocus params = {id = guitar_text}}{pad_choose practicemenu_select_part params = {part = guitar}}{pad_back practicemenu_go_back}] dims = (100.0, 100.0)}
	CreateScreenElement {
		type = TextElement
		font = ($menu_choose_practice_part_font)
		parent = cpp_guitar
		id = guitar_text
		text = <guitar_or_lead_text>
		Scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [center center]
	}
	GetScreenElementDims id = <id>
	if (<width> > 250)
		fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement \{type = ContainerElement id = cpp_bass parent = cpp_vmenu event_handlers = [{focus retail_menu_focus params = {id = bass_text}}{focus menu_choose_practice_part_highlighter params = {text_id = bass_text Bass}}{unfocus retail_menu_unfocus params = {id = bass_text}}{pad_choose practicemenu_select_part params = {part = rhythm}}{pad_back practicemenu_go_back}] dims = (100.0, 100.0)}
	CreateScreenElement {
		type = TextElement
		font = ($menu_choose_practice_part_font)
		parent = cpp_bass
		id = bass_text
		text = <bass_or_rhythm_text>
		Scale = (1.0, 0.0, 1.0)
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		z_priority = 5
		just = [center center]
	}
	GetScreenElementDims id = <id>
	if (<width> > 250)
		fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0))
	endif
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
endscript

script menu_choose_practice_part_highlighter 
	GetScreenElementDims id = <text_id>
	y_off = (0.0, 0.0)
	if GotParam \{Bass}
		<y_off> = (0.0, 60.0)
	endif
	new_pos_l = ((840.0, 295.0) + <y_off> - <width> * (0.5, 0.0))
	new_pos_r = ((850.0, 295.0) + <y_off> + <width> * (0.5, 0.0))
	if GotParam \{guitar}
		SetScreenElementProps id = cpp_hi_left Pos = <new_pos_l> preserve_flip
		SetScreenElementProps id = cpp_hi_right Pos = <new_pos_r>
		elseif GotParam \{Bass}
		SetScreenElementProps id = cpp_hi_left Pos = <new_pos_l> preserve_flip
		SetScreenElementProps id = cpp_hi_right Pos = <new_pos_r>
	endif
endscript

script destroy_choose_practice_part_menu 
	destroy_pause_menu_frame
	restore_start_key_binding
	destroy_menu_backdrop
	destroy_menu \{menu_id = cpp_scroll}
	destroy_menu \{menu_id = cpp_container}
	clean_up_user_control_helpers
	reset_focus_colors
endscript

script practicemenu_select_part 
	change structurename = player1_status part = <part>
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script practicemenu_go_back 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript
