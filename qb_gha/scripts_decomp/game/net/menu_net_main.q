info_text = [
	"Jump right into a Player Match and rock the house against the first rocker available."
	"Join a private match created by a friend."
	"Search for a specific type of online match."
	"Create and host your own online match."
	"Setup and make changes to your Quick Match Options."
	"Check out who the best of the best are and see where you rank."
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe."
	"Manage your online account."
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (922.0, 186.0)
mnm_frame_id = null

script create_online_main_menu \{menu_title_xenon = "ONLINE" menu_title_ps3 = "ONLINE" menu_id = online_main_menu vmenu_id = online_main_vmenu}
	change \{winport_block_net_pause = 0}
	change \{gIsInNetGame = 0}
	change \{online_main_menu_pos = (470.0, 110.0)}
	change \{online_info_pane_pos = (890.0, 150.0)}
	change \{gPrivateMatchId = 0}
	online_menu_init
	change \{rich_presence_context = presence_main_menu}
	spawnscriptnow \{menu_music_on}
	CreateScreenElement \{type = ContainerElement parent = root_window id = main_menu_anchor Pos = (0.0, 0.0)}
	CreateScreenElement {
		type = vscrollingmenu
		parent = main_menu_anchor
		id = <menu_id>
		just = [center top]
		dims = (400.0, 480.0)
		Pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	CreateScreenElement {
		type = vmenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (47.5, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	CreateScreenElement \{type = ContainerElement parent = main_menu_anchor id = online_main_menu_container Pos = (0.0, 0.0)}
	CreateScreenElement \{type = ContainerElement parent = online_main_menu_container id = online_main_menu_text_container Pos = (0.0, 0.0)}
	CreateScreenElement \{type = ContainerElement parent = main_menu_anchor id = online_info_pane_container Pos = (0.0, 0.0)}
	CreateScreenElement \{type = ContainerElement parent = online_info_pane_container id = online_info_pane_text_container Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{type = ContainerElement parent = online_main_menu_container id = online_main_menu_frame_container Pos = (0.0, 0.0) alpha = 0}
	change mnm_frame_id = <id>
	frame_dims = (840.0, 600.0)
	center_pos = (($online_main_menu_pos) + (170.0, 266.0))
	create_UI_frame {
		parent = online_main_menu_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 2
		suffix = 0
	}
	CreateScreenElement {
		type = SpriteElement
		id = online_frame_crown
		parent = online_main_menu_frame_container
		texture = online_frame_crown
		Pos = (($online_main_menu_pos) + (170.0, -76.0))
		dims = (256.0, 105.0)
		just = [center top]
		z_priority = 3
	}
	CreateScreenElement \{type = ContainerElement parent = online_info_pane_container id = online_info_pane_frame_container Pos = (0.0, 0.0)}
	frame_dims = (320.0, 340.0)
	center_pos = (($online_info_pane_pos) + (-10.0, 150.0))
	create_UI_frame {
		parent = online_info_pane_frame_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($g_menu_colors).online_fill_rgba)
		z_priority = 5
		suffix = 1
	}
	if IsXenon
		CreateScreenElement {
			type = TextElement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			Scale = 1.2
			rgba = ($online_light_purple)
			Pos = (($online_main_menu_pos) + (0.0, 15.0))
			text = <menu_title_xenon>
			just = [center top]
			z_priority = 4.0
			shadow
			shadow_offs = (5.0, 5.0)
		}
	else
		CreateScreenElement {
			type = TextElement
			parent = online_main_menu_text_container
			id = online_title
			font = fontgrid_title_gh3
			Scale = 1.2
			rgba = ($online_light_purple)
			Pos = (($online_main_menu_pos) + (0.0, 15.0))
			text = <menu_title_ps3>
			just = [center top]
			z_priority = 4.0
			shadow
			shadow_offs = (5.0, 5.0)
		}
	endif
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps {
			id = <id>
			Scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "QUICK MATCH"
		info_text_index = 0
		pad_choose_script = online_menu_select_quickmatch_player
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "JOIN PRIVATE MATCH"
		info_text_index = 1
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_join_private}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "CREATE MATCH"
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "LEADERBOARDS"
		info_text_index = 5
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "MESSAGE OF THE DAY"
		info_text_index = 6
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		vmenu = <vmenu_id>
		text = "ACCOUNT MANAGEMENT"
		info_text_index = 7
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_account_management}
		pad_choose_script2 = SoundEvent
		choose_script_params2 = {event = ui_sfx_select}
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = online_info_pane_text_container
		id = help_info_text_block
		font = text_a4
		Scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = ($info_text [0])
		just = [center center]
		internal_just = [center center]
		z_priority = 6.0
		Pos = (($online_info_pane_pos) + (-12.0, 140.0))
		dims = (320.0, 340.0)
	}
	CreateScreenElement \{type = windowelement parent = main_menu_anchor id = motd_ticker_window Pos = (0.0, 590.0) dims = (1280.0, 40.0) just = [left top]}
	CreateScreenElement {
		type = SpriteElement
		parent = motd_ticker_window
		texture = white
		Pos = (0.0, 0.0)
		dims = (1280.0, 40.0)
		just = [left top]
		rgba = (($g_menu_colors).online_fill_rgba)
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = motd_ticker_window
		id = motd_ticker_text_block
		just = [left top]
		internal_just = [left top]
		Pos = (1280.0, 0.0)
		Scale = (0.65000004, 0.55)
		text = ""
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		dims = (1280.0, 64.0)
		line_spacing = 1.0
		allow_expansion
	}
	spawnscriptnow \{get_motd_and_start_ticker}
	if NOT IsXenon
		if NOT NetSessionFunc \{obj = voice func = voice_allowed}
			CreateScreenElement {
				type = TextBlockElement
				parent = online_info_pane_container
				just = [center top]
				internal_just = [center top]
				Pos = (640.0, 530.0)
				Scale = (0.55, 0.55)
				text = "Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions."
				font = text_a4
				rgba = ($online_light_blue)
				z_priority = 6.0
				dims = (1500.0, 120.0)
			}
		endif
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = main_menu_anchor}
		DestroyScreenElement \{id = main_menu_anchor}
	endif
	KillSpawnedScript \{name = scroll_motd_ticker}
endscript

script create_online_main_menu_helper_buttons 
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
	endif
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "SELECT" button = green z = 100}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	add_user_control_helper \{text = "UP/DOWN" button = strumbar z = 100}
endscript

