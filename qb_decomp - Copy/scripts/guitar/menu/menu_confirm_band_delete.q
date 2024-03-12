confirm_band_delete_menu_font = fontgrid_title_gh3

script create_confirm_band_delete_menu 
	new_menu \{scrollid = cbd_warning_scroll vmenuid = cbd_warning_vmenu Menu_pos = (605.0, 469.0) Spacing = -20}
	set_focus_color \{rgba = [130 0 0 250]}
	set_unfocus_color \{rgba = [0 0 0 255]}
	createScreenElement \{Type = containerElement PARENT = root_window Id = cbd_container pos = (0.0, 0.0) just = [Left top]}
	offwhite = [223 223 223 255]
	Z = 100
	displaySprite PARENT = cbd_container tex = Dialog_Title_BG flip_v pos = (416.0, 60.0) scale = (1.75, 1.75) Z = <Z>
	displaySprite PARENT = cbd_container tex = Dialog_Title_BG pos = (640.0, 60.0) scale = (1.75, 1.75) Z = <Z>
	displaySprite PARENT = cbd_container tex = White pos = (525.0, 524.0) scale = (58.0, 6.0) Z = (<Z> + 0.1) rgba = <offwhite>
	displaySprite PARENT = cbd_container tex = Dialog_Frame_Joiner pos = (510.0, 510.0) Rot_Angle = 5 scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite PARENT = cbd_container tex = Dialog_Frame_Joiner pos = (723.0, 514.0) flip_v Rot_Angle = -5 scale = (1.575, 1.5) Z = (<Z> + 0.2)
	displaySprite PARENT = cbd_container tex = Dialog_BG pos = (514.0, 467.0) scale = (1.0, 1.25) Z = <Z>
	displaySprite PARENT = cbd_container tex = Dialog_BG flip_h pos = (514.0, 537.0) scale = (1.0, 1.25) Z = <Z>
	displaySprite Id = hi_right PARENT = cbd_container tex = Dialog_Highlight pos = (770.0, 533.0) scale = (1.0, 1.0) Z = (<Z> + 0.3)
	displaySprite Id = hi_left PARENT = cbd_container tex = Dialog_Highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) Z = (<Z> + 0.3)
	create_pause_menu_frame \{x_scale = 1.2 Z = 98}
	create_confirm_band_delete_warning_text Z = <Z>
	create_confirm_band_delete_warning_menu_options Z = <Z>
endscript

script destroy_confirm_band_delete_menu 
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = cbd_warning_scroll}
	destroy_menu \{menu_id = cbd_container}
endscript

script create_confirm_band_delete_warning_text 
	createScreenElement {
		Type = textElement
		font = ($confirm_band_delete_menu_font)
		Text = "WARNING"
		just = [Center Center]
		pos = (640.0, 180.0)
		scale = 1.3
		PARENT = cbd_container
		rgba = [200 200 200 255]
		Shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 6)
	}
	Text = [
		"You are about to permanently delete the selected band. "
		"All progress associated with that band will be lost. "
		"Are you sure you want to continue?"
	]
	createScreenElement {
		Type = textblockelement
		font = ($confirm_band_delete_menu_font)
		Text = <Text>
		just = [Center Center]
		pos = (640.0, 360.0)
		Dims = (700.0, 500.0)
		scale = (0.75, 0.6)
		PARENT = cbd_container
		rgba = [210 130 0 250]
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 1)
	}
endscript

script create_confirm_band_delete_warning_menu_options 
	createScreenElement {
		Type = textElement
		font = ($confirm_band_delete_menu_font)
		PARENT = cbd_warning_vmenu
		Text = "NO"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_confirm_band_delete_highlight_no}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_confirm_band_delete_select_no}
		]
		z_priority = (<Z> + 5)
	}
	createScreenElement {
		Type = textElement
		font = ($confirm_band_delete_menu_font)
		PARENT = cbd_warning_vmenu
		Text = "YES"
		scale = 1
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus menu_confirm_band_delete_highlight_yes}
			{unfocus retail_menu_unfocus}
			{pad_choose menu_confirm_band_delete_select_yes}
		]
		z_priority = (<Z> + 5)
	}
endscript

script menu_confirm_band_delete_highlight_no 
	retail_menu_focus
	setScreenElementProps \{Id = hi_left pos = (545.0, 502.0) flip_v}
	setScreenElementProps \{Id = hi_right pos = (680.0, 502.0)}
endscript

script menu_confirm_band_delete_highlight_yes 
	retail_menu_focus
	setScreenElementProps \{Id = hi_left pos = (540.0, 548.0) flip_v}
	setScreenElementProps \{Id = hi_right pos = (685.0, 548.0)}
endscript

script menu_confirm_band_delete_select_no 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script menu_confirm_band_delete_select_yes 
	band_count = ($current_band)
	getArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	formatText Checksumname = bandname 'p1_career_band%i_%d' I = ($num_career_bands + 1) D = <difficulty_text_nl> AddToStringLookup = TRUE
	pop_bandtags bandname = <bandname>
	formatText Checksumname = bandname 'p1_career_band%i_%d' I = <band_count> D = <difficulty_text_nl> AddToStringLookup = TRUE
	push_bandtags bandname = <bandname> mode = p1_career
	formatText Checksumname = bandname 'p2_career_band%i_%d' I = ($num_career_bands + 1) D = <difficulty_text_nl> AddToStringLookup = TRUE
	pop_bandtags bandname = <bandname>
	formatText Checksumname = bandname 'p2_career_band%i_%d' I = <band_count> D = <difficulty_text_nl> AddToStringLookup = TRUE
	push_bandtags bandname = <bandname> mode = p2_career
	formatText Checksumname = default_bandname 'band%i_info_p1_career' I = <band_count> AddToStringLookup = TRUE
	setGlobalTags <default_bandname> Params = {($default_bandtags)}
	formatText Checksumname = default_bandname 'band%i_info_p2_career' I = <band_count> AddToStringLookup = TRUE
	setGlobalTags <default_bandname> Params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if isWinPort
		SaveToMemoryCard \{FileName = $memcard_file_name filetype = Progress usepaddingslot = Always}
	endif
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
