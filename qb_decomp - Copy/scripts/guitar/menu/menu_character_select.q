g_cs_jumped_p1 = 0
g_cs_jumped_p2 = 0
g_character_select_icon_index_p1 = 0
g_character_select_icon_index_p2 = 0
g_cs_scroll_ready_p1 = 1
g_cs_scroll_ready_p2 = 1
g_cs_choose_ready_p1 = 0
g_cs_choose_ready_p2 = 0
g_cs_select_normal_w = 64
g_cs_select_normal_h = 128
g_cs_select_extra_w = 89
g_cs_select_extra_h = 179
g_cs_hilite_rot1 = 180
g_cs_hilite_rot2 = 360
g_cs_num_icons = 13
g_cs_safe_to_scroll_p1 = 0
g_cs_safe_to_scroll_p2 = 0
cs_total_guitarists_p1 = 0
cs_total_guitarists_p2 = 0
character_select_highlighted_character_p1 = 0
character_select_highlighted_character_p2 = 0
character_select_highlighted_character_p2_dirty = 0

script cs_go_back \{Player = 1}
	clean_up_user_control_helpers
	shut_down_character_hub
	destroy_gamertags
	if (<Player> = 1)
		shut_down_flow_manager \{Player = 2}
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		shut_down_flow_manager \{Player = 1}
		shut_down_flow_manager \{Player = 2}
		if ($game_mode = p2_career)
			progression_push_current
			start_flow_manager \{flow_state = coop_career_select_difficulty_fs}
		else
			start_flow_manager \{flow_state = mp_select_mode_fs}
		endif
	endif
endscript

