info_text = [
	"Jump right into a Player Match and rock the house against the first rocker available."
	"Jump right into a Ranked Match and rock the house against the first rocker available."
	"Search for a specific type of online match."
	"Join a private match created by a friend."
	"Create and host your own online match."
	"Setup and make changes to your Quick Match Options."
	"Check out who the best of the best are and see where you rank."
	"Downloads Coming Soon!"
	"Select 'Message Of The Day' to see the latest news in the Guitar Hero universe."
	"Manage your online account."
]
online_main_menu_pos = (470.0, 110.0)
online_info_pane_pos = (890.0, 150.0)

script create_online_main_menu \{menu_title_xenon = "Online Main Menu" menu_title_ps3 = "Online Main Menu" menu_id = online_main_menu vmenu_id = online_main_vmenu}
	Change \{winport_block_net_pause = 0}
	Change \{gIsInNetGame = 0}
	Change \{online_main_menu_pos = (470.0, 110.0)}
	Change \{online_info_pane_pos = (890.0, 150.0)}
	Change \{gPrivateMatchId = 0}
	online_menu_init
	Change \{rich_presence_context = presence_main_menu}
	SpawnScriptNOw \{Menu_Music_On}
	createScreenElement \{Type = containerElement PARENT = root_window Id = main_menu_anchor pos = (0.0, 0.0)}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = main_menu_anchor
		Id = <menu_id>
		just = [Center top]
		Dims = (400.0, 480.0)
		pos = (($online_main_menu_pos) + (0.0, 75.0))
		z_priority = 1
	}
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = (47.5, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_back return_from_online_main_menu}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
		exclusive_device = ($primary_controller)
	}
	createScreenElement \{Type = containerElement PARENT = main_menu_anchor Id = online_main_menu_container pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement PARENT = online_main_menu_container Id = online_main_menu_text_container pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement PARENT = main_menu_anchor Id = online_info_pane_container pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement PARENT = online_info_pane_container Id = online_info_pane_text_container pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite Id = online_frame PARENT = online_main_menu_container tex = Online_Frame_Large pos = ($online_main_menu_pos) Dims = (660.0, 480.0) just = [Center top] Z = 2
	displaySprite Id = Online_Frame_Crown PARENT = online_main_menu_container tex = Online_Frame_Crown pos = (($online_main_menu_pos) + (0.0, -62.0)) Dims = (256.0, 105.0) just = [Center top] Z = 3
	displaySprite Id = motd_top PARENT = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = ($online_info_pane_pos) Dims = (320.0, 64.0) just = [Center top] Z = 5
	displaySprite Id = motd_top_fill PARENT = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = ($online_info_pane_pos) Dims = (320.0, 64.0) just = [Center top] Z = 5
	displaySprite Id = motd_body PARENT = online_info_pane_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 64.0)) Dims = (320.0, 256.0) just = [Center top] Z = 5 flip_h
	displaySprite Id = motd_body_fill PARENT = online_info_pane_container tex = window_fill_body_large rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 64.0)) Dims = (320.0, 256.0) just = [Center top] Z = 5 flip_h
	displaySprite Id = motd_end PARENT = online_info_pane_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (($online_info_pane_pos) + (0.0, 320.0)) Dims = (320.0, 64.0) just = [Center top] Z = 5 flip_h
	displaySprite Id = motd_end_fill PARENT = online_info_pane_container tex = window_fill_cap rgba = [0 0 0 200] pos = (($online_info_pane_pos) + (0.0, 320.0)) Dims = (320.0, 64.0) just = [Center top] Z = 5 flip_h
	displaySprite Id = info_divide PARENT = online_info_pane_text_container tex = store_frame_bottom_bg rgba = ($online_light_blue) pos = (($online_info_pane_pos) + (-5.0, 240.0)) Dims = (320.0, 56.0) just = [Center Center] Z = 6
	if isxenon
		createScreenElement {
			Type = textElement
			PARENT = online_main_menu_text_container
			Id = online_title
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($online_dark_purple)
			pos = (($online_main_menu_pos) + (0.0, 35.0))
			Text = <menu_title_xenon>
			just = [Center top]
			z_priority = 4.0
		}
	else
		createScreenElement {
			Type = textElement
			PARENT = online_main_menu_text_container
			Id = online_title
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($online_dark_purple)
			pos = (($online_main_menu_pos) + (0.0, 35.0))
			Text = <menu_title_ps3>
			just = [Center top]
			z_priority = 4.0
		}
	endif
	getScreenElementDims Id = <Id>
	if (<width> > 420)
		setScreenElementProps {
			Id = <Id>
			scale = 1.0
		}
		scale_element_to_size {
			Id = <Id>
			target_width = 420
			target_height = <Height>
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Quick Match"
		info_text_index = 0
		pad_choose_script = online_menu_select_quickmatch_player
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Browse Matches"
		info_text_index = 2
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_custom_match}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Join Private Match"
		info_text_index = 3
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_join_private}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Create Match"
		info_text_index = 4
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_create_match}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Quick Match Player Options"
		info_text_index = 5
		pad_choose_script = online_menu_select_options
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Leaderboards"
		info_text_index = 6
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_leaderboards}
	}
	if isxenon
		net_add_item_to_main_menu {
			VMenu = <vmenu_id>
			Text = "Downloadable Content"
			info_text_index = 7
			pad_choose_script = null_script
			pad_choose_script2 = Soundevent
			choose_script_params2 = {Event = ui_sfx_select}
		}
	endif
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Message Of The Day"
		info_text_index = 8
		pad_choose_script = online_menu_select_motd
		pad_choose_script2 = Soundevent
		choose_script_params2 = {Event = ui_sfx_select}
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Account Management"
		info_text_index = 9
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = select_account_management}
		pad_choose_script2 = Soundevent
		choose_script_params2 = {Event = ui_sfx_select}
	}
	createScreenElement {
		Type = textblockelement
		PARENT = online_info_pane_text_container
		Id = help_info_text_block
		font = text_a4
		scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		Text = ($info_text [0])
		just = [Center top]
		internal_just = [Center top]
		z_priority = 6.0
		pos = (($online_info_pane_pos) + (-4.0, 20.0))
		Dims = (320.0, 370.0)
	}
	createScreenElement {
		Type = textElement
		PARENT = online_info_pane_text_container
		Id = motd_info_pane_title
		font = text_a4
		Text = "Message of the Day"
		scale = 0.65000004
		rgba = ($online_light_blue)
		pos = (($online_info_pane_pos) + (0.0, 264.0))
		just = [Center top]
		z_priority = 6.0
	}
	createScreenElement {
		Type = WindowElement
		PARENT = online_info_pane_text_container
		Id = motd_ticker_window
		pos = (($online_info_pane_pos) + (0.0, 312.0))
		Dims = (248.0, 32.0)
		just = [Center top]
	}
	createScreenElement {
		Type = textblockelement
		PARENT = motd_ticker_window
		Id = motd_ticker_text_block
		just = [Left top]
		internal_just = [Left top]
		pos = (0.0, 0.0)
		scale = (0.75, 0.55)
		Text = ""
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		Dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	SpawnScriptNOw \{get_motd_and_start_ticker}
	if NOT isxenon
		if NOT NetSessionfunc \{Obj = voice func = voice_allowed}
			createScreenElement {
				Type = textblockelement
				PARENT = online_info_pane_container
				just = [Center top]
				internal_just = [Center top]
				pos = (640.0, 585.0)
				scale = (0.55, 0.55)
				Text = "Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions."
				font = text_a4
				rgba = ($online_light_blue)
				z_priority = 6.0
				Dims = (1500.0, 120.0)
			}
		endif
	endif
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	launchevent Type = focus Target = <vmenu_id>
endscript

script destroy_online_main_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenelementExists \{Id = main_menu_anchor}
		DestroyScreenelement \{Id = main_menu_anchor}
	endif
	killspawnedScript \{Name = scroll_motd_ticker}
endscript

script create_online_main_menu_helper_buttons 
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
endscript

script get_motd_and_start_ticker 
	if ($retrieved_message_of_the_day = 0)
		NetSessionfunc \{Obj = MOTD func = get_demonware_motd Params = {callback = motd_callback}}
	else
		motd_ticker_text_block :SetProps Text = ($message_of_the_day)
		SpawnScriptNOw \{scroll_motd_ticker Params = {Id = motd_ticker_text_block}}
	endif
endscript

script motd_callback 
	if gotParam \{motd_text}
		Change \{retrieved_message_of_the_day = 1}
		Change message_of_the_day = <motd_text>
		if ScreenelementExists \{Id = motd_ticker_text_block}
			motd_ticker_text_block :SetProps Text = ($message_of_the_day)
			SpawnScriptNOw \{scroll_motd_ticker Params = {Id = motd_ticker_text_block}}
		endif
	endif
endscript

script scroll_motd_ticker \{scroll_time = 20}
	<end_pos> = (-1000.0, 0.0)
	<this_ID> = <Id>
	getScreenElementChildren Id = <this_ID>
	if gotParam \{children}
		begin
		begin
		Wait \{2 Seconds}
		DoScreenElementMorph Id = <this_ID> pos = <end_pos> Time = <scroll_time>
		Wait \{5 Seconds}
		getScreenElementProps Id = <this_ID>
		setScreenElementProps Id = <this_ID> pos = <pos>
		Wait \{2.0 Seconds}
		<this_ID> :doMorph Alpha = 0 Time = 0.2
		<this_ID> :SetProps pos = (0.0, 0.0)
		Wait \{0.5 Seconds}
		<this_ID> :doMorph Alpha = 1 Time = 0.2
		break
		repeat
		repeat
	endif
endscript

script return_from_online_main_menu 
	Printf \{"--- deinitializing network layer"}
	shut_down_net_play
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script online_menu_select_quickmatch_player 
	Change \{match_type = Player}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_player}
