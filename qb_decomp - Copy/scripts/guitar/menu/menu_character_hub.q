g_hub_destroy = 0
g_hub_created = 0
g_hub_helpers_created = 0
g_hub_characters_dirty = 1

script set_character_hub_dirty 
	Change \{g_hub_characters_dirty = 1}
endscript

script do_character_hub_dirty 
	<Player> = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	if find_profile_by_id Id = ($<player_status>.character_id)
		get_musician_profile_struct Index = <Index>
		formatText Checksumname = default_characterguitartag 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
		if getglobaltags <default_characterguitartag> noassert = 1
			Printf <current_instrument>
			Printf \{$game_mode}
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
	<Player> = 2
	repeat 2
	create_guitarist \{Name = GUITARIST useOldPos no_strum animpak = 0}
	create_guitarist \{Name = BASSIST useOldPos no_strum animpak = 0}
	if ($current_num_players = 1)
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
	if (($is_network_game = 1) && ($player2_present = 0))
		if compositeObjectexists Name = ($player2_status.band_Member)
			($player2_status.band_Member) :Hide
		endif
	endif
	Change \{g_hub_characters_dirty = 0}
endscript

script create_character_hub_menu \{Player = 1}
	if ($g_hub_characters_dirty)
		do_character_hub_dirty
	endif
	Change \{menu_flow_locked = 1}
	if (<Player> = 1)
		Change \{p1_ready = 0}
	else
		Change \{p2_ready = 0}
	endif
	exclusive_dev = $player1_device
	if (<Player> = 2)
		if (($is_network_game) = 0)
			<exclusive_dev> = $player2_device
		else
			<exclusive_dev> = $primary_controller
		endif
	else
		if (($is_network_game) = 1)
			<exclusive_dev> = $primary_controller
		endif
		if ($num_user_control_helpers = 0)
			add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
			add_user_control_helper \{Text = "BACK" button = Red Z = 100}
			add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
			Change \{g_hub_helpers_created = 1}
		endif
	endif
	event_handlers = [
		{pad_up character_hub_generic_sound Params = {Player = <Player> Up}}
		{pad_down character_hub_generic_sound Params = {Player = <Player> Down}}
		{pad_back character_hub_go_back Params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if ($is_network_game)
		event_handlers = [
			{pad_up character_hub_generic_sound Params = {Player = <Player> Up}}
			{pad_down character_hub_generic_sound Params = {Player = <Player> Down}}
			{pad_back net_request_play_show Params = {action = 0}}
			{pad_start menu_show_gamercard}
		]
		net_info_panel_show
	endif
	menu_pos_tweak = (0.0, 0.0)
	if (<Player> = 1)
		if (($is_network_game) = 1)
			menu_pos_tweak = (-65.0, 0.0)
		endif
		if ($current_num_players = 2)
			<Menu_pos> = (360.0, 444.0)
			if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
				<Menu_pos> = (<Menu_pos> + (0.0, -46.0))
			endif
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 Menu_pos = (<Menu_pos> + <menu_pos_tweak>) exclusive_device = <exclusive_dev> event_handlers = <event_handlers> no_focus = 1
		else
			new_menu scrollid = scrolling_character_hub_p1 vmenuid = vmenu_character_hub_p1 use_backdrop = 0 Menu_pos = (350.0, 172.0) event_handlers = <event_handlers> no_focus = 1
		endif
		vparent = vmenu_character_hub_p1
		continue_id = character_hub_p1_continue
		ch_change_char_id = ch_change_char_id_p1
		ch_change_outfit_id = ch_change_outfit_id_p1
		ch_change_guitar_id = ch_change_guitar_id_p1
		ch_change_bass_id = ch_change_bass_id_p1
		createScreenElement {
			Type = containerElement
			PARENT = root_window
			Id = character_hub_p1_container
			just = [Left top]
			pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos1 = (400.0, 500.0) parent1 = character_hub_p1_container}
		if ($is_network_game)
			if NOT (ScreenelementExists Id = ready_container_p2)
				create_ready_icons \{pos2 = (825.0, 450.0) parent2 = root_window}
			endif
		endif
	else
		<Menu_pos> = (710.0, 444.0)
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<Menu_pos> = (<Menu_pos> + (0.0, -46.0))
		endif
		if (($is_network_game) = 1)
			menu_pos_tweak = (75.0, 0.0)
		endif
		new_menu scrollid = scrolling_character_hub_p2 vmenuid = vmenu_character_hub_p2 use_backdrop = 0 Menu_pos = (<Menu_pos> + <menu_pos_tweak>) exclusive_device = <exclusive_dev> event_handlers = <event_handlers> no_focus = 1
		vparent = vmenu_character_hub_p2
		continue_id = character_hub_p2_continue
		ch_change_char_id = ch_change_char_id_p2
		ch_change_outfit_id = ch_change_outfit_id_p2
		ch_change_guitar_id = ch_change_guitar_id_p2
		ch_change_bass_id = ch_change_bass_id_p2
		if (($is_network_game) = 1)
			launchevent \{Type = unfocus Target = vmenu_character_hub_p2}
		endif
		createScreenElement {
			Type = containerElement
			PARENT = root_window
			Id = character_hub_p2_container
			just = [Left top]
			pos = ((0.0, 0.0) + <menu_pos_tweak>)
		}
		create_ready_icons \{pos2 = (746.0, 500.0) parent2 = character_hub_p2_container}
	endif
	setup_character_hub Player = <Player>
	show_change_outfit = 1
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	if NOT structureContains Structure = (<profile_struct>) outfits
		<show_change_outfit> = 0
	endif
	if ($current_num_players = 2)
		if (<Player> = 1)
			myparent = character_hub_p1_container
		else
			myparent = character_hub_p2_container
		endif
		<ch_focus_color> = [125 0 0 255]
		<ch_unfocus_color> = [180 100 60 255]
		displaySprite {
			PARENT = <myparent>
			tex = character_hub_hilite_bookend
			Dims = (24.0, 24.0)
			just = [Left top]
			rgba = [255 255 205 255]
			Z = 4
		}
		<bookEnd1ID> = <Id>
		displaySprite {
			PARENT = <myparent>
			tex = character_hub_hilite_bookend
			Dims = (24.0, 24.0)
			just = [Right top]
			rgba = [255 255 205 255]
			Z = 4
		}
		<bookEnd2ID> = <Id>
		displaySprite {
			PARENT = <myparent>
			tex = White
			just = [Left top]
			rgba = [255 255 205 255]
			Dims = (264.0, 32.0)
			pos = (226.0, 136.0)
			Z = 2
		}
		<whiteTexHighlightID> = <Id>
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		if (<Player> = 1)
			<hub_menu_starting_pos> = (460.0, 432.0)
		else
			<hub_menu_starting_pos> = (810.0, 432.0)
		endif
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<hub_menu_starting_pos> = (<hub_menu_starting_pos> + (0.0, -46.0))
		endif
		displaySprite {
			PARENT = <myparent>
			tex = window_frame_cap
			pos = <hub_menu_starting_pos>
			Dims = (256.0, 40.0)
			just = [Center Center]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = <myparent>
			tex = window_fill_cap
			pos = <hub_menu_starting_pos>
			Dims = (256.0, 40.0)
			just = [Center Center]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = <myparent>
			tex = window_header_01
			pos = (<hub_menu_starting_pos> + (0.0, -40.0))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = [200 200 200 255]
			Z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 154.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 174.0))
		else
			<mid_section_dims> = (256.0, 114.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (0.0, 134.0))
		endif
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<mid_section_dims> = (<mid_section_dims> + (0.0, 46.0))
			<bottom_cap_pos> = (<bottom_cap_pos> + (0.0, 46.0))
		endif
		displaySprite {
			PARENT = <myparent>
			tex = window_frame_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			Dims = <mid_section_dims>
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = <myparent>
			tex = window_fill_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 20.0))
			Dims = <mid_section_dims>
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = <myparent>
			tex = window_frame_cap
			pos = <bottom_cap_pos>
			Dims = (256.0, 40.0)
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
			flip_h
		}
		displaySprite {
			PARENT = <myparent>
			tex = window_fill_cap
			pos = <bottom_cap_pos>
			Dims = (256.0, 40.0)
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
			flip_h
		}
		<ch_menuItemSelected> = 0
		<ch_show_change_outfit> = 0
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			Id = <continue_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "PLAY SHOW"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus setScreenElementProps Params = {Id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus setScreenElementProps Params = {Id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_play_show Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		if (($is_network_game) = 1)
			net_event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus setScreenElementProps Params = {Id = <continue_id> rgba = <ch_focus_color>}}
				{unfocus setScreenElementProps Params = {Id = <continue_id> rgba = <ch_unfocus_color>}}
				{pad_choose net_request_play_show Params = {action = 1}}
				{pad_start menu_show_gamercard}
			]
			<continue_id> :SetProps Text = "Ready" rgba = [128 128 128 255] event_handlers = <net_event_handlers> Replace_Handlers block_events
			if (($player2_present) = 1)
				<continue_id> :SetProps rgba = [180 100 60 255] unblock_events
			endif
		endif
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			Id = <ch_change_char_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "CHANGE CHARACTER"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <ch_show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus setScreenElementProps Params = {Id = <ch_change_char_id> rgba = <ch_focus_color>}}
				{unfocus setScreenElementProps Params = {Id = <ch_change_char_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_go_back Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<ch_show_change_outfit> = 1
			createScreenElement {
				Type = textElement
				PARENT = <vparent>
				Id = <ch_change_outfit_id>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				Text = "CHANGE OUTFIT"
				just = [Center top]
				event_handlers = [
					{focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{focus setScreenElementProps Params = {Id = <ch_change_outfit_id> rgba = <ch_focus_color>}}
					{unfocus setScreenElementProps Params = {Id = <ch_change_outfit_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_outfit Params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			Id = <ch_change_guitar_id>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "CHANGE GUITAR"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <ch_show_change_outfit>
						chh_mp = 1
						chh_player = <Player>
					}
				}
				{focus setScreenElementProps Params = {Id = <ch_change_guitar_id> rgba = <ch_focus_color>}}
				{unfocus setScreenElementProps Params = {Id = <ch_change_guitar_id> rgba = <ch_unfocus_color>}}
				{pad_choose character_hub_select_change_guitar Params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			createScreenElement {
				Type = textElement
				PARENT = <vparent>
				Id = <ch_change_bass_id>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				Text = "CHANGE BASS"
				just = [Center top]
				event_handlers = [
					{focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <ch_show_change_outfit>
							chh_mp = 1
							chh_player = <Player>
						}
					}
					{focus setScreenElementProps Params = {Id = <ch_change_bass_id> rgba = <ch_focus_color>}}
					{unfocus setScreenElementProps Params = {Id = <ch_change_bass_id> rgba = <ch_unfocus_color>}}
					{pad_choose character_hub_select_change_guitar Params = {Player = <Player> BASS vparent = <vparent>}}
					{pad_start menu_show_gamercard}
				]
				exclusive_device = <exclusive_dev>
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
	else
		set_focus_color \{rgba = [125 0 0 255]}
		set_unfocus_color \{rgba = [180 100 60 255]}
		displaySprite \{PARENT = character_hub_p1_container tex = character_hub_hilite_bookend pos = (320.0, 175.0) Dims = (24.0, 24.0) just = [Left top] rgba = [255 255 205 255] Z = 4}
		<bookEnd1ID> = <Id>
		displaySprite \{PARENT = character_hub_p1_container tex = character_hub_hilite_bookend pos = (588.0, 175.0) Dims = (24.0, 24.0) just = [Right top] rgba = [255 255 205 255] Z = 4}
		<bookEnd2ID> = <Id>
		displaySprite \{PARENT = character_hub_p1_container tex = White rgba = [255 255 205 255] pos = (339.0, 171.0) Dims = (264.0, 32.0) just = [Left top] Z = 2}
		<whiteTexHighlightID> = <Id>
		<brown_window_color> = [120 60 10 255]
		<window_fill_color> = [0 0 0 200]
		<hub_menu_starting_pos> = (450.0, 140.0)
		displaySprite {
			PARENT = character_hub_p1_container
			tex = window_frame_cap
			pos = <hub_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = character_hub_p1_container
			tex = window_fill_cap
			pos = <hub_menu_starting_pos>
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = <window_fill_color>
			Z = 0
		}
		displaySprite {
			PARENT = character_hub_p1_container
			tex = window_header_01
			pos = (<hub_menu_starting_pos> + (0.0, -40.0))
			Dims = (256.0, 64.0)
			just = [Center Center]
			rgba = [200 200 200 255]
			Z = 1
		}
		if (<show_change_outfit>)
			<mid_section_dims> = (256.0, 328.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 360.0))
		else
			<mid_section_dims> = (256.0, 282.0)
			<bottom_cap_pos> = (<hub_menu_starting_pos> + (1.0, 314.0))
		endif
		<mid_section_dims> = (<mid_section_dims> + (0.0, 100.0))
		displaySprite {
			PARENT = character_hub_p1_container
			tex = window_frame_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 32.0))
			Dims = <mid_section_dims>
			just = [Center top]
			rgba = <brown_window_color>
			Z = 0
		}
		displaySprite {
			PARENT = character_hub_p1_container
			tex = window_fill_body_short
			pos = (<hub_menu_starting_pos> + (0.0, 32.0))
			Dims = <mid_section_dims>
			just = [Center top]
			rgba = <window_fill_color>
			Z = 0
		}
		createScreenElement {
			Type = spriteElement
			PARENT = character_hub_p1_container
			pos = <bottom_cap_pos>
			Dims = (242.0, 128.0)
			just = [Center top]
			texture = store_frame_bottom_bg
			z_priority = 1
			rgba = <brown_window_color>
			flip_h
			flip_v
		}
		get_current_band_info
		getglobaltags <band_info>
		formatText Textname = user_cash_amount "$%d" D = (<Cash>) useCommas
		createScreenElement {
			Type = textElement
			PARENT = character_hub_p1_container
			pos = (<bottom_cap_pos> + (0.0, 53.0))
			font = text_a4
			Text = <user_cash_amount>
			rgba = [255 255 205 250]
			z_priority = 2
			just = [Center Center]
		}
		<ch_menuItemSelected> = 0
		<ch_show_change_outfit> = 0
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "PLAY SHOW"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_play_show Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "CHANGE CHARACTER"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_go_back Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<ch_show_change_outfit> = 1
			createScreenElement {
				Type = textElement
				PARENT = <vparent>
				font = fontgrid_title_gh3
				scale = (0.8, 0.75)
				rgba = [180 100 60 255]
				Text = "CHANGE OUTFIT"
				just = [Center top]
				event_handlers = [
					{focus character_hub_highlighter Params = {
							menuItemNum = <ch_menuItemSelected>
							be1ID = <bookEnd1ID>
							be2ID = <bookEnd2ID>
							wthlID = <whiteTexHighlightID>
							comi = <ch_show_change_outfit>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose character_hub_select_change_outfit Params = {Player = <Player>}}
					{pad_start menu_show_gamercard}
				]
			}
			<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
			getScreenElementDims Id = <Id>
			fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		endif
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "CHANGE GUITAR"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
						comi = <ch_show_change_outfit>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose character_hub_select_change_guitar Params = {Player = <Player> vparent = <vparent>}}
				{pad_start menu_show_gamercard}
			]
		}
		<ch_menuItemSelected> = (<ch_menuItemSelected> + 1)
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if ($is_demo_mode = 1)
			demo_mode_disable = {rgba = [80 80 80 255] NOT_FOCUSABLE}
		else
			demo_mode_disable = {}
		endif
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = fontgrid_title_gh3
			scale = (0.8, 0.75)
			rgba = [180 100 60 255]
			Text = "VISIT STORE"
			just = [Center top]
			event_handlers = [
				{focus character_hub_highlighter Params = {
						menuItemNum = <ch_menuItemSelected>
						be1ID = <bookEnd1ID>
						be2ID = <bookEnd2ID>
						wthlID = <whiteTexHighlightID>
					}
				}
				{focus setScreenElementProps Params = {Id = ch_gc_logo rgba = [255 255 205 255]}}
				{unfocus retail_menu_unfocus}
				{unfocus setScreenElementProps Params = {Id = ch_gc_logo rgba = ($menu_unfocus_color)}}
				{pad_choose character_hub_select_the_store Params = {Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			<demo_mode_disable>
		}
		getScreenElementDims Id = <Id>
		fit_text_in_rectangle Id = <Id> Dims = ((160.0, 0.0) + (<Height> * (0.0, 0.75)))
		if (<show_change_outfit>)
			<logo_pos> = (450.0, 410.0)
		else
			<logo_pos> = (450.0, 365.0)
		endif
		createScreenElement {
			Type = spriteElement
			Id = ch_gc_logo
			PARENT = character_hub_p1_container
			pos = <logo_pos>
			texture = logo_guitarcenter_128
			rgba = [180 100 60 255]
			just = [Center top]
			Dims = (192.0, 96.0)
			Z = 0
		}
	endif
	Change \{g_hub_destroy = 0}
	if ($using_guitar_select_camera = 1)
		setScreenElementProps Id = <bookEnd1ID> Hide
		setScreenElementProps Id = <bookEnd2ID> Hide
		setScreenElementProps Id = <whiteTexHighlightID> Hide
		launchevent Type = unfocus Target = <vparent>
		Change \{using_guitar_select_camera = 0}
		PlayIGCCam \{Id = gs_view_cam_id Name = gs_view_cam viewport = Bg_Viewport controlscript = guitar_select_exit_camera_morph play_hold = 1 interrupt_current}
		wait_for_guitar_select_exit_camera
		killcamanim \{Name = gs_view_cam}
		if compositeObjectexists \{Name = GUITARIST}
			if NOT ($guitarist_info.stance = stance_FrontEnd)
				Change \{StructureName = guitarist_info current_anim = Idle}
				Change \{StructureName = guitarist_info cycle_anim = TRUE}
				Change \{StructureName = guitarist_info next_anim = NONE}
				GUITARIST :handle_change_stance \{stance = stance_FrontEnd speed = 2.0 No_wait}
			endif
		endif
		if compositeObjectexists \{Name = BASSIST}
			if NOT ($bassist_info.stance = stance_FrontEnd)
				if compositeObjectexists \{Name = BASSIST}
					BASSIST :handle_change_stance \{stance = stance_FrontEnd speed = 2.0 No_wait}
				endif
			endif
		endif
		setScreenElementProps Id = <bookEnd1ID> Unhide
		setScreenElementProps Id = <bookEnd2ID> Unhide
		setScreenElementProps Id = <whiteTexHighlightID> Unhide
	endif
	launchevent Type = focus Target = <vparent>
	Change \{menu_flow_locked = 0}
endscript

script character_hub_highlighter \{comi = 0 chh_mp = 0 chh_player = 1}
	if ($current_num_players = 1)
		retail_menu_focus
	endif
	if (<chh_mp> = 0)
		switch <menuItemNum>
			case 0
			setScreenElementProps Id = <be1ID> pos = (303.0, 175.0)
			setScreenElementProps Id = <be2ID> pos = (602.0, 175.0)
			setScreenElementProps Id = <wthlID> pos = (317.0, 171.0)
			case 1
			setScreenElementProps Id = <be1ID> pos = (303.0, 222.0)
			setScreenElementProps Id = <be2ID> pos = (602.0, 222.0)
			setScreenElementProps Id = <wthlID> pos = (317.0, 218.0)
			case 2
			setScreenElementProps Id = <be1ID> pos = (303.0, 269.0)
			setScreenElementProps Id = <be2ID> pos = (602.0, 269.0)
			setScreenElementProps Id = <wthlID> pos = (317.0, 265.0)
			case 3
			if (<comi>)
				setScreenElementProps Id = <be1ID> pos = (303.0, 317.0)
				setScreenElementProps Id = <be2ID> pos = (602.0, 317.0)
				setScreenElementProps Id = <wthlID> pos = (317.0, 313.0)
				elseif (<comi> = 0)
				setScreenElementProps Id = <be1ID> pos = (303.0, 317.0)
				setScreenElementProps Id = <be2ID> pos = (602.0, 317.0)
				setScreenElementProps Id = <wthlID> pos = (317.0, 313.0)
			endif
			case 4
			setScreenElementProps Id = <be1ID> pos = (303.0, 364.0)
			setScreenElementProps Id = <be2ID> pos = (602.0, 364.0)
			setScreenElementProps Id = <wthlID> pos = (317.0, 360.0)
		endswitch
		elseif (<chh_mp> = 1)
		if (<chh_player> = 1)
			<offset_pos> = (0.0, 0.0)
		else
			<offset_pos> = (350.0, 0.0)
		endif
		<initial_pos> = (310.0, 446.0)
		<r_bookend_offset> = (302.0, 0.0)
		<vertical_offset> = (0.0, 47.25)
		<highlight_offset> = (17.0, -3.0)
		if ($game_mode = p2_career || $game_mode = p2_coop || $coop_dlc_active = 1)
			<initial_pos> = (<initial_pos> + (0.0, -46.0))
		endif
		switch <menuItemNum>
			case 0
			setScreenElementProps Id = <be1ID> pos = (<initial_pos> + <offset_pos>)
			setScreenElementProps Id = <be2ID> pos = (<initial_pos> + <r_bookend_offset> + <offset_pos>)
			setScreenElementProps Id = <wthlID> pos = (<initial_pos> + <highlight_offset> + <offset_pos>)
			case 1
			setScreenElementProps Id = <be1ID> pos = (<initial_pos> + <vertical_offset> + <offset_pos>)
			setScreenElementProps Id = <be2ID> pos = (<initial_pos> + <vertical_offset> + <r_bookend_offset> + <offset_pos>)
			setScreenElementProps Id = <wthlID> pos = (<initial_pos> + <vertical_offset> + <highlight_offset> + <offset_pos>)
			case 2
			setScreenElementProps Id = <be1ID> pos = (<initial_pos> + (2 * <vertical_offset>) + <offset_pos>)
			setScreenElementProps Id = <be2ID> pos = (<initial_pos> + (2 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
			setScreenElementProps Id = <wthlID> pos = (<initial_pos> + (2 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			case 3
			setScreenElementProps Id = <be1ID> pos = (<initial_pos> + (3 * <vertical_offset>) + <offset_pos>)
			setScreenElementProps Id = <be2ID> pos = (<initial_pos> + (3 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
			setScreenElementProps Id = <wthlID> pos = (<initial_pos> + (3 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			case 4
			if (<comi>)
				setScreenElementProps Id = <be1ID> pos = (<initial_pos> + (4 * <vertical_offset>) + <offset_pos>)
				setScreenElementProps Id = <be2ID> pos = (<initial_pos> + (4 * <vertical_offset>) + <r_bookend_offset> + <offset_pos>)
				setScreenElementProps Id = <wthlID> pos = (<initial_pos> + (4 * <vertical_offset>) + <highlight_offset> + <offset_pos>)
			endif
		endswitch
	endif
endscript

script destroy_character_hub_menu \{Player = 1 Destroy = 0}
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_character_hub_p1}
		destroy_menu \{menu_id = character_hub_p1_container}
	else
		destroy_menu \{menu_id = scrolling_character_hub_p2}
		destroy_menu \{menu_id = character_hub_p2_container}
	endif
	killcamanim \{Name = gs_view_cam}
endscript

script character_hub_generic_sound 
	if (<Player> = 1)
		if ($p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script character_hub_select_play_show 
	if (($current_num_players) = 2)
		if ((<Player> = 1) && ($p1_ready = 0))
			setScreenElementProps \{Id = vmenu_character_hub_p1 disable_pad_handling}
			Change \{p1_ready = 1}
			if ($is_network_game = 1)
				if ScreenelementExists \{Id = ready_container_p2}
					runScriptOnScreenElement \{Id = ready_container_p2 pos2 = (825.0, 450.0) drop_in_ready_sign Params = {Player = 1}}
				endif
			else
				drop_in_ready_sign \{Player = 1}
			endif
		endif
		if ((<Player> = 2) && ($p2_ready = 0))
			setScreenElementProps \{Id = vmenu_character_hub_p2 disable_pad_handling}
			Change \{p2_ready = 1}
			drop_in_ready_sign \{Player = 2}
		endif
	endif
	if ((($p1_ready = 1) && ($p2_ready = 1)) || ($current_num_players = 1))
		if ($is_network_game = 1)
			killspawnedScript \{Name = net_hub_stream}
			if ScreenelementExists \{Id = vmenu_character_hub_p1}
				launchevent \{Type = unfocus Target = vmenu_character_hub_p1}
			endif
			Wait \{0.4 Seconds}
		endif
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		shut_down_character_hub
		if (($is_network_game) = 1)
			ui_flow_manager_respond_to_action \{action = select_ready Player = 1 create_params = {Player = 1}}
		else
			ui_flow_manager_respond_to_action \{action = select_play_show Player = 1 create_params = {Player = 1}}
		endif
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
	endif
endscript

script character_hub_select_the_store 
	clean_up_user_control_helpers
	shut_down_flow_manager \{Player = 2}
	shut_down_character_hub
	ui_flow_manager_respond_to_action action = select_the_store create_params = {Player = <Player>}
endscript

script character_hub_select_change_outfit 
	if ($is_network_game)
		net_info_panel_hide
	endif
	ui_flow_manager_respond_to_action action = select_change_outfit Player = <Player> create_params = {Player = <Player>}
endscript

script net_info_panel_hide 
	if ScreenelementExists \{Id = net_game_info_panel}
		DoScreenElementMorph \{Id = net_game_info_panel Alpha = 0.5 Time = 0}
	endif
endscript

script net_info_panel_show 
	if NOT ScreenelementExists \{Id = net_game_info_panel}
		return
	endif
	can_show = 1
	if ScreenelementExists \{Id = scrolling_select_outfit_p1}
		can_show = 0
		elseif ScreenelementExists \{Id = scrolling_select_outfit_p2}
		can_show = 0
		elseif ScreenelementExists \{Id = scrolling_select_guitar_p1}
		can_show = 0
		elseif ScreenelementExists \{Id = scrolling_select_guitar_p2}
		can_show = 0
	endif
	if (<can_show> = 1)
		DoScreenElementMorph \{Id = net_game_info_panel Alpha = 1 Time = 0}
	endif
endscript

script character_hub_select_change_guitar 
	launchevent Type = unfocus Target = <vparent>
	if ($is_network_game)
		net_info_panel_hide
	endif
	if ($current_num_players = 1)
		generic_select_monitor_wait
	endif
	if gotParam \{BASS}
		ui_flow_manager_respond_to_action action = select_change_bass Player = <Player> create_params = {Player = <Player>}
	else
		ui_flow_manager_respond_to_action action = select_change_guitar Player = <Player> create_params = {Player = <Player>}
	endif
endscript

script generic_select_monitor_wait 
	UnPauseSpawnedScript \{generic_select_monitor}
	formatText \{Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = 1}
	formatText \{Checksumname = change_flag2 'generic_select_monitor_p%i_changed' I = 2}
	begin
	Printf "Waiting for %i %s" I = <change_flag> S = $<change_flag>
	if ($<change_flag> = 0)
		if ($current_num_players = 1 || $<change_flag2> = 0)
			break
		endif
	endif
	Wait \{1 GameFrame}
	repeat
endscript

script generic_select_monitor_finish 
	Printf \{"generic_select_monitor_finish"}
	generic_select_monitor_wait
	killspawnedScript \{Name = generic_select_monitor}
endscript
generic_select_monitor_p1_changed = 0
generic_select_monitor_p2_changed = 0

script generic_select_monitor \{initial_load = 1 node_flags = {}}
	async = 1
	if (<initial_load> = 1)
		Change globalName = <change_flag> NewValue = 1
	endif
	begin
	if ($<change_flag> = 1)
		Change globalName = <change_flag> NewValue = 2
		if NOT preload_band_member Name = <Name> useOldPos async = <async> animpak = 0
			Change globalName = <change_flag> NewValue = 0
			DownloadContentLost
			return
		endif
		Printf "preload_band_member %i" I = <Name>
		if ($<change_flag> = 2)
			if NOT create_guitarist Name = <Name> useOldPos no_strum async = <async> animpak = 0 <node_flags>
				Change globalName = <change_flag> NewValue = 0
				DownloadContentLost
				return
			endif
			Printf "create_guitarist %i" I = <Name>
		endif
		preload_band_member_finish Name = <Name> useOldPos async = <async> animpak = 0 filename_crc = <filename_crc> instrument_crc = <instrument_crc>
		if ($<change_flag> = 2 &&
				<async> = 1)
			<Name> :Obj_GetPosition
			<Name> :Obj_SetPosition Position = (0.0, -200.0, 0.0)
			Wait \{1 GameFrame}
			<Name> :Obj_SetPosition Position = <pos>
			Change \{store_shadow_change = 1}
		endif
		if ($<change_flag> = 2)
			Change globalName = <change_flag> NewValue = 0
		endif
	else
		Wait \{1 GameFrame}
	endif
	async = 1
	repeat
endscript

script create_select_guitar_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {Up}}
		{pad_down generic_menu_up_or_down_sound Params = {Down}}
		{pad_back menu_flow_go_back Params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		else
			new_menu scrollid = scrolling_select_finish_p1 vmenuid = vmenu_select_finish_p1 Name = "Select Guitar Finish" use_backdrop = 0 event_handlers = <event_handlers>
		endif
		vparent = vmenu_select_finish_p1
	else
		new_menu scrollid = scrolling_select_finish_p2 vmenuid = vmenu_select_finish_p2 Name = "Select Guitar Finish" use_backdrop = 0 exclusive_device = <exclusive_dev> event_handlers = <event_handlers>
		vparent = vmenu_select_finish_p2
	endif
	if ($current_num_players = 2)
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = text_A1
			scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 1")
			just = [Left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = text_A1
			scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 2")
			just = [Left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
			exclusive_device = <exclusive_dev>
		}
	else
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = text_A1
			scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 1")
			just = [Left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
		createScreenElement {
			Type = textElement
			PARENT = <vparent>
			font = text_A1
			scale = 0.75
			rgba = [210 130 0 250]
			Text = ("Finish 2")
			just = [Left top]
			event_handlers = [
				{focus finish_select_highlight}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = select_character_hub Player = <Player>}}
				{pad_start menu_show_gamercard}
			]
		}
	endif
endscript

script destroy_select_guitar_finish_menu \{Player = 1}
	formatText Checksumname = scrolling_select_finish 'scrolling_select_finish_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_finish>
endscript

script finish_select_highlight 
	retail_menu_focus
endscript
default_character_hub_pos = {
	p1_pos = (3.0, 0.0, 0.0)
	p1_2ppos = (1.75, 0.0, 0.0)
	p2_2ppos = (3.0, 0.0, 0.0)
}

script setup_character_hub 
	if ($g_hub_created = 1)
		set_character_hub_dirty
		return
	endif
	character_hub_pos = default_character_hub_pos
	destroy_bg_viewport
	setup_bg_viewport
	Destroy_Crowd_Models
	GetPakManCurrentName \{map = Zones}
	if gotParam \{pakname}
		if NOT (<pakname> = "z_soundcheck")
			ResetWaypoints
			SetPakManCurrentBlock \{map = Zones pak = Z_Soundcheck block_scripts = 1}
		endif
	else
		ResetWaypoints
		SetPakManCurrentBlock \{map = Zones pak = Z_Soundcheck block_scripts = 1}
	endif
	player2_spotlight = Z_SoundCheck_GFX_TRG_LH_HotSpot_P2
	if ($current_num_players = 2)
		Safecreate NodeName = <player2_spotlight>
	else
		Safekill NodeName = <player2_spotlight>
	endif
	unpauseGame
	disable_pause
	destroy_band
	Printf \{"Creating generic_select_monitor"}
	Player = 1
	begin
	formatText Checksumname = player_status 'player%i_status' I = <Player>
	formatText Checksumname = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
	if (<Player> = 1)
		Name = ($player1_status.band_Member)
	else
		Name = ($player2_status.band_Member)
	endif
	SpawnScriptNOw generic_select_monitor Params = {Player = <Player> player_status = <player_status> change_flag = <change_flag> Name = <Name>}
	Player = (<Player> + 1)
	repeat ($current_num_players)
	StopRendering
	generic_select_monitor_wait
	StartRendering
	if compositeObjectexists \{Name = DRUMMER}
		DRUMMER :Hide
	endif
	if compositeObjectexists \{Name = guitarist2}
		guitarist2 :Hide
	endif
	if compositeObjectexists \{Name = VOCALIST}
		VOCALIST :Hide
	endif
	if ($current_num_players = 1)
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :Hide
		endif
	else
		if compositeObjectexists \{Name = BASSIST}
			BASSIST :Unhide
			BASSIST :Ragdoll_MarkForReset
		endif
		if (($is_network_game = 1) && ($player2_present = 0))
			if compositeObjectexists \{Name = BASSIST}
				BASSIST :Hide
			endif
		endif
	endif
	Printf \{"Moving guitarist to correct position"}
	if compositeObjectexists \{Name = GUITARIST}
		Printf \{"Moving guitarist to correct position2"}
		if ($current_num_players = 1)
			Printf \{"Moving guitarist to correct position3"}
			GUITARIST :Obj_SetPosition Position = ($<character_hub_pos>.p1_pos)
		endif
	endif
	if ($current_num_players = 2)
		($player1_status.band_Member) :Obj_SetPosition Position = ($<character_hub_pos>.p1_2ppos)
		($player2_status.band_Member) :Obj_SetPosition Position = ($<character_hub_pos>.p2_2ppos)
	endif
	PlayIGCCam \{Id = cs_view_cam_id Name = ch_view_cam viewport = Bg_Viewport lockto = World pos = (2.503113, 1.0385579, 2.869411) quat = (0.028074998, -0.999026, 0.020287) fov = 78.0 play_hold = 1 interrupt_current}
	Change \{g_hub_created = 1}
	setshadowdirfromlight \{Name = Z_SoundCheck_GFX_Char_Front01}
endscript

script shut_down_character_hub 
	if ($g_hub_created = 0)
		return
	endif
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	if ($shutdown_game_for_signin_change_flag = 1)
		killspawnedScript \{Name = setup_character_hub}
		Change \{using_guitar_select_camera = 0}
	endif
	generic_select_monitor_finish
	killcamanim \{Name = ch_view_cam}
	killcamanim \{Name = gs_view_cam}
	destroy_bg_viewport
	disable_pause
	if compositeObjectexists \{Name = DRUMMER}
		DRUMMER :Unhide
	endif
	if compositeObjectexists \{Name = guitarist2}
		guitarist2 :Unhide
	endif
	if compositeObjectexists \{Name = VOCALIST}
		VOCALIST :Unhide
	endif
	if compositeObjectexists \{Name = BASSIST}
		BASSIST :Unhide
	endif
	destroy_band
	Change \{g_hub_created = 0}
endscript

script character_hub_go_back 
	if ($current_num_players = 2)
		leaving_character_hub = 1
		if ($game_mode = p2_career || $game_mode = p2_coop)
			find_coop_career_character_hub_ancestor
			if checksumequals A = <flow_state> B = coop_career_character_select_fs
				leaving_character_hub = 0
			endif
			elseif ($current_num_players = 2)
			leaving_character_hub = 0
		endif
		if (<leaving_character_hub> = 0)
			if (<Player> = 1)
				setScreenElementProps \{Id = vmenu_character_hub_p1 enable_pad_handling}
				Change \{p1_ready = 0}
				if ($is_network_game = 1)
					if ScreenelementExists \{Id = ready_container_p1}
						runScriptOnScreenElement \{Id = ready_container_p1 drop_out_ready_sign Params = {Player = 1}}
					endif
				else
					drop_out_ready_sign \{Player = 1}
				endif
			else
				setScreenElementProps \{Id = vmenu_character_hub_p2 enable_pad_handling}
				Change \{p2_ready = 0}
				drop_out_ready_sign \{Player = 2}
			endif
			ui_flow_manager_respond_to_action action = go_back create_params = {Player = <Player>} Player = <Player>
		endif
	else
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action Player = <Player> action = go_back
	endif
endscript

script get_num_character_outfits 
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		getArraySize (<profile_struct>.outfits)
		return num_character_outfits = <array_Size>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script get_num_outfit_styles \{outfit = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		outfits = (<profile_struct>.outfits)
		getArraySize (<outfits> [(<outfit> -1)].styles)
		return num_outfit_styles = <array_Size>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script get_character_outfits \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	Name = (<profile_struct>.Name)
	get_musician_profile_size
	Index = 0
	begin
	get_musician_profile_struct Index = <Index>
	if (<profile_struct>.Name = <Name>)
		return character_outfits = (<profile_struct>.outfits)
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
endscript

script get_character_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
	else
		find_profile_by_id Id = ($player2_status.character_id)
	endif
	get_musician_profile_struct Index = <Index>
	return character_name = (<profile_struct>.Name) display_name = (<profile_struct>.fullname)
endscript

script get_character_outfit_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
	else
		find_profile_by_id Id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
	endif
	get_musician_profile_struct Index = <Index>
	if structureContains Structure = <profile_struct> Name = outfits
		return outfit_name = (<profile_struct>.outfits [<outfit_index>].Id)
	else
		return outfit_name = (<profile_struct>.Name)
	endif
endscript

script get_character_style_name \{Player = 1}
	if (<Player> = 1)
		find_profile_by_id Id = ($player1_status.character_id)
		outfit_index = ($player1_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	else
		find_profile_by_id Id = ($player2_status.character_id)
		outfit_index = ($player2_status.outfit - 1)
		style_index = ($player1_status.style - 1)
	endif
	get_musician_profile_struct Index = <Index>
	return style_name = (<profile_struct>.outfits [<outfit_index>].styleids [<style_index>])
endscript

script net_outfit_menu_flow_go_back 
	menu_flow_go_back Player = <Player>
endscript

script net_style_menu_flow_go_back 
	menu_flow_go_back Player = <Player>
endscript