script create_net_game_info_panel \{PARENT = user_control_container pos = (520.0, 420.0) window_width = 250 window_body_height = 40 base_z = -1}
	if NOT gotParam \{PARENT}
		SoftAssert \{"Did not get a parent for the net_game_info_panel!"}
		return
	endif
	if ScreenelementExists \{Id = net_game_info_panel}
		DestroyScreenelement \{Id = net_game_info_panel}
	endif
	bg_fill_color = [0 0 0 200]
	createScreenElement {
		Type = containerElement
		Id = net_game_info_panel
		PARENT = <PARENT>
		pos = <pos>
		just = [Left top]
		z_priority = -10000
	}
	cont_id = <Id>
	text_scale = 0.5
	side_offset = 25
	text_pos_rt = ((0.0, 25.0) + <side_offset> * (1.0, 0.0))
	text_space = 0
	text_z = 0.1
	createScreenElement {
		Type = textElement
		PARENT = <cont_id>
		font = fontgrid_title_gh3
		Text = "Settings"
		scale = 0.8
		pos = (<text_pos_rt> + (<window_width> / 2 - <side_offset>) * (1.0, 0.0))
		just = [Center top]
		z_priority = (<base_z> + <text_z>)
	}
	getScreenElementDims Id = <Id>
	text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <Height> + (0.0, 1.0) * <text_space>)
	createScreenElement {
		Type = textElement
		PARENT = <cont_id>
		font = fontgrid_title_gh3
		Text = "Mode:"
		scale = <text_scale>
		pos = <text_pos_rt>
		just = [Left top]
		z_priority = (<base_z> + <text_z>)
	}
	fit_text_into_menu_item Id = <Id> max_width = 70
	get_game_mode_ui_string game_mode = ($game_mode)
	printStruct <...>
	createScreenElement {
		Type = textElement
		PARENT = <cont_id>
		font = fontgrid_title_gh3
		Text = <ui_string>
		scale = <text_scale>
		pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
		just = [Right top]
		z_priority = (<base_z> + <text_z>)
	}
	fit_text_into_menu_item Id = <Id> max_width = 120
	if checksumequals A = ($game_mode) B = p2_pro_faceoff
		getScreenElementDims Id = <Id>
		text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <Height> + (0.0, 1.0) * <text_space>)
		window_body_height = 80
		createScreenElement {
			Type = textElement
			PARENT = <cont_id>
			font = fontgrid_title_gh3
			Text = "Difficulty:"
			scale = <text_scale>
			pos = <text_pos_rt>
			just = [Left top]
			z_priority = (<base_z> + <text_z>)
		}
		fit_text_into_menu_item Id = <Id> max_width = 120
		get_difficulty_ui_string DIFFICULTY = ($current_difficulty)
		printStruct <...>
		createScreenElement {
			Type = textElement
			PARENT = <cont_id>
			font = fontgrid_title_gh3
			Text = <ui_string>
			scale = <text_scale>
			pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
			just = [Right top]
			z_priority = (<base_z> + <text_z>)
		}
		fit_text_into_menu_item Id = <Id> max_width = 70
	endif
	getScreenElementDims Id = <Id>
	text_pos_rt = (<text_pos_rt> + (0.0, 1.0) * <Height> + (0.0, 1.0) * <text_space>)
	createScreenElement {
		Type = textElement
		PARENT = <cont_id>
		font = fontgrid_title_gh3
		Text = "Num Songs:"
		scale = <text_scale>
		pos = <text_pos_rt>
		just = [Left top]
		z_priority = (<base_z> + <text_z>)
	}
	get_number_of_songs
	formatText Textname = num_songs_text "%d" D = <num_songs>
	createScreenElement {
		Type = textElement
		PARENT = <cont_id>
		font = fontgrid_title_gh3
		Text = <num_songs_text>
		scale = <text_scale>
		pos = (<text_pos_rt> + (<window_width> -2 * <side_offset>) * (1.0, 0.0))
		just = [Right top]
		z_priority = (<base_z> + <text_z>)
	}
	top_dims = ((0.0, 64.0) + <window_width> * (1.0, 0.0))
	top_pos = (0.0, 0.0)
	displaySprite {
		PARENT = <cont_id>
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		pos = <top_pos>
		just = [Left top]
		z_priority = <base_z>
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<top_dims>.(1.0, 0.0))
		target_height = (<top_dims>.(0.0, 1.0))
	}
	displaySprite {
		PARENT = <cont_id>
		tex = window_fill_cap
		rgba = <bg_fill_color>
		pos = <top_pos>
		just = [Left top]
		z_priority = <base_z>
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<top_dims>.(1.0, 0.0))
		target_height = (<top_dims>.(0.0, 1.0))
	}
	getScreenElementDims Id = <Id>
	middle_pos = (<top_pos> + <Height> * (0.0, 1.0))
	middle_dims = ((0.0, 1.0) * <window_body_height> + <window_width> * (1.0, 0.0))
	displaySprite {
		PARENT = <cont_id>
		tex = window_frame_body_tall
		rgba = ($online_medium_blue)
		pos = <middle_pos>
		just = [Left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<middle_dims>.(1.0, 0.0))
		target_height = (<middle_dims>.(0.0, 1.0))
	}
	displaySprite {
		PARENT = <cont_id>
		tex = window_fill_body_large
		rgba = <bg_fill_color>
		pos = <middle_pos>
		just = [Left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<middle_dims>.(1.0, 0.0))
		target_height = (<middle_dims>.(0.0, 1.0))
	}
	getScreenElementDims Id = <Id>
	bottom_pos = (<middle_pos> + <Height> * (0.0, 1.0))
	bottom_dims = ((0.0, 64.0) + <window_width> * (1.0, 0.0))
	displaySprite {
		PARENT = <cont_id>
		tex = window_frame_cap
		rgba = ($online_medium_blue)
		pos = <bottom_pos>
		just = [Left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<bottom_dims>.(1.0, 0.0))
		target_height = (<bottom_dims>.(0.0, 1.0))
	}
	displaySprite {
		PARENT = <cont_id>
		tex = window_fill_cap
		rgba = <bg_fill_color>
		pos = <bottom_pos>
		just = [Left top]
		z_priority = <base_z>
		flip_h
	}
	scale_element_to_size {
		Id = <Id>
		target_width = (<bottom_dims>.(1.0, 0.0))
		target_height = (<bottom_dims>.(0.0, 1.0))
	}
	getScreenElementDims Id = <Id>
	cont_dims = (<bottom_pos> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
	setScreenElementProps {
		Id = <cont_id>
		Dims = <cont_dims>
	}
endscript

script create_character_select_menu \{Player = 1}
	Printf \{"create_character_select_menu"}
	SpawnScriptNOw \{Menu_Music_On}
	if ($is_network_game)
		mark_unsafe_for_shutdown
		Change \{winport_block_net_pause = 1}
		Change \{gHandlingWindowClosed = 0}
	endif
	if (($is_network_game = 1) && (<Player> = 1) && ($net_can_send_approval = 1))
		if NOT ($net_current_flow_state = character_hub)
			net_lobby_state_message {
				current_state = ($net_current_flow_state)
				action = request
				request_state = character_hub
			}
			blah = 1
		endif
	endif
	Change \{menu_flow_locked = 1}
	destroy_character_select_menu Player = <Player>
	formatText Checksumname = safe_to_scroll 'g_cs_safe_to_scroll_p%d' D = <Player>
	Change globalName = <safe_to_scroll> NewValue = 0
	Change \{rich_presence_context = presence_character_select}
	if ($is_network_game = 1)
		killspawnedScript \{Name = net_hub_stream}
		if ($player2_present)
			SpawnScriptNOw \{net_hub_stream}
		endif
		if (<Player> = 2)
			net_match_send_available_items
		endif
	endif
	if (<Player> = 1)
		if ($num_user_control_helpers = 0)
			add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
			add_user_control_helper \{Text = "BACK" button = Red Z = 100}
			add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
		endif
	endif
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		NetSessionfunc \{Obj = voice func = entering_free_skate}
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	cs_menu_pos = (400.0, 120.0)
	if (($is_network_game) = 1)
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down Params = {Player = <Player> Dir = Up}}
			{pad_down cs_scroll_up_or_down Params = {Player = <Player> Dir = Down}}
			{pad_back net_cs_go_back Params = {Player = <Player>}}
			{pad_choose character_select_choose Params = {Player = <Player>}}
			{pad_start menu_show_gamercard}
		]
	else
		cs_event_handlers = [
			{pad_up cs_scroll_up_or_down Params = {Player = <Player> Dir = Up}}
			{pad_down cs_scroll_up_or_down Params = {Player = <Player> Dir = Down}}
			{pad_back cs_go_back Params = {Player = <Player>}}
			{pad_choose character_select_choose Params = {Player = <Player>}}
		]
	endif
	if (<Player> = 2)
		new_menu {
			scrollid = scrolling_character_select_p2
			vmenuid = vmenu_character_select_p2
			Menu_pos = <cs_menu_pos>
			use_backdrop = (0)
			font = fontgrid_title_gh3
			font_size = 1.0
			event_handlers = <cs_event_handlers>
			no_wrap
			exclusive_device = <exclusive_dev>
			no_focus = 1
		}
		if (($is_network_game) = 1)
			launchevent \{Type = unfocus Target = vmenu_character_select_p2}
		endif
	else
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_character_select_p1
				vmenuid = vmenu_character_select_p1
				Name = <menu_title_text>
				Menu_pos = <cs_menu_pos>
				use_backdrop = (0)
				font = fontgrid_title_gh3
				font_size = 1.0
				event_handlers = <cs_event_handlers>
				no_wrap
				no_focus = 1
			}
			get_current_first_play
			if (<first_play>)
				launchevent \{Type = unfocus Target = vmenu_character_select_p1}
			endif
		else
			if ($is_network_game)
				createScreenElement \{Type = containerElement PARENT = root_window Id = menu_container pos = (0.0, 0.0)}
			endif
			new_menu {
				scrollid = scrolling_character_select_p1
				vmenuid = vmenu_character_select_p1
				Menu_pos = <cs_menu_pos>
				use_backdrop = (0)
				font = fontgrid_title_gh3
				font_size = 1.0
				event_handlers = <cs_event_handlers>
				no_wrap
				exclusive_device = <exclusive_dev>
				no_focus = 1
			}
		endif
	endif
	if find_profile_by_id Id = ($player1_status.character_id)
		get_valid_character_index_reverse Index = <Index> Player = 1
		Change character_select_highlighted_character_p1 = <char_index>
	endif
	if find_profile_by_id Id = ($player2_status.character_id)
		if ($is_network_game = 0)
			get_valid_character_index_reverse Index = <Index> Player = 2
			Change character_select_highlighted_character_p2 = <char_index>
		else
			if (character_select_highlighted_character_p2_dirty = 1)
				get_valid_character_index_reverse Index = <Index> Player = 2
				Change character_select_highlighted_character_p2 = <char_index>
				Change \{character_select_highlighted_character_p2_dirty = 0}
			endif
		endif
	endif
	if (<Player> = 1)
		Mod \{A = $character_select_highlighted_character_p1 B = $g_cs_num_icons}
		Change g_cs_jumped_p1 = (($character_select_highlighted_character_p1 / $g_cs_num_icons) * $g_cs_num_icons)
		Change g_character_select_icon_index_p1 = <Mod>
	else
		Mod \{A = $character_select_highlighted_character_p2 B = $g_cs_num_icons}
		Change g_cs_jumped_p2 = (($character_select_highlighted_character_p2 / $g_cs_num_icons) * $g_cs_num_icons)
		Change g_character_select_icon_index_p2 = <Mod>
	endif
	character_select_menu_highlight_name Player = 1 musician_index = ($character_select_highlighted_character_p1)
	character_select_menu_highlight_name Player = 2 musician_index = ($character_select_highlighted_character_p2)
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	char_name = ($<player_status>.band_Member)
	ExtendCrc <char_name> '_Info' out = info_struct
	Change StructureName = <info_struct> current_anim = Idle
	Change StructureName = <info_struct> cycle_anim = TRUE
	Change StructureName = <info_struct> next_anim = NONE
	if NOT ($game_mode = p2_career || $game_mode = p2_coop)
		Change \{StructureName = player1_status part = GUITAR}
		Change \{StructureName = player2_status part = GUITAR}
	endif
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	setup_character_hub Player = <Player>
	if compositeObjectexists Name = <char_name>
		if NOT ($<info_struct>.stance = stance_FrontEnd)
			<char_name> :handle_change_stance stance = stance_FrontEnd No_wait
		endif
	endif
	formatText Checksumname = char_select_parent_container 'char_select_container_p%p' P = <Player>
	formatText Checksumname = char_select_character_container 'char_select_character_container_p%p' P = <Player>
	formatText Checksumname = char_select_next_icon 'cs_icon_id_next_p%p' P = <Player>
	formatText Checksumname = icon_id_prev 'cs_icon_id_prev_p%p' P = <Player>
	formatText Checksumname = char_select_icon 'g_character_select_icon_index_p%p' P = <Player>
	formatText Checksumname = cs_jumped 'g_cs_jumped_p%p' P = <Player>
	formatText Checksumname = hilite_container 'char_select_hilite_container_p%p' P = <Player>
	formatText Checksumname = cs_name_text 'cs_name_text_p%p' P = <Player>
	createScreenElement {
		Type = containerElement
		Id = <char_select_parent_container>
		PARENT = root_window
		pos = (0.0, 0.0)
	}
	<char_select_parent_container> :SetTags pos = (0.0, 0.0)
	if ($is_network_game = 1)
		create_net_game_info_panel \{PARENT = user_control_container}
	endif
	get_musician_profile_size
	next_icon_pos = (210.0, 70.0)
	Left = 0
	icon_dims = (64.0, 128.0)
	icon_scale = 1
	if ($current_num_players = 2)
		<icon_dims> = (48.0, 96.0)
		<icon_scale> = 0.75
		<next_icon_pos> = (210.0, 160.0)
		Change \{g_cs_select_extra_w = 67}
		Change \{g_cs_select_extra_h = 134}
		Change \{g_cs_select_normal_w = 48}
		Change \{g_cs_select_normal_h = 96}
	else
		Change \{g_cs_select_extra_w = 89}
		Change \{g_cs_select_extra_h = 179}
		Change \{g_cs_select_normal_w = 64}
		Change \{g_cs_select_normal_h = 128}
	endif
	if (<Player> = 2)
		<next_icon_pos> = (1020.0, 160.0)
		<prev_pos> = ((-80.0, -90.0) * <icon_scale>)
	else
		<prev_pos> = ((80.0, -90.0) * <icon_scale>)
	endif
	displaySprite {
		Id = <icon_id_prev>
		PARENT = <char_select_parent_container>
		tex = Char_Select_Menu_Arrow
		pos = (<next_icon_pos> + <prev_pos>)
		Dims = <icon_dims>
		flip_h
	}
	DoScreenElementMorph Id = <icon_id_prev> Alpha = 0
	hilight_pos = (0.0, 0.0)
	num_hilite_add = 0
	I = 0
	begin
	if (<I> < $g_cs_num_icons)
		formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = <I>
		displaySprite {
			Id = <icon_id>
			PARENT = <char_select_parent_container>
			tex = Char_Select_Default
			pos = (<next_icon_pos> + ((32.0, 64.0) * <icon_scale>))
			Dims = <icon_dims>
			just = [Center Center]
			Z = 5
		}
		<icon_id> :SetTags selectable = 0 pos = <next_icon_pos>
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = White
			rgba = [0 0 0 255]
			pos = (<next_icon_pos> - (5.0, 5.0))
			scale = ((19 * <icon_scale> * (1.0, 0.0)) + (21 * <icon_scale> * (0.0, 1.0)))
		}
	else
		displaySprite {
			Id = <char_select_next_icon>
			PARENT = <char_select_parent_container>
			tex = Char_Select_Menu_Arrow
			pos = <next_icon_pos>
			Dims = <icon_dims>
		}
		if (<array_Size> > $g_cs_num_icons)
		else
			DoScreenElementMorph Id = <char_select_next_icon> Alpha = 0
		endif
	endif
	if (<Left>)
		if (<Player> = 2)
			icon_x = 80
			icon_y = 40
		else
			icon_x = -80
			icon_y = 40
		endif
		icon_pair = ((1.0, 0.0) * <icon_x> + (0.0, 1.0) * <icon_y>)
		<next_icon_pos> = (<next_icon_pos> + (<icon_pair> * <icon_scale>))
		if (<num_hilite_add> < $<char_select_icon>)
			<hilight_pos> = (<hilight_pos> + (<icon_pair> * <icon_scale>))
			<num_hilite_add> = (<num_hilite_add> + 1)
		endif
		<Left> = 0
	else
		if (<Player> = 2)
			icon_x = -80
			icon_y = 40
		else
			icon_x = 80
			icon_y = 40
		endif
		icon_pair = ((1.0, 0.0) * <icon_x> + (0.0, 1.0) * <icon_y>)
		<next_icon_pos> = (<next_icon_pos> + (<icon_pair> * <icon_scale>))
		if (<num_hilite_add> < $<char_select_icon>)
			<hilight_pos> = (<hilight_pos> + (<icon_pair> * <icon_scale>))
			<num_hilite_add> = (<num_hilite_add> + 1)
		endif
		<Left> = 1
	endif
	<I> = (<I> + 1)
	repeat ($g_cs_num_icons + 1)
	cs_load_characters starting_index = $<cs_jumped> Player = <Player>
	purpley = [240 220 255 255]
	orangey = [250 225 200 255]
	purpley_spotlight = [240 220 255 64]
	orangey_spotlight = [250 225 200 64]
	hilite_container_pos = (160.0, 50.0)
	if ($current_num_players = 2)
		if (<Player> = 1)
			<hilite_container_pos> = (160.0, 120.0)
		else
			<hilite_container_pos> = (955.0, 120.0)
		endif
	endif
	<hilite_container_pos> = (<hilite_container_pos> + <hilight_pos>)
	createScreenElement {
		Type = containerElement
		Id = <hilite_container>
		PARENT = root_window
		pos = <hilite_container_pos>
	}
	<hilite_container> :SetTags pos = <hilite_container_pos>
	formatText Checksumname = cs_jumped 'g_cs_jumped_p%d' D = <Player>
	flags = {}
	if (<Player> = 2)
		<flags> = {flip_v}
	endif
	formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = $<char_select_icon>
	get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon>) Player = <Player>
	get_musician_profile_struct Index = <Index>
	setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_on)
	getScreenElementDims Id = <icon_id>
	<icon_id> :SetProps Dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
	getScreenElementProps Id = <icon_id>
	<icon_id> :SetProps pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	<I> = 1
	begin
	formatText Checksumname = hilite_id 'cs_hilite%d_p%p' D = <I> P = <Player>
	if (<I> = 3)
		<I> = 2
	endif
	formatText Checksumname = hilite_tex 'Char_Select_Hilite%d' D = <I>
	hilite_rgba = [200 90 40 255]
	if (<Player> = 2)
		<hilite_rgba> = [180 130 220 255]
	endif
	displaySprite Id = <hilite_id> PARENT = <hilite_container> pos = (80.0, 40.0) tex = <hilite_tex> Dims = (<icon_scale> * (220.0, 220.0)) just = 0 Z = 49
	if (<I> = 1)
		<Id> :SetProps rgba = <hilite_rgba> Alpha = 0.66 Dims = (<icon_scale> * (180.0, 180.0))
	endif
	<I> = (<I> + 1)
	repeat 3
	if (<Player> = 1)
		player_number = "1"
		player_name_pos = (<cs_menu_pos> + (-180.0, -40.0))
		if ($is_network_game)
			player_name_pos = (<cs_menu_pos> + (-180.0, 0.0))
		endif
		player_title_pos = (<cs_menu_pos> + (-180.0, -30.0))
		player_title_num_pos = (<cs_menu_pos> + (-180.0, -30.0))
	else
		player_number = "2"
		player_name_pos = (<cs_menu_pos> + (655.0, -40.0))
		if ($is_network_game)
			player_name_pos = (<cs_menu_pos> + (655.0, 0.0))
		endif
		player_title_pos = (<cs_menu_pos> + (655.0, -30.0))
		player_title_num_pos = (<cs_menu_pos> + (655.0, -30.0))
	endif
	<icon_id> :getTags
	GetUppercaseString <char_name>
	if ($current_num_players = 1)
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<cs_menu_starting_pos> = (512.0, 110.0)
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_frame_cap
			pos = <cs_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_fill_cap
			pos = <cs_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_header_01
			pos = (<cs_menu_starting_pos> + (0.0, -40.0))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = [200 200 200 255]
			Z = 1
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_frame_body_tall
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 434.0)
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_fill_body_large
			pos = (<cs_menu_starting_pos> + (0.0, 32.0))
			Dims = (256.0, 434.0)
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_frame_cap
			pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			Dims = (256.0, 64.0)
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
			flip_h
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = window_fill_cap
			pos = (<cs_menu_starting_pos> + (0.0, 466.0))
			Dims = (256.0, 64.0)
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
			flip_h
		}
		displaySprite {
			PARENT = <char_select_parent_container>
			tex = Char_Select_Frame_BG
			pos = (507.0, 210.0)
			Dims = (266.0, 128.0)
			just = [Center Center]
			rgba = [250 250 200 255]
			Z = 1
		}
		displayText {
			PARENT = <char_select_parent_container>
			Text = "SELECT YOUR HERO"
			pos = (<cs_menu_starting_pos> + (0.0, 20.0))
			scale = (0.55, 0.55)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = [180 100 60 255]
			Z = 1
		}
		createScreenElement {
			Type = textElement
			Id = <cs_name_text>
			PARENT = <char_select_parent_container>
			just = [Center Center]
			pos = (506.0, 220.0)
			scale = 1
			Text = <UppercaseString>
			font = fontgrid_title_gh3
			rgba = [140 50 7 255]
			z_priority = 30
		}
		getScreenElementDims Id = <cs_name_text>
		if (<width> > 256)
			fit_text_in_rectangle Id = <cs_name_text> Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (506.0, 220.0)
		endif
		createScreenElement \{Type = containerElement PARENT = root_window Id = select_guitar_container pos = (510.0, 0.0)}
		get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
		get_musician_profile_struct Index = <Index>
		select_guitar_change_blurb_text {
			Text = (<profile_struct>.blurb)
			Dims = (388.0, 260.0)
			Z = 3
		}
	else
		name_just = [Left Center]
		if (<Player> = 2)
			<name_just> = [Right Center]
		endif
		displayText {
			Id = <cs_name_text>
			PARENT = <char_select_parent_container>
			Text = <UppercaseString>
			font = text_A5
			just = <name_just>
			pos = <player_name_pos>
			scale = 1
			rgba = [233 233 233 255]
			z_priority = 3
		}
		getScreenElementDims Id = <cs_name_text>
		if (<width> > 400)
			fit_text_in_rectangle Id = <cs_name_text> Dims = (400.0, 50.0) pos = (<cs_menu_pos> + (274.0, -14.0)) just = Left
		endif
		if ($is_network_game)
			if (<Player> = 1)
				if (NetSessionfunc Obj = match func = get_gamertag)
					<player_identifier> = <Name>
				endif
				Color = ($player1_color)
				gt_pos = (235.0, 50.0)
				gt_just = [Left top]
			else
				<player_identifier> = ($opponent_gamertag)
				Color = ($player2_color)
				gt_pos = (1045.0, 50.0)
				gt_just = [Right top]
			endif
			if ($player2_present = 1)
				ui_print_gamertags \{pos1 = (235.0, 50.0) pos2 = (1045.0, 50.0) Dims = (450.0, 35.0) just1 = [Left top] just2 = [Right top]}
			else
				ui_print_gamertag Name = <player_identifier> start_pos = <gt_pos> Color = <Color> Player = <Player> just = (<gt_just>) Dims = (450.0, 35.0)
			endif
		else
			formatText Checksumname = player_text_id 'player%a_text' A = <Player>
			player_text_just = [Left top]
			if (<Player> = 2)
				<player_text_just> = [Right top]
			endif
			displayText {
				Id = <player_text_id>
				PARENT = <char_select_parent_container>
				Text = "PLAYER"
				font = fontgrid_title_gh3
				just = <player_text_just>
				pos = <player_title_pos>
				scale = 0.75
				rgba = <purpley>
				z_priority = 3
			}
			if (<Player> = 1)
				getScreenElementDims Id = <player_text_id>
				<player_title_num_pos> = (<player_title_num_pos> + <width> * (1.0, 0.0) + (10.0, 0.0))
			endif
			displayText {
				PARENT = <char_select_parent_container>
				Text = <player_number>
				font = fontgrid_title_gh3
				just = <player_text_just>
				pos = <player_title_num_pos>
				scale = (1.0, 1.25)
				rgba = <purpley>
				z_priority = 3
			}
			if (<Player> = 2)
				getScreenElementDims Id = <Id>
				setScreenElementProps Id = <player_text_id> pos = (<player_title_num_pos> - <width> * (1.0, 0.0) - (10.0, 0.0))
			endif
		endif
	endif
	createScreenElement {
		Type = containerElement
		Id = <char_select_character_container>
		PARENT = root_window
		pos = (0.0, 0.0)
	}
	if compositeObjectexists \{Name = GUITARIST}
		GUITARIST :handle_change_stance \{stance = stance_FrontEnd}
	endif
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :handle_change_stance \{stance = stance_FrontEnd}
	endif
	formatText Checksumname = spawnedscript 'cs_rotate_hilites_p%d' D = <Player>
	SpawnScriptNOw <spawnedscript>
	cs_get_total_guitarists Player = <Player>
	formatText Checksumname = total_guitarists 'cs_total_guitarists_p%i' I = <Player>
	Change globalName = <total_guitarists> NewValue = <num_guitarists>
	Change globalName = <safe_to_scroll> NewValue = 1
	if ($current_num_players = 1)
		get_current_first_play
		if (<first_play>)
			launchevent \{Type = focus Target = vmenu_character_select_p1}
		endif
	endif
	Change \{menu_flow_locked = 0}
	if (<Player> = 1)
		launchevent \{Type = focus Target = vmenu_character_select_p1}
	else
		launchevent \{Type = focus Target = vmenu_character_select_p2}
	endif
	if gotParam \{blah}
		if ($net_can_send_approval = 1)
			if ($is_network_game = 1 && <Player> = 1)
				net_lobby_state_message \{current_state = character_hub action = approval}
			endif
			Change \{net_can_send_approval = 0}
		endif
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
		Change \{gIsInNetGame = 1}
	endif
