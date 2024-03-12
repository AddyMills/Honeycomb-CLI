g_np_player1_ready = 0
g_np_player2_ready = 0
np_safe = 0

script net_create_newspaper_menu 
	printScriptInfo \{"MJS --- net_create_newspaper_menu"}
	Change \{np_safe = 0}
	Change \{g_np_player1_ready = 0}
	Change \{g_np_player2_ready = 0}
	create_ready_icons \{pos1 = (260.0, 200.0) pos2 = (880.0, 180.0)}
	record_net_statistics
	Change net_song_num = ($net_song_num + 1)
	determine_if_game_over
	printScriptInfo \{"MJS --- checking game_over"}
	if (<game_over> = 0)
		printScriptInfo \{"MJS --- game_over is 0"}
		get_number_of_songs
		if ((($net_song_num) != (<num_songs> - 1)) || ($game_mode = p2_coop))
			SpawnScriptNOw \{net_np_create_timer}
			Change current_song = ($net_setlist_songs [($net_song_num)])
			setGlobalTags Progression Params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
		else
			do_tie_breaker_selection
		endif
	else
		printScriptInfo \{"MJS --- game_over is 1"}
		net_stats_calculate_wins
		if (<p1_wins> = 1)
			printScriptInfo \{"MJS --- <p1_wins> = 1"}
			Printf \{"Player 1 won! Checking if we can give them the make achievement!"}
			retrieve_player_net_id \{Player = 2}
			CheckAndWriteMakerAchievement player_xuid = <net_id>
		endif
		if ScreenelementExists \{Id = newspaper_vmenu}
			printScriptInfo \{"ScreenElementExists id=newspaper_vmenu"}
			launchevent \{Type = unfocus Target = newspaper_vmenu}
			newspaper_vmenu :Obj_SpawnScriptLater \{net_wait_and_focus_newspaper}
		endif
		printScriptInfo \{"SpawnScriptNow online_match_end_write_stats"}
		SpawnScriptNOw \{online_match_end_write_stats}
	endif
	Change \{np_safe = 1}
endscript