endscript

script online_menu_select_quickmatch_ranked 
	Change \{match_type = Ranked}
	set_network_preferences
	ui_flow_manager_respond_to_action \{action = select_quickmatch_ranked}
endscript

script online_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_online_options}
endscript

script lobby_connection_lost 
	Printf \{"---lobby_connection_lost performing net cleanup"}
	EndGameNetScriptPump
	if (isHost)
		isHosting = 1
	else
		isHosting = 0
	endif
	if ($gHandlingWindowClosed = 1 || <isHosting> = 0)
		quit_network_game
		setup_sessionfuncs
		destroy_popup_warning_menu
		ui_flow_manager_respond_to_action \{action = connection_lost}
	endif
	Change \{gHandlingWindowClosed = 0}
endscript

script online_menu_select_website 
	create_link_text
	hide_unhide_menu_elements \{Id = online_info_pane_container Time = 0.2 Hide}
	Wait \{0.1 Seconds}
	hide_unhide_menu_elements \{Id = online_main_menu_text_container Time = 0.2 Hide}
	hide_unhide_menu_elements \{Id = online_main_vmenu Time = 0.2 Hide}
	translate_and_scale_online_menu
	Wait \{0.3 Seconds}
	if ScreenelementExists \{Id = gh_link_container}
		runScriptOnScreenElement \{Id = gh_link_container DoScreenElementMorph Params = {Id = gh_link_container Alpha = 1.0 Time = 0.2}}
	endif
	ghlink_vmenu :SetProps \{enable_pad_handling}
	launchevent \{Type = focus Target = ghlink_vmenu}