endscript

script destroy_character_select_menu 
	Change \{menu_flow_locked = 1}
	if (<Player> = 1)
		killspawnedScript \{Name = cs_rotate_hilites_p1}
		Change \{g_cs_scroll_ready_p1 = 1}
		Change \{g_cs_choose_ready_p1 = 0}
		destroy_menu \{menu_id = char_select_character_container_p1}
		destroy_menu \{menu_id = char_select_container_p1}
		destroy_menu \{menu_id = char_select_hilite_container_p1}
		destroy_menu \{menu_id = scrolling_character_select_p1}
		killspawnedScript \{Name = select_guitar_scroll_instrument_info}
		destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		destroy_menu \{menu_id = select_guitar_container}
		if ScreenelementExists \{Id = menu_container}
			DestroyScreenelement \{Id = menu_container}
		endif
	else
		killspawnedScript \{Name = cs_rotate_hilites_p2}
		Change \{g_cs_scroll_ready_p2 = 1}
		Change \{g_cs_choose_ready_p2 = 0}
		destroy_menu \{menu_id = char_select_character_container_p2}
		destroy_menu \{menu_id = char_select_container_p2}
		destroy_menu \{menu_id = char_select_hilite_container_p2}
		destroy_menu \{menu_id = scrolling_character_select_p2}
	endif
	Change \{menu_flow_locked = 0}
