
script create_online_server_list 
	Change \{xboxlive_num_results = 0}
	createScreenElement \{Type = VScrollingMenu PARENT = root_window Id = search_results_menu just = [Left top] Dims = (625.0, 300.0) pos = (328.0, 272.0) z_priority = 1}
	if ($gPrivateMatchId = 0)
		handlers = [
			{pad_back generic_menu_pad_back Params = {callback = menu_flow_go_back}}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_square refresh_server_list}
		]
	else
		handlers = [
			{pad_back generic_menu_pad_back Params = {callback = menu_flow_go_back}}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_square refresh_server_list}
		]
	endif
	createScreenElement {
		Type = VMenu
		PARENT = search_results_menu
		Id = search_results_vmenu
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Left top]
		Dims = (625.0, 300.0)
		event_handlers = <handlers>
	}
	create_menu_backdrop \{texture = Online_Background}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	Change \{user_control_pill_text_color = [0 0 0 255]}
	Change \{user_control_pill_color = [180 180 180 255]}
	Change \{user_control_pill_gap = 100}
	Change \{pill_helper_max_width = 90}
	setScreenElementProps \{Id = search_results_vmenu disable_pad_handling}
	launchevent \{Type = unfocus Target = search_results_vmenu}
	NetSessionfunc \{Obj = match func = stop_server_list}
	NetSessionfunc \{Obj = match func = free_server_list}
	createScreenElement \{Type = containerElement PARENT = root_window Id = search_results_container pos = (0.0, 0.0)}
	displaySprite \{Id = online_frame PARENT = search_results_container tex = Online_Frame_Large pos = (640.0, 100.0) just = [Center top] Z = 2}
	<Id> :SetTags hide_on_search = 0
	displaySprite \{Id = Online_Frame_Crown PARENT = search_results_container tex = Online_Frame_Crown pos = (640.0, 42.0) just = [Center top] Z = 2.1 Dims = (256.0, 105.0)}
	<Id> :SetTags hide_on_search = 0
	if (($ui_flow_manager_state [0]) = online_server_list_fs)
		<Title_text> = "BROWSE MATCHES"
		elseif (($ui_flow_manager_state [0]) = private_match_search_fs)
		<Title_text> = "PRIVATE MATCH"
	else
		<Title_text> = "QUICKMATCH"
	endif
	createScreenElement {
		Type = textElement
		PARENT = search_results_container
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		Text = <Title_text>
		pos = (640.0, 135.0)
		just = [Center top]
		z_priority = 2.1
	}
	<Id> :SetTags hide_on_search = 0
	if (($ui_flow_manager_state [0]) = online_server_list_fs)
		displaySprite Id = arrow_up PARENT = search_results_container tex = Online_Arrow pos = (640.0, 250.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1 flip_h
		<Id> :SetTags hide_on_search = 1
		displaySprite Id = arrow_down PARENT = search_results_container tex = Online_Arrow pos = (640.0, 590.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1
		<Id> :SetTags hide_on_search = 1
		displaySprite PARENT = search_results_container tex = White rgba = ($online_light_grey) pos = (325.0, 270.0) just = [Left top] Z = 2.1 Dims = (625.0, 30.0)
		<Id> :SetTags hide_on_search = 1
		displaySprite PARENT = search_results_container tex = White rgba = ($online_light_grey) pos = (325.0, 330.0) just = [Left top] Z = 2.1 Dims = (625.0, 30.0)
		<Id> :SetTags hide_on_search = 1
		displaySprite PARENT = search_results_container tex = White rgba = ($online_light_grey) pos = (325.0, 390.0) just = [Left top] Z = 2.1 Dims = (625.0, 30.0)
		<Id> :SetTags hide_on_search = 1
		displaySprite PARENT = search_results_container tex = White rgba = ($online_light_grey) pos = (325.0, 450.0) just = [Left top] Z = 2.1 Dims = (625.0, 30.0)
		<Id> :SetTags hide_on_search = 1
		displaySprite PARENT = search_results_container tex = White rgba = ($online_light_grey) pos = (325.0, 510.0) just = [Left top] Z = 2.1 Dims = (625.0, 30.0)
		<Id> :SetTags hide_on_search = 1
		if isxenon
			createScreenElement {
				Type = textElement
				PARENT = search_results_container
				font = fontgrid_title_gh3
				scale = (0.7, 0.75)
				rgba = ($online_light_blue)
				Text = "HOST"
				just = [Left top]
				pos = (320.0, 210.0)
				z_priority = 2.1
			}
		else
			createScreenElement {
				Type = textElement
				PARENT = search_results_container
				font = fontgrid_title_gh3
				scale = (0.7, 0.75)
				rgba = ($online_light_blue)
				Text = "NAME"
				just = [Left top]
				pos = (320.0, 210.0)
				z_priority = 2.1
			}
		endif
		fit_text_into_menu_item Id = <Id> max_width = 225
		<Id> :SetTags hide_on_search = 1
		createScreenElement {
			Type = textElement
			PARENT = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			Text = "MODE"
			just = [Left top]
			pos = (550.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item Id = <Id> max_width = 190
		<Id> :SetTags hide_on_search = 1
		createScreenElement {
			Type = textElement
			PARENT = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			Text = "SONGS"
			just = [Left top]
			pos = (750.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item Id = <Id> max_width = 100
		<Id> :SetTags hide_on_search = 1
		createScreenElement {
			Type = textElement
			PARENT = search_results_container
			font = fontgrid_title_gh3
			scale = (0.7, 0.75)
			rgba = ($online_light_blue)
			Text = "SIGNAL"
			just = [Left top]
			pos = (860.0, 210.0)
			z_priority = 2.1
		}
		fit_text_into_menu_item Id = <Id> max_width = 100
		<Id> :SetTags hide_on_search = 1
		if ScreenelementExists \{Id = search_results_container}
			getScreenElementChildren \{Id = search_results_container}
			if gotParam \{children}
				getArraySize \{children}
				I = 0
				begin
				if ScreenelementExists Id = (<children> [<I>])
					(<children> [<I>]) :getTags
					if (<hide_on_search> = 1)
						(<children> [<I>]) :SetProps preserve_flip Alpha = 0.0
					endif
					<I> = (<I> + 1)
				endif
				repeat <array_Size>
			endif
		endif
		get_custom_match_search_params
		NetSessionfunc Obj = match func = set_search_params Params = <...>
		NetSessionfunc \{Obj = match func = set_server_list_mode Params = {optimatch}}
		search_results_vmenu :SetTags \{search_type = custom_search}
		elseif (($ui_flow_manager_state [0]) = private_match_search_fs)
		get_private_match_search_params
		NetSessionfunc Obj = match func = set_search_params Params = <...>
		NetSessionfunc \{Obj = match func = set_server_list_mode Params = {quickmatch}}
		search_results_vmenu :SetTags \{search_type = quickmatch_search}
	else
		get_quick_match_search_params
		NetSessionfunc Obj = match func = set_search_params Params = <...>
		NetSessionfunc \{Obj = match func = set_server_list_mode Params = {quickmatch}}
		search_results_vmenu :SetTags \{search_type = quickmatch_search}
	endif
	NetSessionfunc \{Obj = match func = start_server_list}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "REFRESH" button = Blue Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	create_server_list_searching_dialog
endscript

script destroy_online_server_list 
	if ScreenelementExists \{Id = searching_dialog_container}
		DestroyScreenelement \{Id = searching_dialog_container}
	endif
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if ScreenelementExists \{Id = search_results_container}
		DestroyScreenelement \{Id = search_results_container}
	endif
	clean_up_user_control_helpers
	if ScreenelementExists \{Id = search_results_menu}
		DestroyScreenelement \{Id = search_results_menu}
	endif
	destroy_menu_backdrop
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if ScreenelementExists \{Id = searching_dialog_container}
		DestroyScreenelement \{Id = searching_dialog_container}
	endif
	destroy_pause_menu_frame
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	if ScreenelementExists \{Id = create_match_dialog_container}
		DestroyScreenelement \{Id = create_match_dialog_container}
	endif
endscript

script net_chosen_join_server 
	JoinServer <...>
	ui_flow_manager_respond_to_action \{action = select_server}
endscript

script net_choose_server 
	NetSessionfunc Obj = match func = choose_server Params = {Id = <Id>}
	ui_flow_manager_respond_to_action \{action = select_server}
endscript

script clear_search_list 
	if ScreenelementExists \{Id = search_results_vmenu}
		getScreenElementChildren \{Id = search_results_vmenu}
		if gotParam \{children}
			getArraySize \{children}
			I = 0
			begin
			if ScreenelementExists Id = (<children> [<I>])
				DestroyScreenelement Id = (<children> [<I>])
				<I> = (<I> + 1)
			endif
			repeat <array_Size>
		endif
	endif
endscript

script refresh_server_list 
	launchevent \{Type = unfocus Target = search_results_vmenu}
	if ScreenelementExists \{Id = server_list_create_match_dialog_vmenu}
		launchevent \{Type = unfocus Target = server_list_create_match_dialog_vmenu}
	endif
	if ScreenelementExists \{Id = search_results_container}
		getScreenElementChildren \{Id = search_results_container}
		if gotParam \{children}
			getArraySize \{children}
			I = 0
			begin
			if ScreenelementExists Id = (<children> [<I>])
				(<children> [<I>]) :getTags
				if (<hide_on_search> = 1)
					(<children> [<I>]) :SetProps preserve_flip Alpha = 0.0
				endif
				<I> = (<I> + 1)
			endif
			repeat <array_Size>
		endif
	endif
	if NOT ScreenelementExists \{Id = server_list_searching_dialog_menu}
		if ScreenelementExists \{Id = server_list_create_match_dialog_menu}
			destroy_server_list_create_match_dialog
		endif
		search_results_vmenu :getTags
		NetSessionfunc \{Obj = match func = stop_server_list}
		NetSessionfunc \{Obj = match func = free_server_list}
		clear_search_list
		if ($gPrivateMatchId != 0)
			get_private_match_search_params
			NetSessionfunc Obj = match func = set_search_params Params = <...>
			NetSessionfunc \{Obj = match func = set_server_list_mode Params = {quickmatch}}
			elseif (<search_type> = custom_search)
			get_custom_match_search_params
			NetSessionfunc Obj = match func = set_search_params Params = <...>
			NetSessionfunc \{Obj = match func = set_server_list_mode Params = {optimatch}}
		else
			get_quick_match_search_params
			NetSessionfunc Obj = match func = set_search_params Params = <...>
			NetSessionfunc \{Obj = match func = set_server_list_mode Params = {quickmatch}}
		endif
		NetSessionfunc \{Obj = match func = start_server_list}
		create_server_list_searching_dialog
	endif
endscript

script create_server_list_searching_dialog \{menu_id = server_list_searching_dialog_menu vmenu_id = server_list_searching_dialog_vmenu pad_back_script = searching_dialog_select_cancel}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = search_results_container
		Id = <menu_id>
		just = [Left top]
		Dims = (625.0, 300.0)
		pos = (328.0, 450.0)
		z_priority = 2.1
	}
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (625.0, 300.0)
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	}
	createScreenElement \{Type = containerElement PARENT = search_results_container Id = searching_dialog_container pos = (0.0, 0.0)}
	displaySprite Id = search_arrow_up PARENT = searching_dialog_container tex = Online_Arrow pos = (640.0, 424.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1 flip_h
	displaySprite Id = search_arrow_down PARENT = searching_dialog_container tex = Online_Arrow pos = (640.0, 545.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1
	createScreenElement {
		Type = textElement
		PARENT = searching_dialog_container
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = ($online_light_blue)
		Text = "Finding sessions"
		just = [Center top]
		z_priority = 2.1
		pos = (640.0, 300.0)
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
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_stop Text = "STOP"
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = searching_dialog_select_cancel Text = "CANCEL"
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = (online_light_blue)
	if ScreenelementExists \{Id = dots_text}
		runScriptOnScreenElement \{Id = dots_text animate_dots Params = {Id = dots_text}}
	endif
	launchevent \{Type = focus Target = server_list_searching_dialog_vmenu}
endscript

script destroy_server_list_searching_dialog 
	destroy_menu \{menu_id = server_list_searching_dialog_menu}
	if ScreenelementExists \{Id = searching_dialog_container}
		DestroyScreenelement \{Id = searching_dialog_container}
	endif
endscript

script searching_dialog_select_stop 
	xboxlive_menu_optimatch_results_stop
endscript

script searching_dialog_select_cancel 
	destroy_server_list_searching_dialog
	NetSessionfunc \{Obj = match func = stop_server_list}
	NetSessionfunc \{Obj = match func = free_server_list}
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript

script create_server_list_create_match_dialog \{menu_id = server_list_create_match_dialog_menu vmenu_id = server_list_create_match_dialog_vmenu}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = search_results_container
		Id = <menu_id>
		just = [Left top]
		Dims = (625.0, 300.0)
		pos = (328.0, 450.0)
		z_priority = 2.1
	}
	if ($gPrivateMatchId = 0)
		handlers = [
			{pad_back create_match_dialog_select_cancel}
			{pad_square refresh_server_list}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	else
		handlers = [
			{pad_back create_match_dialog_select_back}
			{pad_square refresh_server_list}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	endif
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = (0.0, 0.0)
		just = [Left top]
		internal_just = [Center top]
		Dims = (625.0, 300.0)
		event_handlers = <handlers>
	}
	createScreenElement \{Type = containerElement PARENT = search_results_container Id = create_match_dialog_container pos = (0.0, 0.0)}
	createScreenElement {
		Type = textblockelement
		PARENT = create_match_dialog_container
		font = fontgrid_title_gh3
		scale = (0.65000004, 0.65000004)
		rgba = ($online_light_blue)
		Text = "No sessions are available.\\nWould you like to\\ncreate a match?"
		just = [Center top]
		internal_just = [Center top]
		z_priority = 2.1
		pos = (640.0, 275.0)
		Dims = (600.0, 370.0)
	}
	displaySprite Id = search_arrow_up PARENT = create_match_dialog_container tex = Online_Arrow pos = (640.0, 424.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1 flip_h
	displaySprite Id = search_ arrow_down PARENT = create_match_dialog_container tex = Online_Arrow pos = (640.0, 545.0) Dims = (44.0, 32.0) rgba = ($online_light_blue) just = [Center Center] Z = 2.1
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_create Text = "CREATE MATCH"
	add_searching_menu_item vmenu_id = <vmenu_id> choose_script = create_match_dialog_select_cancel Text = "CANCEL"
	create_match_dialog_focus
endscript

script destroy_server_list_create_match_dialog 
	create_match_dialog_unfocus
	destroy_menu \{menu_id = server_list_create_match_dialog_menu}
	if ScreenelementExists \{Id = create_match_dialog_container}
		DestroyScreenelement \{Id = create_match_dialog_container}
	endif
endscript

script create_match_dialog_select_create 
	destroy_server_list_create_match_dialog
	ui_flow_manager_respond_to_action \{action = response_create_selected create_params = {menu_type = create_match}}
endscript

script create_match_dialog_select_cancel 
	destroy_server_list_create_match_dialog
	ui_flow_manager_respond_to_action \{action = response_cancel_selected}
endscript

script create_match_dialog_select_back 
	destroy_server_list_create_match_dialog
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_match_dialog_focus 
	launchevent \{Type = unfocus Target = search_results_vmenu}
	launchevent \{Type = focus Target = server_list_create_match_dialog_vmenu}
endscript

script create_match_dialog_unfocus 
	launchevent \{Type = unfocus Target = server_list_create_match_dialog_vmenu}
	launchevent \{Type = focus Target = search_results_vmenu}
endscript
dots_array = [
	" "
	"."
	". ."
	". . ."
]

script animate_dots 
	num_dots = 0
	begin
	formatText Textname = new_text "%a" A = ($dots_array [<num_dots>])
	<Id> :SetProps Text = <new_text>
	if (<num_dots> = 3)
		<num_dots> = 0
	else
		<num_dots> = (<num_dots> + 1)
	endif
	Wait \{0.5 Second}
	repeat
endscript