script get_motd_and_start_ticker 
	if ($retrieved_message_of_the_day = 0)
		NetSessionFunc \{obj = motd func = get_demonware_motd params = {callback = motd_callback}}
	else
		spawnscriptnow \{scroll_motd_ticker params = {id = motd_ticker_text_block}}
	endif
endscript

script motd_callback 
	if GotParam \{motd_text}
		change \{retrieved_message_of_the_day = 1}
		change message_of_the_day = <motd_text>
		if ScreenElementExists \{id = motd_ticker_text_block}
			motd_ticker_text_block :setprops text = ($message_of_the_day)
			spawnscriptnow \{scroll_motd_ticker params = {id = motd_ticker_text_block}}
		endif
	endif
endscript
g_motd_start_pos_x = 0
g_motd_end_pos_x = 0

script scroll_motd_ticker \{scroll_time = 8}
	this_id = <id>
	FormatText textname = msg_text "\\c1MESSAGE OF THE DAY:\\c0 %t" t = ($message_of_the_day)
	<this_id> :setprops text = <msg_text>
	GetScreenElementChildren id = <this_id>
	GetArraySize (<children>)
	<start_pos> = (1280.0, 0.0)
	<motd_font> = text_a4
	CreateScreenElement {
		type = TextElement
		parent = motd_ticker_window
		Scale = (0.65000004, 0.55)
		text = " "
		font = <motd_font>
	}
	GetScreenElementDims id = <id>
	<space_width> = <width>
	end_pos = (0.0, 0.0)
	<i> = 0
	begin
	(<children> [<i>]) :text_getstring
	GetUpperCaseString <string>
	FormatText checksumname = motd_ticker_text 'motd_ticker_text_%i' i = <i>
	if ScreenElementExists id = <motd_ticker_text>
		DestroyScreenElement id = <motd_ticker_text>
	endif
	CreateScreenElement {
		type = TextElement
		parent = motd_ticker_window
		id = <motd_ticker_text>
		just = [left top]
		internal_just = [left top]
		Scale = (0.65000004, 0.55)
		text = <uppercasestring>
		font = text_a4
		rgba = ($online_light_purple)
		z_priority = 100
		override_encoded_alpha
	}
	GetScreenElementDims id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	<end_pos> = (<end_pos> - (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	change \{g_motd_start_pos_x = 1280}
	change g_motd_end_pos_x = (<end_pos>.(1.0, 0.0))
	<time_factor> = (1280 / <scroll_time>)
	<scroll_time> = ((1280 - $g_motd_end_pos_x) / <time_factor>)
	begin
	<start_pos> = ($g_motd_start_pos_x * (1.0, 0.0))
	<end_pos> = ($g_motd_end_pos_x * (1.0, 0.0))
	<i> = 0
	begin
	FormatText checksumname = motd_ticker_text 'motd_ticker_text_%i' i = <i>
	spawnscriptnow scroll_motd_each_line params = {id = <motd_ticker_text> start_pos = <start_pos> end_pos = <end_pos> scroll_time = <scroll_time>}
	GetScreenElementDims id = <motd_ticker_text>
	<new_width> = (<width> + <space_width>)
	start_pos = (<start_pos> + (<new_width> * (1.0, 0.0)))
	end_pos = (<end_pos> + (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	wait <scroll_time> seconds
	repeat
endscript

script scroll_motd_each_line 
	<id> :setprops Pos = <start_pos>
	<id> :DoMorph Pos = <end_pos> time = <scroll_time>
	return
endscript

script return_from_online_main_menu 
	printf \{"--- deinitializing network layer"}
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script online_menu_select_quickmatch_player 
	change \{match_type = player}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_player}
endscript

script online_menu_select_quickmatch_ranked 
	change \{match_type = ranked}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_ranked}
endscript

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 
	printf \{"---lobby_connection_lost performing net cleanup"}
	EndGameNetScriptPump
	if IsWinPort
		if (ishost)
			isHosting = 1
		else
			isHosting = 0
		endif
	endif
	if ($gHandlingWindowClosed = 1 || <isHosting> = 0)
		quit_network_game
		setup_sessionfuncs
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = connection_lost}
	endif
	change \{gHandlingWindowClosed = 0}
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements \{id = online_info_pane_container time = 0.2 hide}
	wait \{0.1 seconds}
	hide_unhide_menu_elements \{id = online_main_menu_text_container time = 0.2 hide}
	hide_unhide_menu_elements \{id = online_main_vmenu time = 0.2 hide}
	translate_and_scale_online_menu
	wait \{0.3 seconds}
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container DoScreenElementMorph params = {id = gh_link_container alpha = 1.0 time = 0.2}}
	endif
	ghlink_vmenu :setprops \{enable_pad_handling}
	LaunchEvent \{type = focus target = ghlink_vmenu}