endscript

script cs_check_if_new_page \{Dir = Down}
	if (<Dir> = Down)
		if ($<icon_index> + 1 >= $g_cs_num_icons)
			if (<total_guitarists> > $<icon_index> + 1)
				return \{cs_go_new_page = 1}
			endif
		endif
	else
		if ($<icon_index> - 1 < 0)
			return \{cs_go_new_page = 1}
		endif
	endif
	return \{cs_go_new_page = 0}
endscript

script cs_scroll_up_or_down \{Player = 1 Dir = Down}
	formatText Checksumname = safe_to_scroll 'g_cs_safe_to_scroll_p%d' D = <Player>
	if (<safe_to_scroll> = 0)
		return
	endif
	formatText Checksumname = scroll_ready 'g_cs_scroll_ready_p%d' D = <Player>
	formatText Checksumname = char_select_icon_index 'g_character_select_icon_index_p%d' D = <Player>
	formatText Checksumname = cs_jumped 'g_cs_jumped_p%d' D = <Player>
	formatText Checksumname = hilite_container 'char_select_hilite_container_p%d' D = <Player>
	formatText Checksumname = cs_name_text 'cs_name_text_p%d' D = <Player>
	formatText Checksumname = cs_last_guitarist 'g_cs_last_guitarist_p%d' D = <Player>
	formatText Checksumname = total_num_guitarists 'cs_total_guitarists_p%i' I = <Player>
	if NOT ($<scroll_ready>)
		return
	endif
	if (<Player> = 1)
		if ($g_cs_choose_ready_p1)
			return
		endif
	else
		if ($g_cs_choose_ready_p2)
			return
		endif
	endif
	Change \{g_cs_hilite_rot1 = 360.0}
	Change \{g_cs_hilite_rot2 = 180.0}
	cs_check_if_new_page Dir = <Dir> icon_index = $<char_select_icon_index> total_guitarists = ($<total_num_guitarists>)
	if (<Dir> = Down)
		pos_or_neg_one = 1
	else
		pos_or_neg_one = -1
	endif
	flags = {}
	if (<Player> = 2)
		<flags> = {flip_v}
	endif
	if (<cs_go_new_page>)
		old_icon_index = $<char_select_icon_index>
		old_jumped = $<cs_jumped>
		if (<Dir> = Up)
			if ($<cs_jumped> > 0)
				Change globalName = <cs_jumped> NewValue = ($<cs_jumped> - $g_cs_num_icons)
				Change globalName = <char_select_icon_index> NewValue = 12
			else
				return
			endif
		else
			Change globalName = <cs_jumped> NewValue = ($<cs_jumped> + $g_cs_num_icons)
			Change globalName = <char_select_icon_index> NewValue = 0
		endif
		formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = <old_icon_index>
		if ScreenelementExists Id = <icon_id>
			get_valid_character_index char_index = (<old_jumped> + <old_icon_index>) Player = <Player>
			get_musician_profile_struct Index = <Index>
			setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_off)
			getScreenElementDims Id = <icon_id>
			<icon_id> :SetProps Dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
			getScreenElementProps Id = <icon_id>
			<icon_id> :SetProps pos = (<pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		generic_menu_up_or_down_sound <Dir>
		cs_load_characters starting_index = $<cs_jumped> Player = <Player>
		formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = $<char_select_icon_index>
		if ScreenelementExists Id = <icon_id>
			get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
			get_musician_profile_struct Index = <Index>
			setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_on)
			getScreenElementDims Id = <icon_id>
			<icon_id> :SetProps Dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
			getScreenElementProps Id = <icon_id>
			<icon_id> :SetProps pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
		endif
		formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = ($<char_select_icon_index>)
		if ScreenelementExists Id = <icon_id>
			<icon_id> :getTags
		endif
		<pos> = (<pos> - (50.0, 10.0))
		setScreenElementProps Id = <hilite_container> pos = <pos>
		<hilite_container> :SetTags pos = <pos>
		GetUppercaseString <char_name>
		setScreenElementProps Id = <cs_name_text> Text = <UppercaseString>
		getScreenElementDims Id = <cs_name_text>
		if (<width> > 256)
			if ($current_num_players = 1)
				fit_text_in_rectangle Id = <cs_name_text> Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (506.0, 220.0)
			endif
		else
			<cs_name_text> :SetProps scale = 1
		endif
		character_select_menu_highlight_name Player = <Player> musician_index = <char_array_index>
		if ($current_num_players = 1)
			get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
			get_musician_profile_struct Index = <Index>
			select_guitar_change_blurb_text {
				Text = (<profile_struct>.blurb)
				Dims = (388.0, 260.0)
				Z = 3
			}
		endif
		formatText Checksumname = killedscript 'cs_rotate_hilites_p%d' D = <Player>
		killspawnedScript Name = <killedscript>
		SpawnScriptNOw <killedscript>
		if ((($is_network_game) = 1) && (<Player> = 1) && ($player2_present))
			network_player_lobby_message {
				Type = character_select
				action = update
				value1 = (<pos_or_neg_one> + 1)
				Checksum = ($player1_status.character_id)
			}
		endif
		return
	endif
	if (<Dir> = Down)
		if (($<char_select_icon_index> + $<cs_jumped>) >= (($<total_num_guitarists>) -1))
			return
		endif
	else
		if (($<char_select_icon_index>) < 1)
			return
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = $<char_select_icon_index>
	if ScreenelementExists Id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
		get_musician_profile_struct Index = <Index>
		setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_off)
		getScreenElementDims Id = <icon_id>
		<icon_id> :SetProps Dims = (($g_cs_select_normal_w * (1.0, 0.0)) + ($g_cs_select_normal_h * (0.0, 1.0))) z_priority = 5
		getScreenElementProps Id = <icon_id>
		<icon_id> :SetProps pos = (<pos> - ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = ($<char_select_icon_index> + <pos_or_neg_one>)
	if ScreenelementExists Id = <icon_id>
		<icon_id> :getTags
	endif
	if ((($is_network_game) = 1) && (<Player> = 1) && ($player2_present))
		network_player_lobby_message {
			Type = character_select
			action = update
			value1 = (<pos_or_neg_one> + 1)
			Checksum = ($player1_status.character_id)
		}
	endif
	Change globalName = <char_select_icon_index> NewValue = ($<char_select_icon_index> + <pos_or_neg_one>)
	<pos> = (<pos> - (50.0, 10.0))
	setScreenElementProps Id = <hilite_container> pos = <pos>
	<hilite_container> :SetTags pos = <pos>
	formatText Checksumname = icon_id 'cs_icon_p%p_id_%d' P = <Player> D = $<char_select_icon_index>
	if ScreenelementExists Id = <icon_id>
		get_valid_character_index char_index = ($<cs_jumped> + $<char_select_icon_index>) Player = <Player>
		get_musician_profile_struct Index = <Index>
		setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_on)
		getScreenElementDims Id = <icon_id>
		<icon_id> :SetProps Dims = ($g_cs_select_extra_w * (1.0, 0.0) + $g_cs_select_extra_h * (0.0, 1.0)) z_priority = 50
		getScreenElementProps Id = <icon_id>
		<icon_id> :SetProps pos = (<pos> + ($g_cs_select_extra_h * 0.05) * (0.0, 1.0)) <flags>
	endif
	GetUppercaseString <char_name>
	setScreenElementProps Id = <cs_name_text> Text = <UppercaseString>
	getScreenElementDims Id = <cs_name_text>
	if (<width> > 256)
		if ($current_num_players = 1)
			fit_text_in_rectangle Id = <cs_name_text> Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (506.0, 220.0)
		endif
	else
		<cs_name_text> :SetProps scale = 1
	endif
	if ScreenelementExists Id = <icon_id>
		<icon_id> :getTags
	endif
	character_select_menu_highlight_name Player = <Player> musician_index = <char_array_index>
	if ($current_num_players = 1)
		get_valid_character_index char_index = ($g_character_select_icon_index_p1) Player = <Player>
		get_musician_profile_struct Index = <Index>
		select_guitar_change_blurb_text {
			Text = (<profile_struct>.blurb)
			Dims = (388.0, 260.0)
			Z = 3
		}
	endif
	formatText Checksumname = killedscript 'cs_rotate_hilites_p%d' D = <Player>
	killspawnedScript Name = <killedscript>
	SpawnScriptNOw <killedscript>