endscript

script online_menu_unselect_website 
	if ScreenelementExists \{Id = gh_link_container}
		runScriptOnScreenElement \{Id = gh_link_container DoScreenElementMorph Params = {Id = gh_link_container Alpha = 0.0 Time = 0.2}}
	endif
	Wait \{0.3 Seconds}
	if ScreenelementExists \{Id = gh_link_container}
		DestroyScreenelement \{Id = gh_link_container}
	endif
	translate_and_scale_online_menu \{revert}
	hide_unhide_menu_elements \{Id = online_main_menu_text_container Time = 0.2}
	hide_unhide_menu_elements \{Id = online_main_vmenu Time = 0.2}
	Wait \{0.1 Seconds}
	hide_unhide_menu_elements \{Id = online_info_pane_container Time = 0.2}
	Wait \{0.3 Seconds}
	launchevent \{Type = focus Target = online_main_vmenu}
endscript

script create_link_text 
	createScreenElement \{Type = containerElement PARENT = online_main_menu_container Id = gh_link_container pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = gh_link_container Id = ghlink just = [Center top] Dims = (400.0, 480.0) pos = (320.0, 200.0) z_priority = 1}
	createScreenElement {
		Type = VMenu
		PARENT = ghlink
		Id = ghlink_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back Soundevent Params = {Event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_website}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<Id> :SetProps disable_pad_handling
	createScreenElement {
		Type = textElement
		PARENT = gh_link_container
		Id = gh_link_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		Text = "www.guitarhero.com"
		just = [Center top]
		pos = (640.0, 111.0)
		z_priority = 4.0
	}
	createScreenElement {
		Type = textblockelement
		PARENT = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "Ready to Be A Guitar Hero? \\nHere's how to link your stats to the web community:"
		just = [Center top]
		internal_just = [Center top]
		z_priority = 6.0
		pos = (640.0, 160.0)
		Dims = (950.0, 200.0)
	}
	createScreenElement {
		Type = textblockelement
		PARENT = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "- Go to www.guitarhero.com\\n- Create a New Account or Login\\n- Click 'Link Account'\\n- Enter the following VIP Passcode"
		just = [Center top]
		internal_just = [Left top]
		z_priority = 6.0
		pos = (640.0, 240.0)
		Dims = (1010.0, 600.0)
	}
	NetSessionfunc \{func = get_agora_token}
	formatText Textname = vip_code "%a" A = <Token>
	createScreenElement {
		Type = textElement
		PARENT = gh_link_container
		font = text_a3
		scale = 1.25
		rgba = ($online_light_blue)
		Text = <vip_code>
		just = [Center top]
		z_priority = 6.0
		pos = (640.0, 410.0)
		font_spacing = 5
	}
	createScreenElement {
		Type = textblockelement
		PARENT = gh_link_container
		font = text_a4
		scale = (0.75, 0.75)
		rgba = ($online_light_blue)
		Text = "On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!"
		just = [Center top]
		internal_just = [Left top]
		z_priority = 6.0
		pos = (648.0, 460.0)
		Dims = (1010.0, 600.0)
	}
	if ScreenelementExists \{Id = gh_link_container}
		runScriptOnScreenElement \{Id = gh_link_container DoScreenElementMorph Params = {Id = gh_link_container Alpha = 0.0}}
	endif
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	launchevent \{Type = unfocus Target = online_main_vmenu}
endscript

script online_menu_select_motd 
	create_motd_text
	hide_unhide_menu_elements \{Id = online_main_menu_container Time = 0.2 Hide}
	hide_unhide_menu_elements \{Id = online_main_vmenu Time = 0.2 Hide}
	Wait \{0.1 Seconds}
	hide_unhide_menu_elements \{Id = online_info_pane_text_container Time = 0.2 Hide}
	translate_and_scale_info_pane
	Wait \{0.3 Seconds}
	if ScreenelementExists \{Id = motd_container}
		runScriptOnScreenElement \{Id = motd_container DoScreenElementMorph Params = {Id = motd_container Alpha = 1.0 Time = 0.2}}
	endif
	launchevent \{Type = focus Target = motd_vmenu}
	motd_vmenu :SetProps \{enable_pad_handling}
endscript

script online_menu_unselect_motd 
	if ScreenelementExists \{Id = motd_container}
		runScriptOnScreenElement \{Id = motd_container DoScreenElementMorph Params = {Id = motd_container Alpha = 0.0 Time = 0.2}}
	endif
	Wait \{0.3 Seconds}
	destroy_menu \{menu_id = motd_scroller}
	if ScreenelementExists \{Id = motd_container}
		DestroyScreenelement \{Id = motd_container}
	endif
	translate_and_scale_info_pane \{revert}
	hide_unhide_menu_elements \{Id = online_info_pane_text_container Time = 0.2}
	Wait \{0.1 Seconds}
	hide_unhide_menu_elements \{Id = online_main_vmenu Time = 0.2}
	hide_unhide_menu_elements \{Id = online_main_menu_container Time = 0.2}
	Wait \{0.3 Seconds}
	launchevent \{Type = focus Target = online_main_vmenu}
endscript

script create_motd_text 
	createScreenElement \{Type = containerElement PARENT = online_info_pane_container Id = motd_container pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = motd_container Id = motd_scroller just = [Center top] Dims = (400.0, 480.0) pos = (640.0, 0.0) z_priority = 1}
	createScreenElement {
		Type = VMenu
		PARENT = motd_scroller
		Id = motd_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (400.0, 480.0)
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_back Soundevent Params = {Event = Generic_Menu_Back_SFX}}
			{pad_back online_menu_unselect_motd}
			{pad_back clean_up_user_control_helpers}
			{pad_back create_online_main_menu_helper_buttons}
		]
	}
	<Id> :SetProps disable_pad_handling
	createScreenElement {
		Type = textElement
		PARENT = motd_container
		Id = gh_link_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_light_blue)
		Text = "Message Of The Day"
		just = [Center top]
		pos = (640.0, 160.0)
		z_priority = 10.0
	}
	createScreenElement \{Type = WindowElement PARENT = motd_container Id = motd_info_scroll_window pos = (633.0, 220.0) Dims = (500.0, 300.0) just = [Center top]}
	createScreenElement {
		Type = textblockelement
		PARENT = motd_info_scroll_window
		Id = motd_info_text_block
		just = [Left top]
		internal_just = [Left top]
		pos = (0.0, 0.0)
		scale = (0.75, 0.55)
		Text = ($message_of_the_day)
		font = text_a4
		rgba = ($online_light_blue)
		z_priority = 100
		Dims = (670.0, 1500.0)
		line_spacing = 1.0
	}
	SpawnScriptNOw \{scroll_motd_info Params = {Id = motd_info_text_block}}
	if ScreenelementExists \{Id = motd_container}
		motd_container :SetProps \{Alpha = 0.0}
	endif
	clean_up_user_control_helpers
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	launchevent \{Type = unfocus Target = online_main_vmenu}
endscript