endscript

script online_menu_unselect_website 
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container DoScreenElementMorph params = {id = gh_link_container alpha = 0.0 time = 0.2}}
	endif
	wait \{0.3 seconds}
	if ScreenElementExists \{id = gh_link_container}
		DestroyScreenElement \{id = gh_link_container}
	endif
	translate_and_scale_online_menu \{revert}
	hide_unhide_menu_elements \{id = online_main_menu_text_container time = 0.2}
	hide_unhide_menu_elements \{id = online_main_vmenu time = 0.2}
	wait \{0.1 seconds}
	hide_unhide_menu_elements \{id = online_info_pane_container time = 0.2}
	wait \{0.3 seconds}
	LaunchEvent \{type = focus target = online_main_vmenu}
endscript

script create_link_text 
	CreateScreenElement \{type = ContainerElement parent = online_main_menu_container id = gh_link_container Pos = (40.0, 42.0) Scale = 0.95}
	CreateScreenElement \{type = vscrollingmenu parent = gh_link_container id = ghlink just = [center top] dims = (400.0, 480.0) Pos = (320.0, 200.0) z_priority = 1}
	CreateScreenElement {
		type = vmenu
		parent = ghlink
		id = ghlink_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent params = {event = Generic_menu_back_SFX}}
			{pad_back online_menu_unselect_website}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :setprops disable_pad_handling
	CreateScreenElement {
		type = TextElement
		parent = gh_link_container
		id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 1.05
		rgba = ($online_light_purple)
		text = "WWW.GUITARHERO.COM"
		just = [center top]
		Pos = (630.0, 111.0)
		z_priority = 4.0
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "Ready to Be a Guitar Hero? \\nHere's how to link your stats to the web community:"
		just = [center top]
		internal_just = [center top]
		z_priority = 6.0
		Pos = (630.0, 160.0)
		dims = (950.0, 200.0)
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "- Go to www.guitarhero.com\\n- Create a New Account or Log in\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (660.0, 240.0)
		dims = (1010.0, 600.0)
	}
	NetSessionFunc \{func = get_agora_token}
	FormatText textname = vip_code "%a" a = <token>
	CreateScreenElement {
		type = TextElement
		parent = gh_link_container
		font = text_a3
		Scale = 1.25
		rgba = ($online_light_blue)
		text = <vip_code>
		just = [center top]
		z_priority = 6.0
		Pos = (630.0, 410.0)
		font_spacing = 5
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = gh_link_container
		font = text_a4
		Scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		text = "On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!"
		just = [center top]
		internal_just = [left top]
		z_priority = 6.0
		Pos = (638.0, 460.0)
		dims = (950.0, 600.0)
	}
	if ScreenElementExists \{id = gh_link_container}
		RunScriptOnScreenElement \{id = gh_link_container DoScreenElementMorph params = {id = gh_link_container alpha = 0.0}}
	endif
	clean_up_user_control_helpers
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	LaunchEvent \{type = unfocus target = online_main_vmenu}
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements \{id = online_main_menu_container time = 0.2 hide}
	hide_unhide_menu_elements \{id = online_main_vmenu time = 0.2 hide}
	wait \{0.1 seconds}
	hide_unhide_menu_elements \{id = online_info_pane_text_container time = 0.2 hide}
	translate_and_scale_info_pane
	wait \{0.3 seconds}
	if ScreenElementExists \{id = motd_container}
		RunScriptOnScreenElement \{id = motd_container DoScreenElementMorph params = {id = motd_container alpha = 1.0 time = 0.2}}
	endif
	LaunchEvent \{type = focus target = motd_vmenu}
	motd_vmenu :setprops \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if ScreenElementExists \{id = motd_container}
		RunScriptOnScreenElement \{id = motd_container DoScreenElementMorph params = {id = motd_container alpha = 0.0 time = 0.2}}
	endif
	wait \{0.3 seconds}
	destroy_menu \{menu_id = motd_scroller}
	if ScreenElementExists \{id = motd_container}
		DestroyScreenElement \{id = motd_container}
	endif
	translate_and_scale_info_pane \{revert}
	hide_unhide_menu_elements \{id = online_info_pane_text_container time = 0.2}
	wait \{0.1 seconds}
	hide_unhide_menu_elements \{id = online_main_vmenu time = 0.2}
	hide_unhide_menu_elements \{id = online_main_menu_container time = 0.2}
	wait \{0.3 seconds}
	LaunchEvent \{type = focus target = online_main_vmenu}