script np_net_create_options_menu \{pos = (600.0, 300.0) rot = 0 scale = 0.8 menu_font = fontgrid_title_gh3}
	setScreenElementProps Id = newspaper_scroll pos = <pos>
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	set_focus_color rgba = <offwhite>
	set_unfocus_color rgba = <reddish>
	if NOT ($game_mode = p2_coop)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	displayText Id = np_option_0 PARENT = newspaper_container Text = "CONTINUE" pos = (($g_np_option_props [0].pos) + <menu_offset> + (0.0, 13.0)) scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
	setScreenElementProps Id = <Id> font_spacing = 2 space_spacing = 4
	retail_menu_focus \{Id = np_option_0}
	retail_menu_unfocus \{Id = np_option_1}
	switch $g_ss_mag_number
		case 0
		<ss_hilite_color> = $g_ss_black
		<ss_menu_icon> = Song_Summary_Menu_Icon_BACKYARD
		case 1
		<ss_hilite_color> = [109 76 44 255]
		<ss_menu_icon> = Song_Summary_Menu_Icon_BAR
		case 2
		<ss_hilite_color> = $g_ss_Paste_brownish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Paste
		case 3
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Decibel
		case 4
		<ss_hilite_color> = $g_ss_AP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_AP
		case 5
		<ss_hilite_color> = $g_ss_Kerrang_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Kerrang
		case 6
		<ss_hilite_color> = $g_ss_GP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_GPlayer
		case 7
		<ss_hilite_color> = $g_ss_HELL_darker_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_HELL
	endswitch
	displaySprite {
		Id = ss_menu_hilite_id
		PARENT = newspaper_container
		tex = Song_Summary_Menu_Hilite
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + <menu_offset>)
		rgba = <ss_hilite_color>
		Rot_Angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		Dims = (320.0, 40.0)
		Z = 1
	}
	displaySprite {
		Id = ss_menu_icon_id
		PARENT = newspaper_container
		tex = <ss_menu_icon>
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		Rot_Angle = ($g_np_option_props [$g_np_options_index].rot)
		Dims = (80.0, 80.0)
		Z = 3
	}
	createScreenElement {
		Type = textElement
		PARENT = newspaper_vmenu
		font = <menu_font>
		event_handlers = [
			{focus retail_menu_focus}
			{focus setScreenElementProps Params = {Id = np_option_0 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
			{unfocus retail_menu_unfocus}
			{unfocus setScreenElementProps Params = {Id = np_option_0 no_shadow}}
			{pad_choose net_np_ready_for_next_song}
			{pad_start menu_show_gamercard}
		]
	}
	net_create_newspaper_menu
endscript

script net_np_ready_for_next_song \{Player = 1}
	begin
	if ($np_safe = 1)
		break
	endif
	Wait \{1 GameFrame}
	repeat
	if ((<Player> = 1) && ($g_np_player1_ready))
		return
		elseif ((<Player> = 2) && ($g_np_player2_ready))
		return
	endif
	formatText Checksumname = player_status 'player%p_status' P = <Player>
	get_number_of_songs
	determine_if_game_over
	if (<game_over> = 1)
		if (<player_status>.is_local_client)
			ui_flow_manager_respond_to_action \{action = continue_to_net_stats}
		endif
		return
	else
		if (<player_status>.is_local_client)
			SendNetMessage \{Type = start_next_round}
			Change \{g_np_player1_ready = 1}
		else
			Change \{g_np_player2_ready = 1}
		endif
		update_np_timer
		drop_in_ready_sign Player = <Player>
	endif
endscript

script net_np_create_timer \{Player = 1}
	timer_z = 3.1
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = net_timer_container
		pos = (350.0, 210.0)
		just = [Left top]
		z_priority = <timer_z>
	}
	create_pause_menu_frame x_scale = 0.2 y_scale = 0.25 PARENT = net_timer_container Z = <timer_z> gradient = 0
	createScreenElement {
		Type = textElement
		Id = Timer_text
		PARENT = net_timer_container
		just = [Center Center]
		scale = (1.75, 1.75)
		Text = "20"
		pos = (640.0, 341.0)
		font = text_a4
		rgba = [125 0 0 255]
		z_priority = (<timer_z> + 5)
	}
	text_id = <Id>
	runScriptOnScreenElement Id = <text_id> np_timer_countdown
endscript

script np_timer_countdown 
	Obj_Getid
	<objId> :SetTags timer_value = 20
	begin
	Wait \{1 Seconds}
	<objId> :getTags
	<timer_value> = (<timer_value> - 1)
	<objId> :SetTags timer_value = <timer_value>
	formatText Textname = timer_text_value "%t" T = <timer_value>
	<objId> :SetProps Text = <timer_text_value>
	if (<timer_value> < 1)
		Spawnscriptlater \{load_and_sync_timing Params = {start_delay = 3000 player_status = player1_status}}
		ui_flow_manager_respond_to_action \{action = continue_to_next_song}
		break
	endif
	repeat
endscript

script cleanup_newspaper_other_player_quit 
	Printf \{"cleanup newspaper the other player has quit"}
	Change \{g_np_player1_ready = 0}
	Change \{g_np_player2_ready = 0}
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
endscript

script update_np_timer 
	players_ready = ($g_np_player1_ready + $g_np_player2_ready)
	Timer_text :getTags
	if (<players_ready> = 2)
		if (<timer_value> > 6)
			<timer_value> = 6
		endif
		elseif (<players_ready> = 1)
		if (<timer_value> > 11)
			<timer_value> = 11
		endif
	endif
	Timer_text :SetTags timer_value = <timer_value>
endscript

script net_np_destroy_timer 
	if ScreenelementExists \{Id = net_timer_container}
		DestroyScreenelement \{Id = net_timer_container}
	endif
endscript

script net_destroy_newspaper_menu 
	destroy_ready_icons
	net_np_destroy_timer
	destroy_gamertags
	Change \{np_safe = 0}
endscript

script net_np_confirm_quit 
endscript

script determine_if_game_over 
	get_number_of_songs
	game_over = 0
	if (($player2_present = 0) || ($net_song_num >= <num_songs>))
		<game_over> = 1
		elseif NOT ($game_mode = p2_coop)
		net_stats_calculate_wins
		if ((<p1_wins> > (<num_songs> / 2)) || (<p2_wins> > (<num_songs> / 2)))
			<game_over> = 1
		endif
	endif
	return game_over = <game_over>
endscript

script do_tie_breaker_selection 
	StartGameNetScriptPump
	get_number_of_songs
	launchevent \{Type = unfocus Target = newspaper_vmenu}
	formatText Textname = final_song_text "The score is even at %d-%d.  The tie-breaker song will be chosen by..." D = (<num_songs> / 2)
	create_popup_warning_menu {
		title = "FINAL SONG"
		title_props = {scale = 1.0}
		textblock = {
			Id = tb_text
			Text = <final_song_text>
			pos = (640.0, 380.0)
		}
		Menu_pos = (570.0, 475.0)
		no_background
	}
	runScriptOnScreenElement Id = tb_text animate_names Params = {Id = tb_text Text = <final_song_text>}
endscript

script animate_names 
	if (NetSessionfunc Obj = match func = get_gamertag)
		name1 = <Name>
	endif
	name2 = ($opponent_gamertag)
	if ($tie_breaker = host)
		if (isHost)
			winner = <name1>
		else
			winner = <name2>
		endif
	else
		if (isHost)
			winner = <name2>
		else
			winner = <name1>
		endif
	endif
	Name = <name1>
	wait_time = 0.025
	if ScreenelementExists Id = <Id>
		begin
		if (<Name> = <name1>)
			<Name> = <name2>
		else
			<Name> = <name1>
		endif
		formatText Textname = new_text "%a\\n\\n%b" A = <Text> B = <Name>
		<Id> :SetProps Text = <new_text>
		if ((<wait_time> > 0.75) && (<Name> = <winner>))
			break
		endif
		Wait <wait_time> Seconds
		<wait_time> = (<wait_time> * 1.1)
		repeat
	endif
	animate_names_finish
endscript

script animate_names_finish 
	Wait \{1.5 Seconds}
	destroy_popup_warning_menu
	Change \{g_tie_breaker_song = 1}
	set_final_song_selection
	ui_flow_manager_respond_to_action \{action = choose_tie_breaker_song}
endscript

script set_final_song_selection 
	if ($tie_breaker = host)
		Change host_songs_to_pick = ($host_songs_to_pick + 1)
	else
		Change client_songs_to_pick = ($client_songs_to_pick + 1)
	endif
	if (isHost)
		SetSongSelections
	endif
endscript

script net_wait_and_focus_newspaper 
	Wait \{3 Seconds}
	launchevent \{Type = focus Target = newspaper_vmenu}
endscript