script scroll_motd_info \{scroll_time = 60}
	<end_pos> = (0.0, -1000.0)
	<this_ID> = <Id>
	getScreenElementChildren Id = <this_ID>
	if gotParam \{children}
		getArraySize (<children>)
		<line_nums> = <array_Size>
	else
		return
	endif
	if (<line_nums> > 10)
		begin
		begin
		Wait \{5 Seconds}
		DoScreenElementMorph Id = <this_ID> pos = <end_pos> Time = <scroll_time>
		Wait ((<line_nums> - 10) * 1.8) Seconds
		getScreenElementProps Id = <this_ID>
		setScreenElementProps Id = <this_ID> pos = <pos>
		Wait \{4.0 Seconds}
		<this_ID> :doMorph Alpha = 0 Time = 0.2
		<this_ID> :SetProps pos = (0.0, 0.0)
		Wait \{0.5 Seconds}
		<this_ID> :doMorph Alpha = 1 Time = 0.2
		break
		repeat
		repeat
	endif
endscript

script translate_and_scale_online_menu 
	if NOT gotParam \{revert}
		runScriptOnScreenElement Id = online_frame DoScreenElementMorph Params = {Id = online_frame pos = (($online_main_menu_pos) + (170.0, -35.0)) Time = 0.2}
		runScriptOnScreenElement Id = Online_Frame_Crown DoScreenElementMorph Params = {Id = Online_Frame_Crown pos = (($online_main_menu_pos) + (180.0, -88.0)) Time = 0.2}
		runScriptOnScreenElement \{Id = online_frame scale_element_to_size Params = {Id = online_frame target_width = 760 target_height = 500 Time = 0.2}}
	else
		runScriptOnScreenElement Id = online_frame DoScreenElementMorph Params = {Id = online_frame pos = ($online_main_menu_pos) Time = 0.2}
		runScriptOnScreenElement Id = Online_Frame_Crown DoScreenElementMorph Params = {Id = Online_Frame_Crown pos = (($online_main_menu_pos) + (0.0, -62.0)) Time = 0.2}
		online_frame :SetProps \{scale = 1.0}
		runScriptOnScreenElement \{Id = online_frame scale_element_to_size Params = {Id = online_frame target_width = 660 target_height = 480 Time = 0.2}}
	endif