endscript

script create_motd_text 
	CreateScreenElement \{type = ContainerElement parent = online_info_pane_container id = motd_container Pos = (0.0, 0.0)}
	CreateScreenElement \{type = vscrollingmenu parent = motd_container id = motd_scroller just = [center top] dims = (400.0, 480.0) Pos = (640.0, 0.0) z_priority = 1}
	CreateScreenElement {
		type = vmenu
		parent = motd_scroller
		id = motd_vmenu
		Pos = (0.0, 0.0)
		just = [left top]
		internal_just = [center top]
		dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back SoundEvent params = {event = Generic_menu_back_SFX}}
			{pad_back online_menu_unselect_motd}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<id> :setprops disable_pad_handling
	CreateScreenElement {
		type = TextElement
		parent = motd_container
		id = gh_link_title
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_blue)
		text = "MESSAGE OF THE DAY"
		just = [center top]
		Pos = (640.0, 160.0)
		z_priority = 10.0
	}
	CreateScreenElement \{type = windowelement parent = motd_container id = motd_info_scroll_window Pos = (633.0, 220.0) dims = (500.0, 300.0) just = [center top]}
	CreateScreenElement {
		type = TextBlockElement
		parent = motd_info_scroll_window
		id = motd_info_text_block
		just = [center top]
		internal_just = [center top]
		Pos = (245.0, 0.0)
		Scale = (0.75, 0.55)
		text = ($message_of_the_day)
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	motd_info_text_block :obj_spawnscriptnow \{scroll_motd_info params = {id = motd_info_text_block}}
	if ScreenElementExists \{id = motd_container}
		motd_container :setprops \{alpha = 0.0}
	endif
	clean_up_user_control_helpers
	change \{user_control_pill_text_color = [0 0 0 255]}
	change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{text = "BACK" button = red z = 100}
	LaunchEvent \{type = unfocus target = online_main_vmenu}
endscript

script scroll_motd_info \{scroll_time = 60}
	<end_pos> = (0.0, -1000.0)
	<this_id> = <id>
	GetScreenElementChildren id = <this_id>
	if GotParam \{children}
		GetArraySize (<children>)
		<line_nums> = <array_size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		wait \{5 seconds}
		DoScreenElementMorph id = <this_id> Pos = <end_pos> time = <scroll_time>
		wait ((<line_nums> - 10) * 1.8) seconds
		GetScreenElementProps id = <this_id>
		SetScreenElementProps id = <this_id> Pos = <Pos>
		wait \{4.0 seconds}
		<this_id> :DoMorph alpha = 0 time = 0.2
		<this_id> :setprops Pos = (0.0, 0.0)
		wait \{0.5 seconds}
		<this_id> :DoMorph alpha = 1 time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	<frames> = 10
	<time> = 0.3
	if NOT GotParam \{revert}
		motd_ticker_window :DoMorph alpha = 0 time = <time>
		($mnm_frame_id) :DoMorph alpha = 1 time = <time>
	else
		($mnm_frame_id) :DoMorph alpha = 0 time = <time>
		motd_ticker_window :DoMorph alpha = 1 time = <time>
	endif
endscript

script translate_and_scale_info_pane 
	<frames> = 10
	if NOT GotParam \{revert}
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (320.0, 340.0)
			end_dims = (830.0, 448.0)
			start_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			end_pos = (($online_info_pane_pos) + (-250.0, 118.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($g_menu_colors).online_fill_rgba)
			frames = <frames>
			parent = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		wait (<frames> + 2) gameframes
		KillSpawnedScript \{name = do_ui_frame_morph}
	else
		spawnscriptnow do_ui_frame_morph params = {
			start_dims = (830.0, 448.0)
			end_dims = (320.0, 340.0)
			start_pos = (($online_info_pane_pos) + (-250.0, 118.0))
			end_pos = (($online_info_pane_pos) + (-10.0, 150.0))
			frame_rgba = ($online_medium_blue)
			fill_rgba = (($g_menu_colors).online_fill_rgba)
			frames = <frames>
			parent = online_info_pane_frame_container
			z_priority = 5
			suffix = 1
		}
		wait (<frames> + 2) gameframes
		KillSpawnedScript \{name = do_ui_frame_morph}
	endif
endscript

script hide_unhide_menu_elements \{time = 0.0}
	if ScreenElementExists id = <id>
		if GotParam \{hide}
			RunScriptOnScreenElement id = <id> DoScreenElementMorph params = {alpha = 0.0 time = <time> id = <id>}
		else
			RunScriptOnScreenElement id = <id> DoScreenElementMorph params = {alpha = 1.0 time = <time> id = <id>}
		endif
	endif
endscript

script create_net_play_song_menu 
endscript

script destroy_net_play_song_menu 
endscript

script online_select_downloads 
	NetSessionFunc \{func = showmarketplaceui}
	wait_for_blade_complete
	SetPakManCurrentBlock \{map = zones pak = None block_scripts = 1}
	destroy_band
	Downloads_UnloadContent
	ui_flow_manager_respond_to_action \{action = select_downloadable_content}
endscript

script net_add_item_to_main_menu \{line_spacing = 40}
	if IsWinPort
		if GotParam \{info_text_index}
			eventparams = [
				{focus net_main_menu_focus}
				{focus SetScreenElementProps params = {id = help_info_text_block text = ($info_text [<info_text_index>])}}
				{unfocus net_main_menu_unfocus}
			]
		else
			eventparams = [
				{focus net_main_menu_focus}
				{unfocus net_main_menu_unfocus}
			]
		endif
	else
		if IsXenon
			line_spacing = 40
		else
			line_spacing = 50
		endif
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <vmenu>
		dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = <eventparams>
	}
	menu_item_container = <id>
	if GotParam \{pad_choose_script}
		if GotParam \{choose_script_params}
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script> params = {<choose_script_params>}}]
		else
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if GotParam \{pad_choose_script2}
		if GotParam \{choose_script_params2}
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script2> params = {<choose_script_params2>}}]
		else
			<menu_item_container> :setprops event_handlers = [{pad_choose <pad_choose_script2>}]
		endif
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <menu_item_container>
		local_id = highlightbar
		texture = hilite_bar_01
		dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (0.0, 15.0)
		just = [center center]
		z_priority = 3
		alpha = 0.0
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (-225.0, 15.0)
		just = [RIGHT center]
		z_priority = 3
		alpha = 0.0
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		dims = (30.0, 40.0)
		rgba = ($online_light_blue)
		Pos = (225.0, 15.0)
		just = [left center]
		z_priority = 3
		alpha = 0.0
	}
	CreateScreenElement {
		type = TextElement
		parent = <menu_item_container>
		local_id = text
		font = fontgrid_title_gh3
		Scale = 0.75
		rgba = ($online_light_blue)
		text = <text>
		just = [center top]
		z_priority = 4.0
		shadow
		shadow_offs = (2.0, 2.0)
	}
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps {
			id = <id>
			Scale = 1.0
		}
		scale_element_to_size {
			id = <id>
			target_width = 420
			target_height = <height>
		}
	endif
