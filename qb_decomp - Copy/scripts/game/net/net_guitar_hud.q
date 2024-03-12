
script net_setup_solo_hud 
	getArraySize \{$hud_screen_elements}
	array_entry = 0
	get_num_players_by_gamemode
	begin
	Id = ($hud_screen_elements [<array_entry>].Id)
	ExtendCrc <Id> ($player2_status.Text) out = Id
	pos = ($hud_screen_elements [<array_entry>].pos)
	yoff = ($hud_screen_elements [<array_entry>].yoff)
	if (<num_players> = 2)
		px = (<pos>.(1.0, 0.0))
		py = (<pos>.(0.0, 1.0))
		px = (<px> * 0.4 + 640)
		py = (<py> - <yoff>)
		pos = (<px> * (1.0, 0.0) + <py> * (0.0, 1.0))
	endif
	createScreenElement {
		Type = textElement
		PARENT = <hud_destroygroup>
		font = text_a6
		just = [Left top]
		scale = 1.0
		rgba = [210 210 210 250]
		z_priority = 80.0
		($hud_screen_elements [<array_entry>])
		pos = <pos>
		Id = <Id>
	}
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	reset_hud_text player_Text = ($player2_status.Text)
	if ($game_mode = p2_career)
		Change \{g_hud_2d_struct_used = career_hud_2d_elements}
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		Change \{g_hud_2d_struct_used = net_faceoff_hud_2d_elements_solo}
		elseif ($game_mode = p2_battle || ($boss_battle = 1))
		Change \{g_hud_2d_struct_used = net_battle_hud_2d_elements_solo}
	else
		Change \{g_hud_2d_struct_used = career_hud_2d_elements}
	endif
	ExtendCrc HUD_2D_Container ($<player_status>.Text) out = new_2d_container
	if NOT ScreenelementExists Id = <new_2d_container>
		createScreenElement {
			Type = containerElement
			PARENT = root_window
			pos = (0.0, 0.0)
			just = [Left top]
			Id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements PARENT = <new_2d_container> player_Text = ($<player_status>.Text) elements_structure = $g_hud_2d_struct_used
	ExtendCrc \{HUD_2D_Container 'p2' out = new_2d_container}
	if NOT ScreenelementExists Id = <new_2d_container>
		createScreenElement {
			Type = containerElement
			PARENT = root_window
			pos = (0.0, 0.0)
			just = [Left top]
			Id = <new_2d_container>
			scale = (($g_hud_2d_struct_used).scale)
		}
	endif
	create_2d_hud_elements PARENT = <new_2d_container> player_Text = 'p2' elements_structure = $g_hud_2d_struct_used
endscript