endscript

script cs_rotate_hilites_p1 \{Time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setScreenElementProps \{Id = cs_hilite2_p1 Rot_Angle = 0 Alpha = 0}
	setScreenElementProps \{Id = cs_hilite3_p1 Rot_Angle = 0 Alpha = 0}
	begin
	I = 1
	begin
	if ScreenelementExists \{Id = cs_hilite2_p1}
		DoScreenElementMorph Id = cs_hilite2_p1 Rot_Angle = <rot1> Alpha = <alpha1> Time = <Time>
	endif
	if ScreenelementExists \{Id = cs_hilite3_p1}
		DoScreenElementMorph Id = cs_hilite3_p1 Rot_Angle = <rot2> Alpha = <alpha2> Time = <Time>
	endif
	<I> = (<I> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	Wait <Time> Seconds
	repeat
endscript

script cs_rotate_hilites_p2 \{Time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setScreenElementProps \{Id = cs_hilite2_p2 Rot_Angle = 0 Alpha = 0}
	setScreenElementProps \{Id = cs_hilite3_p2 Rot_Angle = 0 Alpha = 0}
	begin
	I = 1
	begin
	if ScreenelementExists \{Id = cs_hilite2_p2}
		DoScreenElementMorph Id = cs_hilite2_p2 Rot_Angle = <rot1> Alpha = <alpha1> Time = <Time>
	endif
	if ScreenelementExists \{Id = cs_hilite3_p2}
		DoScreenElementMorph Id = cs_hilite3_p2 Rot_Angle = <rot2> Alpha = <alpha2> Time = <Time>
	endif
	<I> = (<I> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	Wait <Time> Seconds
	repeat
endscript

script get_valid_character_index_reverse \{Index = 0}
	search_index = <Index>
	char_index = 0
	begin
	if NOT get_valid_character_index char_index = <char_index> Player = <Player>
		break
	endif
	if (<search_index> = <Index>)
		return char_index = <char_index> TRUE
	endif
	char_index = (<char_index> + 1)
	repeat
	return \{char_index = 0 FALSE}
endscript

script get_valid_character_index \{char_index = 0 Player = 1}
	download_characters = 0
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	Printf "Considering %i %s" I = <Index> S = (<profile_struct>.musician_body.desc_id)
	valid = 1
	if NOT ($is_network_game = 1 && <Player> = 2)
		if NOT is_musician_profile_downloaded Index = <Index>
			valid = 0
		endif
	else
		if is_musician_profile_downloaded Index = <Index>
			if (<Download> = 1)
				if getglobaltags (<profile_struct>.musician_body.desc_id) noassert = 1
					if (<available_on_other_client> = 0)
						Printf \{"Not valid because it's download content which isn't available on other client"}
						valid = 0
					else
						download_characters = (<download_characters> + 1)
					endif
				endif
			endif
		endif
	endif
	if structureContains Structure = (<profile_struct>) debug_only
		Printf \{"Not valid because it's debug only"}
		valid = 0
	endif
	if NOT (<profile_struct>.Type = GUITARIST)
		Printf \{"Not valid because it's no guitarist"}
		valid = 0
	endif
	if NOT ($is_network_game = 1 && <Player> = 2)
		unlocked = 1
		if getglobaltags (<profile_struct>.musician_body.desc_id) noassert = 1
			if (<unlocked> = 0)
				valid = 0
			endif
		endif
	else
		unlocked_on_other_client = 1
		if getglobaltags (<profile_struct>.musician_body.desc_id) noassert = 1
			if (<unlocked_on_other_client> = 0)
				Printf \{"Not valid because it's not unlocked on other client"}
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		if (<char_index> = 0)
			if NOT is_musician_profile_downloaded Index = <Index>
				return \{Index = 0 TRUE}
			else
				return Index = <Index> TRUE
			endif
		endif
		char_index = (<char_index> - 1)
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
	if ($is_network_game = 1 && <Player> = 2)
		num_extra_chars = ($download_characters_on_other_client - <download_characters>)
		Printf "Additional characters %n" N = <num_extra_chars>
		if (<num_extra_chars> > 0)
			begin
			if (<char_index> = 0)
				return \{Index = 0 TRUE}
			endif
			char_index = (<char_index> - 1)
			repeat (<num_extra_chars>)
		endif
	endif
	Printf \{"Not found!"}
	return \{FALSE}
endscript

script character_select_choose 
	if (<Player> = 1)
		char_index = ($g_cs_jumped_p1 + $g_character_select_icon_index_p1)
		get_valid_character_index char_index = <char_index> Player = <Player>
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = character_id '%s' S = (<profile_struct>.Name)
		Change StructureName = player1_status character_id = <character_id>
		if (($is_network_game = 1) && ($player2_present))
			network_player_lobby_message {
				Type = character_select
				action = Select
				value1 = ($character_select_highlighted_character_p1)
			}
		endif
	else
		char_index = ($g_cs_jumped_p2 + $g_character_select_icon_index_p2)
		get_valid_character_index char_index = <char_index> Player = <Player>
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = character_id '%s' S = (<profile_struct>.Name)
		Change StructureName = player2_status character_id = <character_id>
	endif
	ui_flow_manager_respond_to_action action = Continue create_params = {Player = <Player>} Player = <Player>
endscript

script cs_load_characters \{starting_index = $g_cs_jumped_p1 Player = 1}
	cs_get_total_guitarists Player = <Player>
	remaining = (<num_guitarists> - <starting_index>)
	if (<remaining> > $g_cs_num_icons)
		<remaining> = $g_cs_num_icons
		if (<Player> = 2)
			DoScreenElementMorph \{Id = cs_icon_id_next_p2 Alpha = 1}
		else
			DoScreenElementMorph \{Id = cs_icon_id_next_p1 Alpha = 1}
		endif
	else
		if (<Player> = 2)
			DoScreenElementMorph \{Id = cs_icon_id_next_p2 Alpha = 0}
		else
			DoScreenElementMorph \{Id = cs_icon_id_next_p1 Alpha = 0}
		endif
	endif
	if (<starting_index> > 0)
		if (<Player> = 2)
			DoScreenElementMorph \{Id = cs_icon_id_prev_p2 Alpha = 1}
		else
			DoScreenElementMorph \{Id = cs_icon_id_prev_p1 Alpha = 1}
		endif
	else
		if (<Player> = 2)
			DoScreenElementMorph \{Id = cs_icon_id_prev_p2 Alpha = 0}
		else
			DoScreenElementMorph \{Id = cs_icon_id_prev_p1 Alpha = 0}
		endif
	endif
	cs_reset_selectables Player = <Player>
	char_index = 0
	begin
	get_valid_character_index char_index = (<char_index> + <starting_index>) Player = <Player>
	get_musician_profile_struct Index = <Index>
	if (<Player> = 1)
		formatText Checksumname = icon_id 'cs_icon_p1_id_%d' D = <char_index>
		elseif (<Player> = 2)
		formatText Checksumname = icon_id 'cs_icon_p2_id_%d' D = <char_index>
	endif
	if ScreenelementExists Id = <icon_id>
		flags = {}
		if (<Player> = 2)
			<flags> = {flip_v}
		endif
		setScreenElementProps Id = <icon_id> texture = (<profile_struct>.icon_off) <flags>
		if structureContains Structure = (<profile_struct>) fullname
			character_name = (<profile_struct>.fullname)
		else
			character_name = (<profile_struct>.Name)
		endif
		<icon_id> :SetTags {
			selectable = 1
			char_name = <character_name>
			char_array_index = (<char_index> + <starting_index>)
		}
	endif
	char_index = (<char_index> + 1)
	repeat <remaining>
endscript

script cs_reset_selectables \{Player = 1}
	I = 0
	begin
	if (<Player> = 1)
		formatText Checksumname = icon_id 'cs_icon_p1_id_%d' D = <I>
		if ScreenelementExists Id = <icon_id>
			setScreenElementProps Id = <icon_id> texture = Char_Select_Default
			<icon_id> :SetTags selectable = 0
		endif
	else
		formatText Checksumname = icon_id 'cs_icon_p2_id_%d' D = <I>
		if ScreenelementExists Id = <icon_id>
			setScreenElementProps Id = <icon_id> texture = Char_Select_Default
			<icon_id> :SetTags selectable = 0
		endif
	endif
	<I> = (<I> + 1)
	repeat $g_cs_num_icons
endscript

script cs_set_containers_above_or_below \{Player = 1}
	formatText Checksumname = next_icon_pos 'next_icon_pos_p%d' D = <Player>
	formatText Checksumname = hilite_container 'char_select_hilite_container_p%d' D = <Player>
	formatText Checksumname = char_select_container 'char_select_container_p%d' D = <Player>
	if gotParam \{above}
		if (<Player> = 1)
			<next_icon_pos> = (155.0, 540.0)
		else
			<next_icon_pos> = (960.0, 550.0)
		endif
		setScreenElementProps Id = <char_select_container> pos = (0.0, -720.0)
		<char_select_container> :SetTags pos = (0.0, -720.0)
		setScreenElementProps Id = <hilite_container> pos = (<next_icon_pos> - (0.0, 720.0))
		<hilite_container> :SetTags pos = (<next_icon_pos> - (0.0, 720.0))
	else
		if (<Player> = 1)
			<next_icon_pos> = (155.0, 50.0)
		else
			<next_icon_pos> = (955.0, 60.0)
		endif
		setScreenElementProps Id = <char_select_container> pos = (0.0, 720.0)
		<char_select_container> :SetTags pos = (0.0, 720.0)
		setScreenElementProps Id = <hilite_container> pos = (<next_icon_pos> + (0.0, 720.0))
		<hilite_container> :SetTags pos = (<next_icon_pos> + (0.0, 720.0))
	endif
endscript

script cs_get_total_guitarists 
	array_entry = 0
	begin
	if NOT get_valid_character_index char_index = <array_entry> Player = <Player>
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_guitarists = <array_entry>
endscript

script character_select_menu_highlight_name \{Player = 1}
	if (<Player> = 1)
		Change character_select_highlighted_character_p1 = <musician_index>
		get_valid_character_index char_index = <musician_index> Player = <Player>
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = character_id '%s' S = (<profile_struct>.Name)
	else
		Change character_select_highlighted_character_p2 = <musician_index>
		get_valid_character_index char_index = <musician_index> Player = <Player>
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = character_id '%s' S = (<profile_struct>.Name)
	endif
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if NOT (<character_id> = $<player_status>.character_id)
		Change StructureName = <player_status> character_id = <character_id>
		if find_profile_by_id Id = <character_id>
			get_musician_profile_struct Index = <Index>
			formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
			if getglobaltags <default_characterguitartag> noassert = 1
				if (<current_instrument> = GUITAR)
					<inst_id> = <current_selected_guitar>
				else
					if NOT ($game_mode = p2_career)
						setGlobalTags <default_characterguitartag> Params = {current_instrument = GUITAR}
						<inst_id> = <current_selected_guitar>
					else
						<inst_id> = <current_selected_bass>
					endif
				endif
				Change StructureName = <player_status> instrument_id = <inst_id>
				Change StructureName = <player_status> outfit = <current_outfit>
				Change StructureName = <player_status> style = <current_style>
			endif
		endif
		formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change globalName = <change_flag> NewValue = 1
	endif
endscript