endscript

script net_main_menu_focus 
	obj_getid
	if ScreenElementExists id = {<ObjID> child = highlightbar}
		SetScreenElementProps {
			id = {<ObjID> child = highlightbar}
			alpha = 1.0
		}
	endif
	if ScreenElementExists id = {<ObjID> child = left_bookend}
		SetScreenElementProps {
			id = {<ObjID> child = left_bookend}
			alpha = 1.0
			preserve_flip
		}
	endif
	if ScreenElementExists id = {<ObjID> child = right_bookend}
		SetScreenElementProps {
			id = {<ObjID> child = right_bookend}
			alpha = 1.0
		}
	endif
	if ScreenElementExists id = {<ObjID> child = text}
		SetScreenElementProps {
			id = {<ObjID> child = text}
			rgba = ($online_dark_purple)
			shadow_rgba = ($online_light_blue)
		}
	endif
endscript

script net_main_menu_unfocus 
	obj_getid
	if ScreenElementExists id = {<ObjID> child = highlightbar}
		SetScreenElementProps {
			id = {<ObjID> child = highlightbar}
			alpha = 0.0
		}
	endif
	if ScreenElementExists id = {<ObjID> child = left_bookend}
		SetScreenElementProps {
			id = {<ObjID> child = left_bookend}
			alpha = 0.0
			preserve_flip
		}
	endif
	if ScreenElementExists id = {<ObjID> child = right_bookend}
		SetScreenElementProps {
			id = {<ObjID> child = right_bookend}
			alpha = 0.0
		}
	endif
	if ScreenElementExists id = {<ObjID> child = text}
		SetScreenElementProps {
			id = {<ObjID> child = text}
			rgba = ($online_light_blue)
			shadow_rgba = [0 0 0 255]
		}
	endif
endscript
