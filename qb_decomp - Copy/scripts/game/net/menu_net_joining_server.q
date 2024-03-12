
script create_join_server_menu 
	createScreenElement \{Type = containerElement PARENT = root_window Id = joining_screen_container pos = (0.0, 0.0)}
	killspawnedScript \{Name = destroy_loading_screen_spawned}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite \{Id = online_frame PARENT = joining_screen_container tex = Online_Frame_Large pos = (640.0, 100.0) just = [Center top] Z = 2}
	displaySprite \{Id = Online_Frame_Crown PARENT = joining_screen_container tex = Online_Frame_Crown pos = (640.0, 42.0) just = [Center top] Z = 2.1 Dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<Title_text> = "QUICKMATCH"
		elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<Title_text> = "INVITATION"
		elseif (($ui_flow_manager_state [0]) = private_match_joining_game_fs)
		<Title_text> = "PRIVATE MATCH"
	else
		<Title_text> = "BROWSE MATCHES"
	endif
	createScreenElement {
		Type = textElement
		PARENT = joining_screen_container
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		Text = <Title_text>
		pos = (640.0, 135.0)
		just = [Center top]
		z_priority = 2.1
	}
	createScreenElement {
		Type = textElement
		PARENT = joining_screen_container
		Text = "JOINING GAME"
		just = [Center Center]
		pos = (640.0, 340.0)
		Rot_Angle = 0
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <Id>
		Id = dots_text
		font = fontgrid_title_gh3
		scale = 0.65000004
		rgba = ($online_light_blue)
		Text = ""
		just = [Left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if ScreenelementExists \{Id = dots_text}
		runScriptOnScreenElement \{Id = dots_text animate_dots Params = {Id = dots_text}}
	endif
endscript

script destroy_join_server_menu 
	if ScreenelementExists \{Id = joining_screen_container}
		DestroyScreenelement \{Id = joining_screen_container}
	endif
	destroy_popup_warning_menu
	destroy_menu_backdrop
endscript

script create_joining_screen 
	createScreenElement \{Type = containerElement PARENT = root_window Id = joining_screen_container pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	createScreenElement \{Type = textElement PARENT = joining_screen_container Text = "JOINING GAME" just = [Center Center] pos = (640.0, 340.0) Rot_Angle = 0 font = fontgrid_title_gh3 scale = 2.0 rgba = [210 210 210 250] Shadow shadow_offs = (5.0, 5.0) shadow_rgba = [0 0 0 255] z_priority = 2.0}
	createScreenElement \{Type = textElement PARENT = joining_screen_container Id = joining_dots_text font = text_A5 scale = 2.0 rgba = [210 210 210 250] Text = "" just = [Left top] z_priority = 2.0 pos = (640.0, 450.0) Shadow shadow_offs = (5.0, 5.0) shadow_rgba = [0 0 0 255]}
	if ScreenelementExists \{Id = joining_dots_text}
		runScriptOnScreenElement \{Id = joining_dots_text animate_dots Params = {Id = joining_dots_text}}
	endif
endscript

script destroy_joining_screen 
	if ScreenelementExists \{Id = joining_screen_container}
		DestroyScreenelement \{Id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