endscript

script translate_and_scale_info_pane 
	if NOT gotParam \{revert}
		runScriptOnScreenElement Id = motd_top DoScreenElementMorph Params = {Id = motd_top pos = (($online_info_pane_pos) + (-250.0, -32.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_top_fill DoScreenElementMorph Params = {Id = motd_top_fill pos = (($online_info_pane_pos) + (-250.0, -32.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_body DoScreenElementMorph Params = {Id = motd_body pos = (($online_info_pane_pos) + (-250.0, 64.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_body_fill DoScreenElementMorph Params = {Id = motd_body_fill pos = (($online_info_pane_pos) + (-250.0, 64.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_end DoScreenElementMorph Params = {Id = motd_end pos = (($online_info_pane_pos) + (-250.0, 320.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_end_fill DoScreenElementMorph Params = {Id = motd_end_fill pos = (($online_info_pane_pos) + (-250.0, 320.0)) Time = 0.2}
		runScriptOnScreenElement \{Id = motd_top scale_element_to_size Params = {Id = motd_top target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_top_fill scale_element_to_size Params = {Id = motd_top_fill target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_body scale_element_to_size Params = {Id = motd_body target_width = 800 target_height = 256 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_body_fill scale_element_to_size Params = {Id = motd_body_fill target_width = 800 target_height = 256 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_end scale_element_to_size Params = {Id = motd_end target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_end_fill scale_element_to_size Params = {Id = motd_end_fill target_width = 800 target_height = 96 Time = 0.2}}
	else
		runScriptOnScreenElement Id = motd_top DoScreenElementMorph Params = {Id = motd_top pos = ($online_info_pane_pos) Time = 0.2}
		runScriptOnScreenElement Id = motd_top_fill DoScreenElementMorph Params = {Id = motd_top_fill pos = ($online_info_pane_pos) Time = 0.2}
		runScriptOnScreenElement Id = motd_body DoScreenElementMorph Params = {Id = motd_body pos = (($online_info_pane_pos) + (0.0, 64.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_body_fill DoScreenElementMorph Params = {Id = motd_body_fill pos = (($online_info_pane_pos) + (0.0, 64.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_end DoScreenElementMorph Params = {Id = motd_end pos = (($online_info_pane_pos) + (0.0, 320.0)) Time = 0.2}
		runScriptOnScreenElement Id = motd_end_fill DoScreenElementMorph Params = {Id = motd_end_fill pos = (($online_info_pane_pos) + (0.0, 320.0)) Time = 0.2}
		runScriptOnScreenElement \{Id = motd_top scale_element_to_size Params = {Id = motd_top target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_top_fill scale_element_to_size Params = {Id = motd_top_fill target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_body scale_element_to_size Params = {Id = motd_body target_width = 800 target_height = 256 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_body_fill scale_element_to_size Params = {Id = motd_body_fill target_width = 800 target_height = 256 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_end scale_element_to_size Params = {Id = motd_end target_width = 800 target_height = 96 Time = 0.2}}
		runScriptOnScreenElement \{Id = motd_end_fill scale_element_to_size Params = {Id = motd_end_fill target_width = 800 target_height = 96 Time = 0.2}}
	endif
endscript

script hide_unhide_menu_elements \{Time = 0.0}
	if ScreenelementExists Id = <Id>
		if gotParam \{Hide}
			runScriptOnScreenElement Id = <Id> DoScreenElementMorph Params = {Alpha = 0.0 Time = <Time> Id = <Id>}
		else
			runScriptOnScreenElement Id = <Id> DoScreenElementMorph Params = {Alpha = 1.0 Time = <Time> Id = <Id>}
		endif
	endif
endscript

script create_net_play_song_menu 
endscript

script destroy_net_play_song_menu 
endscript

script online_select_downloads 
	NetSessionfunc \{func = ShowMarketPlaceUI}
	wait_for_blade_complete
	SetPakManCurrentBlock \{map = Zones pak = NONE block_scripts = 1}
	destroy_band
	Downloads_UnloadContent
	ui_flow_manager_respond_to_action \{action = select_downloadable_content}
endscript

script net_add_item_to_main_menu \{line_spacing = 40}
	if gotParam \{info_text_index}
		eventParams = [
			{focus net_main_menu_focus}
			{focus setScreenElementProps Params = {Id = help_info_text_block Text = ($info_text [<info_text_index>])}}
			{unfocus net_main_menu_unfocus}
		]
	else
		eventParams = [
			{focus net_main_menu_focus}
			{unfocus net_main_menu_unfocus}
		]
	endif
	createScreenElement {
		Type = containerElement
		PARENT = <VMenu>
		Dims = ((100.0, 0.0) + (0.0, 1.0) * <line_spacing>)
		event_handlers = <eventParams>
	}
	menu_item_container = <Id>
	if gotParam \{pad_choose_script}
		if gotParam \{choose_script_params}
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script> Params = {<choose_script_params>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script>}]
		endif
	endif
	if gotParam \{pad_choose_script2}
		if gotParam \{choose_script_params2}
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2> Params = {<choose_script_params2>}}]
		else
			<menu_item_container> :SetProps event_handlers = [{pad_choose <pad_choose_script2>}]
		endif
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_item_container>
		local_id = highlightbar
		texture = White
		Dims = (450.0, 40.0)
		rgba = ($online_light_blue)
		pos = (0.0, 7.5)
		just = [Center top]
		z_priority = 3
		Alpha = 0.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_item_container>
		local_id = left_bookend
		texture = character_hub_hilite_bookend
		Dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		pos = (-227.0, 3.0)
		just = [Center top]
		z_priority = 3
		Alpha = 0.0
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <menu_item_container>
		local_id = right_bookend
		texture = character_hub_hilite_bookend
		Dims = (50.0, 50.0)
		rgba = ($online_light_blue)
		pos = (240.0, 3.0)
		just = [Center top]
		z_priority = 3
		Alpha = 0.0
	}
	createScreenElement {
		Type = textElement
		PARENT = <menu_item_container>
		local_id = Text
		font = text_a4
		scale = 0.75
		rgba = ($online_light_blue)
		Text = <Text>
		just = [Center top]
		z_priority = 4.0
	}
	getScreenElementDims Id = <Id>
	if (<width> > 420)
		setScreenElementProps {
			Id = <Id>
			scale = 1.0
		}
		scale_element_to_size {
			Id = <Id>
			target_width = 420
			target_height = <Height>
		}
	endif
	if (<Text> = "Quick Match: Ranked Match")
		getglobaltags \{user_options}
		if (<online_game_mode> = 4)
			setScreenElementProps {
				Id = <menu_item_container>
				NOT_FOCUSABLE
			}
			setScreenElementProps {
				Id = {<menu_item_container> child = Text}
				rgba = ($online_grey)
			}
		endif
	endif
endscript

script net_main_menu_focus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = highlightbar}
		setScreenElementProps {
			Id = {<objId> child = highlightbar}
			Alpha = 1.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = left_bookend}
		setScreenElementProps {
			Id = {<objId> child = left_bookend}
			Alpha = 1.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = right_bookend}
		setScreenElementProps {
			Id = {<objId> child = right_bookend}
			Alpha = 1.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = Text}
		setScreenElementProps {
			Id = {<objId> child = Text}
			rgba = ($online_dark_purple)
		}
	endif
endscript

script net_main_menu_unfocus 
	Obj_Getid
	if ScreenelementExists Id = {<objId> child = highlightbar}
		setScreenElementProps {
			Id = {<objId> child = highlightbar}
			Alpha = 0.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = left_bookend}
		setScreenElementProps {
			Id = {<objId> child = left_bookend}
			Alpha = 0.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = right_bookend}
		setScreenElementProps {
			Id = {<objId> child = right_bookend}
			Alpha = 0.0
		}
	endif
	if ScreenelementExists Id = {<objId> child = Text}
		setScreenElementProps {
			Id = {<objId> child = Text}
			rgba = ($online_light_blue)
		}
	endif
endscript
