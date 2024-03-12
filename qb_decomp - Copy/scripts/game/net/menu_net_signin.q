loginTextColor = [
	255
	200
	0
	255
]
gPrivateMatchId = 0

script create_winport_connection_status_screen 
	Printf \{"--- create_winport_connection_status_screen"}
	create_menu_backdrop \{texture = Online_Background}
	Z = 110
	createScreenElement \{Type = containerElement PARENT = root_window Id = connectionStatusContainer pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = connectionStatusContainer just = [Center top] Dims = (500.0, 150.0) pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		pos = (298.0, 0.0)
		just = [Center top]
		internal_just = [Center top]
		Dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back cancel_winport_connection_status_screen}
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame \{PARENT = connectionStatusContainer Z = 5}
	displaySprite \{PARENT = connectionStatusContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Right top] flip_v}
	displaySprite \{PARENT = connectionStatusContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Left top]}
	createScreenElement \{Type = textElement PARENT = connectionStatusContainer font = fontgrid_title_gh3 scale = 1.2 rgba = [223 223 223 250] Text = "Online" just = [Center top] z_priority = 10.0 pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
	createScreenElement {
		Type = textblockelement
		PARENT = connectionStatusContainer
		Id = statusMessage
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [Center top]
		internal_just = [Center top]
		internal_scale = <scale>
		z_priority = <Z>
		pos = (640.0, 310.0)
		Dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	if NOT (NetSessionfunc func = IsConnected)
		add_user_control_helper \{Text = "CANCEL" button = Red Z = 100}
		launchevent Type = focus Target = <vmenu_id>
		NetSessionfunc \{func = OnlineSignIn}
		begin
		NetSessionfunc \{func = GetNetworkStatus}
		switch (<CurrentNetworkTask>)
			case "START_NETWORK"
			switch (<CurrentNetworkStatus>)
				case "PENDING"
				statusText = "Initializing Online Services"
				case "DONE"
				statusText = "Online Services Ready"
				case "FAILED"
				statusText = "Unable to Initialize Online Services"
				success = FALSE
				default
				statusText = "Internal Error: Unexpected Network State!"
				success = FALSE
			endswitch
			case "CHECK_DNS"
			switch (<CurrentNetworkStatus>)
				case "PENDING"
				statusText = "Locating Game Servers"
				case "DONE"
				statusText = "Game Servers Located"
				success = TRUE
				case "FAILED"
				statusText = "Unable to locate Game Servers"
				success = FALSE
				default
				statusText = "Internal Error: Unexpected Network State!"
				success = FALSE
			endswitch
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		setScreenElementProps Id = statusMessage Text = <statusText>
		fit_text_into_menu_item \{Id = statusMessage max_width = 480}
		if gotParam \{success}
			clean_up_user_control_helpers
			if (<success> = FALSE)
				add_user_control_helper \{Text = "BACK" button = Red Z = 100}
				return
			endif
			break
		endif
		Wait \{1 Frame}
		if NOT (ScreenelementExists Id = connectionStatusContainer)
			return
		endif
		repeat
	endif
	if NOT (NetSessionfunc func = HasExistingLogin)
		setScreenElementProps \{Id = statusMessage Text = "Existing Login Not Found.\\nDo you want to Create a New Account or Use an Existing Account?"}
		fit_text_into_menu_item \{Id = statusMessage max_width = 480}
		displaySprite \{PARENT = connectionStatusContainer Id = options_bg_1 tex = Dialog_BG pos = (640.0, 500.0) Dims = (320.0, 64.0) Z = 9 just = [Center botom]}
		displaySprite \{PARENT = connectionStatusContainer Id = options_bg_2 tex = Dialog_BG pos = (640.0, 530.0) Dims = (320.0, 64.0) Z = 9 just = [Center top] flip_h}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			Dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose start_winport_account_create_screen}
				{pad_back cancel_winport_connection_status_screen}
			]
		}
		container_id = <Id>
		createScreenElement {
			Type = textElement
			PARENT = <container_id>
			local_id = Text
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($menu_unfocus_color)
			Text = "NEW ACCOUNT"
			just = [Center top]
			z_priority = (<Z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		getScreenElementDims Id = <Id>
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Right Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Left Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
		}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			Dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose start_winport_account_login_screen}
				{pad_back cancel_winport_connection_status_screen}
			]
		}
		container_id = <Id>
		createScreenElement {
			Type = textElement
			PARENT = <container_id>
			local_id = Text
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($menu_unfocus_color)
			Text = "EXISTING ACCOUNT"
			just = [Center top]
			z_priority = (<Z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		getScreenElementDims Id = <Id>
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Right Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Left Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
		}
		add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
		add_user_control_helper \{Text = "BACK" button = Red Z = 100}
		add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
		launchevent Type = focus Target = <vmenu_id>
		return
	endif
	if NOT (NetSessionfunc func = IsLoggedIn)
		ui_flow_manager_respond_to_action \{action = account_login}
	endif
	ui_flow_manager_respond_to_action \{action = goto_online_menu}
endscript

script destroy_winport_connection_status_screen 
	DestroyScreenelement \{Id = connectionStatusContainer}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_connection_status_screen 
	NetSessionfunc \{func = ResetNetwork}
	ui_flow_manager_respond_to_action \{action = Back}
endscript

script create_winport_account_create_screen 
	create_winport_account_management_screen \{mode = createAccount title = "Account Creation" Container = accountCreateContainer}
endscript

script destroy_winport_account_create_screen 
	destroy_winport_account_management_screen \{Container = accountCreateContainer}
endscript

script start_winport_account_create_screen 
	ui_flow_manager_respond_to_action \{action = account_create}
endscript

script create_winport_account_login_screen 
	NetSessionfunc \{func = GetAutoLoginSetting}
	if (<autoLoginSetting> = autoLoginOn && NetSessionfunc func = HasExistingLogin)
		NetSessionfunc \{func = InitializeLoginFields Params = {loginMode = loginAccount}}
		ui_flow_manager_respond_to_action \{action = executeLogin}
	else
		create_winport_account_management_screen \{mode = loginAccount title = "Account Login" Container = accountLoginContainer yellowButtonText = "CHANGE PASSWORD" yellowButtonAction = start_winport_account_change_screen blueButtonText = "NEW ACCOUNT" blueButtonAction = start_winport_account_create_screen}
	endif
endscript

script destroy_winport_account_login_screen 
	destroy_winport_account_management_screen \{Container = accountLoginContainer}
endscript

script start_winport_account_login_screen 
	ui_flow_manager_respond_to_action \{action = account_login}
endscript

script create_winport_account_change_screen 
	create_winport_account_management_screen \{mode = changeAccount title = "Change Password" Container = accountChangeContainer yellowButtonText = "RESET PASSWORD" yellowButtonAction = start_winport_account_reset_screen}
endscript

script destroy_winport_account_change_screen 
	destroy_winport_account_management_screen \{Container = accountChangeContainer}
endscript

script start_winport_account_change_screen 
	ui_flow_manager_respond_to_action \{action = account_change}
endscript

script create_winport_account_reset_screen 
	create_winport_account_management_screen \{mode = resetAccount title = "Reset Password" Container = accountResetContainer yellowButtonText = "DELETE ACCOUNT" yellowButtonAction = start_winport_account_delete_screen}
endscript

script destroy_winport_account_reset_screen 
	destroy_winport_account_management_screen \{Container = accountResetContainer}
endscript

script start_winport_account_reset_screen 
	ui_flow_manager_respond_to_action \{action = account_reset}
endscript

script create_winport_account_delete_screen 
	create_winport_account_management_screen \{mode = deleteAccount title = "Delete Account" Container = accountDeleteContainer}
endscript

script destroy_winport_account_delete_screen 
	destroy_winport_account_management_screen \{Container = accountDeleteContainer}
endscript

script start_winport_account_delete_screen 
	ui_flow_manager_respond_to_action \{action = account_delete}
endscript

script create_change_password_submenu 
	create_winport_account_management_screen \{mode = changeAccount title = "Change Password" Container = accountChangeContainer yellowButtonAction = winport_null_action}
endscript

script destroy_change_password_submenu 
	destroy_winport_account_management_screen \{Container = accountChangeContainer}
endscript

script create_account_delete_submenu 
	create_winport_account_management_screen \{mode = deleteAccount title = "Delete Account" Container = accountDeleteSubmenuContainer yellowButtonAction = winport_null_action}
endscript

script destroy_account_delete_submenu 
	destroy_winport_account_management_screen \{Container = accountDeleteSubmenuContainer}
endscript

script winport_null_action 
endscript

script create_winport_account_management_screen 
	Printf \{"--- create_winport_account_management_screen"}
	Z = 110
	create_menu_backdrop \{texture = Online_Background}
	if ((gotParam yellowButtonAction) && (gotParam blueButtonAction))
		handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = executeLogin}}
			{pad_option2 <yellowButtonAction>}
			{pad_option <blueButtonAction>}
			{pad_back cancel_winport_account_management_screen Params = {mode = <mode>}}
		]
		elseif (gotParam yellowButtonAction)
		handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = executeLogin}}
			{pad_option2 <yellowButtonAction>}
			{pad_back cancel_winport_account_management_screen Params = {mode = <mode>}}
		]
		elseif (gotParam blueButtonAction)
		handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = executeLogin}}
			{pad_option <blueButtonAction>}
			{pad_back cancel_winport_account_management_screen Params = {mode = <mode>}}
		]
	else
		handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = executeLogin}}
			{pad_back cancel_winport_account_management_screen Params = {mode = <mode>}}
		]
	endif
	createScreenElement {
		Type = containerElement
		PARENT = root_window
		Id = <Container>
		pos = (0.0, 0.0)
		event_handlers = <handlers>
	}
	NetSessionfunc func = InitializeLoginFields Params = {loginMode = <mode>}
	displaySprite PARENT = <Container> tex = Dialog_Title_BG Dims = (300.0, 230.0) Z = 9 pos = (640.0, 40.0) just = [Right top] flip_v
	displaySprite PARENT = <Container> tex = Dialog_Title_BG Dims = (300.0, 230.0) Z = 9 pos = (640.0, 40.0) just = [Left top]
	createScreenElement {
		Type = textElement
		PARENT = <Container>
		font = fontgrid_title_gh3
		scale = 1.0
		rgba = [223 223 223 250]
		Text = <title>
		just = [Center top]
		z_priority = 10.0
		pos = (640.0, 125.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle Id = <Id> Dims = (400.0, 75.0) pos = (640.0, 125.0) only_if_larger_x = 1 only_if_larger_y = 1 just = Center
	createScreenElement {
		Type = textElement
		PARENT = <Container>
		Id = capsLockField
		font = text_a4
		scale = 0.6
		rgba = [255 0 0 255]
		Text = "(Caps Lock Is On)"
		just = [Center top]
		z_priority = 10.0
		pos = (640.0, 530.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textElement
		PARENT = <Container>
		font = text_a4
		scale = 0.6
		rgba = [180 180 180 255]
		Text = "Game Experience May Change During Online Play"
		just = [Center top]
		z_priority = 10.0
		pos = (640.0, 560.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textElement
		PARENT = <Container>
		font = text_a4
		scale = 1.0
		rgba = [180 180 180 255]
		Text = "*Please use the keyboard to enter all account information*"
		just = [Center top]
		z_priority = 10.0
		pos = (640.0, 595.0)
		Shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	fit_text_in_rectangle Id = <Id> Dims = (600.0, 25.0) pos = (640.0, 595.0) only_if_larger_x = 1 only_if_larger_y = 1 just = Center keep_ar = 1
	<pos> = (375.0, 290.0)
	create_winport_login_field Container = <Container> pos = <pos> label = "Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	getScreenElementDims \{Id = usernameLabelId}
	lineHeight = (<Height> + 8)
	if (<mode> = loginAccount || <mode> = deleteAccount || <mode> = changeAccount)
		pos = (<pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field Container = <Container> pos = <pos> label = "Password: " labelId = passwordLabelId prefixId = passwordPrefixId cursorId = passwordCursorId suffixId = passwordSuffixId ang = 0.2
	endif
	if (<mode> = createAccount || <mode> = changeAccount || <mode> = resetAccount)
		pos = (<pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field Container = <Container> pos = <pos> label = "New Password: " labelId = newPassword1LabelId prefixId = newPassword1PrefixId cursorId = newPassword1CursorId suffixId = newPassword1SuffixId ang = -0.6
		pos = (<pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field Container = <Container> pos = <pos> label = "Repeat New Password: " labelId = newPassword2LabelId prefixId = newPassword2PrefixId cursorId = newPassword2CursorId suffixId = newPassword2SuffixId ang = 0.5
	endif
	if (<mode> = createAccount || <mode> = resetAccount)
		pos = (<pos> + ((0.0, 1.0) * <lineHeight>))
		create_winport_login_field Container = <Container> pos = <pos> label = "License: " labelId = licenseLabelId prefixId = licensePrefixId cursorId = licenseCursorId suffixId = licenseSuffixId ang = 1.5
	endif
	add_user_control_helper \{Text = "ACCEPT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	if gotParam \{yellowButtonText}
		add_user_control_helper Text = <yellowButtonText> button = Yellow Z = 100
	endif
	if gotParam \{blueButtonText}
		add_user_control_helper Text = <blueButtonText> button = Blue Z = 100
	endif
	launchevent Type = focus Target = <Container>
	begin
	if (IsCapsLockOn)
		setScreenElementProps \{Id = capsLockField Alpha = 1.0}
	else
		setScreenElementProps \{Id = capsLockField Alpha = 0.0}
	endif
	update_winport_login_field \{Field = username labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId}
	update_winport_login_field \{Field = password labelId = passwordLabelId prefixId = passwordPrefixId cursorId = passwordCursorId suffixId = passwordSuffixId}
	update_winport_login_field \{Field = newPassword1 labelId = newPassword1LabelId prefixId = newPassword1PrefixId cursorId = newPassword1CursorId suffixId = newPassword1SuffixId}
	update_winport_login_field \{Field = newPassword2 labelId = newPassword2LabelId prefixId = newPassword2PrefixId cursorId = newPassword2CursorId suffixId = newPassword2SuffixId}
	update_winport_login_field \{Field = license labelId = licenseLabelId prefixId = licensePrefixId cursorId = licenseCursorId suffixId = licenseSuffixId}
	Wait \{1 Frame}
	if NOT (ScreenelementExists Id = <Container>)
		return
	endif
	NetSessionfunc \{func = GetLoginEntry}
	if (<loginEntry> = loginAccepted)
		break
	endif
	if (<loginEntry> = loginAborted)
		break
	endif
	if ((gotParam yellowButtonAction) && (<loginEntry> = loginOption1))
		Printf \{"Got yellowButtonAction button"}
		break
	endif
	if ((gotParam blueButtonAction) && (<loginEntry> = loginOption2))
		Printf \{"Got blueButtonAction button"}
		break
	endif
	repeat
	switch <loginEntry>
		case loginAccepted
		ui_flow_manager_respond_to_action \{action = executeLogin}
		case loginOption1
		Printf \{"Executing option 1"}
		ui_flow_manager_respond_to_action \{action = executeOption1}
		case loginOption2
		Printf \{"Executing option 2"}
		ui_flow_manager_respond_to_action \{action = executeOption2}
		case loginAborted
		cancel_winport_account_management_screen mode = <mode>
	endswitch
endscript

script destroy_winport_account_management_screen 
	NetSessionfunc \{func = DestroyLoginFields}
	if (ScreenelementExists Id = <Container>)
		DestroyScreenelement Id = <Container>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script cancel_winport_account_management_screen 
	if (<mode> = loginAccount)
		if (NetSessionfunc func = HasExistingLogin)
			ui_flow_manager_respond_to_action \{action = back_to_main}
		else
			ui_flow_manager_respond_to_action \{action = back_to_connection_status}
		endif
	else
		ui_flow_manager_respond_to_action \{action = Back}
	endif
endscript

script create_winport_login_field 
	createScreenElement {
		Type = containerElement
		PARENT = <Container>
		Rot_Angle = <ang>
	}
	rotContainer = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <rotContainer>
		Id = <labelId>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $loginTextColor
		Text = <label>
		just = [Left top]
		z_priority = 10.0
		pos = <pos>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textElement
		PARENT = <rotContainer>
		Id = <prefixId>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $loginTextColor
		Text = ""
		just = [Left top]
		z_priority = 10.0
		pos = (300.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textElement
		PARENT = <rotContainer>
		Id = <cursorId>
		font = fontgrid_title_gh3
		scale = (0.5, 0.8)
		rgba = $loginTextColor
		Text = "I"
		just = [Left top]
		z_priority = 10.0
		pos = (400.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	createScreenElement {
		Type = textElement
		PARENT = <rotContainer>
		Id = <suffixId>
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = $loginTextColor
		Text = ""
		just = [Left top]
		z_priority = 10.0
		pos = (500.0, 300.0)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	runScriptOnScreenElement Id = <cursorId> winport_cursor_blinker Params = {blinkId = <cursorId>}
endscript

script update_winport_login_field 
	if NOT (ScreenelementExists Id = <labelId>)
		return
	endif
	NetSessionfunc func = GetLoginField Params = {Field = <Field>}
	if (<Active> = 1)
		setScreenElementProps Id = <prefixId> Text = <Prefix>
		setScreenElementProps Id = <cursorId> Text = "I"
		setScreenElementProps Id = <suffixId> Text = <suffix>
	else
		setScreenElementProps Id = <prefixId> Text = <Prefix>
		setScreenElementProps Id = <cursorId> Text = ""
		setScreenElementProps Id = <suffixId> Text = ""
	endif
	getScreenElementDims Id = <labelId>
	GetScreenElementPosition Id = <labelId>
	pos = (<ScreenELementPos> + ((1.0, 0.0) * <width>))
	setScreenElementProps Id = <prefixId> pos = <pos>
	GetScreenElementPosition Id = <prefixId>
	getScreenElementDims Id = <prefixId>
	pos = (<ScreenELementPos> + ((1.0, 0.0) * <width>))
	setScreenElementProps Id = <cursorId> pos = <pos>
	GetScreenElementPosition Id = <cursorId>
	getScreenElementDims Id = <cursorId>
	pos = (<ScreenELementPos> + ((1.0, 0.0) * <width>))
	setScreenElementProps Id = <suffixId> pos = <pos>
endscript

script winport_cursor_blinker 
	begin
	if NOT (ScreenelementExists Id = <blinkId>)
		return
	endif
	DoScreenElementMorph Id = <blinkId> Alpha = 0 Time = 0.5
	Wait \{0.5 Seconds}
	if NOT (ScreenelementExists Id = <blinkId>)
		return
	endif
	DoScreenElementMorph Id = <blinkId> Alpha = 1.0 Time = 0.5
	Wait \{0.5 Seconds}
	repeat
endscript

script create_winport_account_create_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_create_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_login_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_login_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_change_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_change_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_reset_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_reset_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_delete_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_winport_account_delete_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_account_change_submenu_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_account_change_submenu_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_account_delete_submenu_status_screen 
	create_winport_account_management_status_screen
endscript

script destroy_account_delete_submenu_status_screen 
	destroy_winport_account_management_status_screen
endscript

script create_winport_account_management_status_screen 
	Printf \{"--- create_winport_account_management_status_screen"}
	create_menu_backdrop \{texture = Online_Background}
	Z = 110
	createScreenElement \{Type = containerElement PARENT = root_window Id = accountStatusContainer pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = accountStatusContainer just = [Center top] Dims = (500.0, 150.0) pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		pos = (298.0, 0.0)
		just = [Center top]
		internal_just = [Center top]
		Dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame \{PARENT = accountStatusContainer Z = 5}
	displaySprite \{PARENT = accountStatusContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Right top] flip_v}
	displaySprite \{PARENT = accountStatusContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Left top]}
	createScreenElement \{Type = textElement PARENT = accountStatusContainer font = fontgrid_title_gh3 scale = 1.2 rgba = [223 223 223 250] Text = "Online" just = [Center top] z_priority = 10.0 pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
	createScreenElement {
		Type = textblockelement
		PARENT = accountStatusContainer
		Id = statusMessage
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [Center top]
		internal_just = [Center top]
		internal_scale = <scale>
		z_priority = <Z>
		pos = (640.0, 310.0)
		Dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	launchevent Type = focus Target = <vmenu_id>
	NetSessionfunc \{func = ExecuteLoginTask}
	begin
	NetSessionfunc \{func = GetNetworkStatus}
	switch (<CurrentNetworkTask>)
		case "CREATE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Creation"
			case "DONE"
			statusText = "Account Created"
			success = TRUE
			case "FAILED"
			statusText = "Unable to Create Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "LOGIN_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Authorizing Account"
			case "DONE"
			statusText = "Account Authorized"
			success = TRUE
			case "FAILED"
			statusText = "Unable to Authorize Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "CHANGE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Password Change"
			case "DONE"
			statusText = "Password Changed"
			success = TRUE
			case "FAILED"
			statusText = "Unable to Change Password"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "RESET_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Reset"
			case "DONE"
			statusText = "Account Password Reset"
			success = TRUE
			case "FAILED"
			statusText = "Unable to Reset Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		case "DELETE_ACCOUNT"
		switch (<CurrentNetworkStatus>)
			case "PENDING"
			statusText = "Requesting Account Deletion"
			case "DONE"
			statusText = "Account Deleted"
			success = TRUE
			case "FAILED"
			statusText = "Unable to Delete Account"
			success = FALSE
			default
			statusText = "Internal Error: Unexpected Network State!"
			success = FALSE
		endswitch
		default
		Printf "Unexpected state = %s" S = <CurrentNetworkTask>
		statusText = "Internal Error: Unexpected Network State!"
		success = FALSE
	endswitch
	setScreenElementProps Id = statusMessage Text = <statusText>
	fit_text_into_menu_item \{Id = statusMessage max_width = 480}
	if gotParam \{success}
		break
	endif
	Wait \{1 Frame}
	if NOT (ScreenelementExists Id = accountStatusContainer)
		return
	endif
	repeat
	if (<success> = FALSE)
		NetSessionfunc \{func = GetAutoLoginSetting}
		if (<autoLoginSetting> = autoLoginOn && NetSessionfunc func = HasExistingLogin)
			NetSessionfunc \{func = SetAutoLoginSetting Params = {autoLoginSetting = autoLoginPrompt}}
		endif
		NetSessionfunc \{func = GetFailureCode}
		switch <FailureCode>
			case 666
			statusText = "New password fields do not match"
			case 667
			statusText = "Authorization Service failed"
			case 668
			statusText = "Usernames must be between 6 and 16 characters long"
			case 669
			statusText = "Passwords must be between 6 and 16 characters long"
			case 700
			statusText = "Task Succeeded"
			case 701
			statusText = "Bad Authorization Request"
			case 702
			statusText = "Server Configuration Error"
			case 703
			statusText = "Invalid Game Title Id"
			case 704
			statusText = "Invalid Account Information"
			case 705
			statusText = "Illegal Authorization Request"
			case 706
			statusText = "Invalid License Code"
			case 707
			statusText = "Username Already Exists"
			case 708
			statusText = "Invalid Username Format"
			case 709
			statusText = "Username Declined"
			case 710
			statusText = "Too Many Accounts for License Code"
			case 711
			statusText = "Account Migration not Supported"
			case 712
			statusText = "Title has been disabled"
			case 713
			statusText = "Account has Expired"
			case 714
			statusText = "Account is Locked"
			case 715
			statusText = "Authentication Error: Online functions will not be available until Guitar Hero III is quit and relaunched."
			case 716
			statusText = "Incorrect Password"
		endswitch
		setScreenElementProps Id = statusMessage Text = <statusText>
		fit_text_into_menu_item \{Id = statusMessage max_width = 480}
		displaySprite \{PARENT = accountStatusContainer Id = options_bg_1 tex = Dialog_BG pos = (640.0, 500.0) Dims = (320.0, 64.0) Z = 9 just = [Center botom]}
		displaySprite \{PARENT = accountStatusContainer Id = options_bg_2 tex = Dialog_BG pos = (640.0, 530.0) Dims = (320.0, 64.0) Z = 9 just = [Center top] flip_h}
		createScreenElement {
			Type = containerElement
			PARENT = <vmenu_id>
			Dims = (100.0, 50.0)
			event_handlers = [
				{focus net_warning_focus}
				{unfocus net_warning_unfocus}
				{pad_choose ui_flow_manager_respond_to_action Params = {action = errorAction}}
				{pad_back ui_flow_manager_respond_to_action Params = {action = errorAction}}
			]
		}
		container_id = <Id>
		createScreenElement {
			Type = textElement
			PARENT = <container_id>
			local_id = Text
			font = fontgrid_title_gh3
			scale = 0.85
			rgba = ($menu_unfocus_color)
			Text = "TRY AGAIN"
			just = [Center top]
			z_priority = (<Z> + 0.1)
		}
		fit_text_into_menu_item Id = <Id> max_width = 480
		getScreenElementDims Id = <Id>
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_left
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Right Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
			flip_v
		}
		createScreenElement {
			Type = spriteElement
			PARENT = <container_id>
			local_id = bookend_right
			texture = Dialog_Highlight
			Alpha = 0.0
			just = [Left Center]
			pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
			z_priority = (<Z> + 0.1)
			scale = (1.0, 1.0)
		}
		clean_up_user_control_helpers
		add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
		add_user_control_helper \{Text = "BACK" button = Red Z = 100}
		launchevent Type = focus Target = <vmenu_id>
		return
	endif
	Wait \{3 Seconds}
	ui_flow_manager_respond_to_action \{action = successAction}
	NetSessionfunc \{func = stats_init}
endscript

script destroy_winport_account_management_status_screen 
	if (ScreenelementExists Id = accountStatusContainer)
		DestroyScreenelement \{Id = accountStatusContainer}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_join_private_menu 
	Printf \{"--- create_join_private_menu"}
	Z = 110
	create_menu_backdrop \{texture = Online_Background}
	createScreenElement \{Type = containerElement PARENT = root_window Id = private_menu_container pos = (0.0, 0.0) event_handlers = [{focus net_warning_focus}{unfocus net_warning_unfocus}{pad_choose executeJoinAttempt}{pad_back ui_flow_manager_respond_to_action Params = {action = Back}}]}
	NetSessionfunc \{func = InitializeLoginFields Params = {loginMode = matchUsername}}
	displaySprite \{PARENT = private_menu_container tex = Dialog_Title_BG Dims = (300.0, 250.0) Z = 9 pos = (640.0, 50.0) just = [Right top] flip_v}
	displaySprite \{PARENT = private_menu_container tex = Dialog_Title_BG Dims = (300.0, 250.0) Z = 9 pos = (640.0, 50.0) just = [Left top]}
	createScreenElement \{Type = textElement PARENT = private_menu_container font = fontgrid_title_gh3 scale = 1.0 rgba = [223 223 223 250] Text = "Join Private Match" just = [Center top] z_priority = 10.0 pos = (640.0, 145.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
	fit_text_in_rectangle Id = <Id> Dims = (400.0, 75.0) pos = (640.0, 145.0) only_if_larger_x = 1 only_if_larger_y = 1 just = Center
	createScreenElement \{Type = textElement PARENT = private_menu_container font = text_a4 scale = 1.0 rgba = [180 180 180 255] Text = "*Please use the keyboard to enter the Username of the match to join*" just = [Center top] z_priority = 10.0 pos = (640.0, 590.0) Shadow shadow_offs = (1.0, 1.0) shadow_rgba = [0 0 0 255]}
	fit_text_in_rectangle Id = <Id> Dims = (600.0, 25.0) pos = (640.0, 590.0) only_if_larger_x = 1 only_if_larger_y = 1 just = Center keep_ar = 1
	<pos> = (375.0, 320.0)
	create_winport_login_field Container = private_menu_container pos = <pos> label = "Match Username: " labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId ang = -2.0
	add_user_control_helper \{Text = "ACCEPT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	launchevent \{Type = focus Target = private_menu_container}
	begin
	update_winport_login_field \{Field = matchUsername labelId = usernameLabelId prefixId = usernamePrefixId cursorId = usernameCursorId suffixId = usernameSuffixId}
	Wait \{1 Frame}
	if NOT (ScreenelementExists Id = private_menu_container)
		return
	endif
	NetSessionfunc \{func = GetLoginEntry}
	if ((<loginEntry> = loginAccepted) || (<loginEntry> = loginAborted))
		break
	endif
	repeat
	switch <loginEntry>
		case loginAccepted
		executeJoinAttempt
		case loginAborted
		ui_flow_manager_respond_to_action \{action = Back}
	endswitch
endscript

script executeJoinAttempt 
	NetSessionfunc \{func = GeneratePrivateMatchId}
	Change gPrivateMatchId = <privateMatchId>
	ui_flow_manager_respond_to_action \{action = attempt_join}
endscript

script destroy_join_private_menu 
	NetSessionfunc \{func = DestroyLoginFields}
	DestroyScreenelement \{Id = private_menu_container}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_logout_submenu 
	Printf \{"--- create_logout_submenu"}
	create_menu_backdrop \{texture = Online_Background}
	Z = 110
	createScreenElement \{Type = containerElement PARENT = root_window Id = logoutContainer pos = (0.0, 0.0)}
	createScreenElement \{Type = VScrollingMenu PARENT = logoutContainer just = [Center top] Dims = (500.0, 150.0) pos = (640.0, 465.0) z_priority = 1}
	menu_id = <Id>
	createScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		pos = (298.0, 0.0)
		just = [Center top]
		internal_just = [Center top]
		Dims = (500.0, 150.0)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
			{pad_back ui_flow_manager_respond_to_action Params = {action = Back}}
		]
	}
	vmenu_id = <Id>
	Change \{menu_focus_color = [180 50 50 255]}
	Change \{menu_unfocus_color = [0 0 0 255]}
	create_pause_menu_frame \{PARENT = logoutContainer Z = 5}
	displaySprite \{PARENT = logoutContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Right top] flip_v}
	displaySprite \{PARENT = logoutContainer tex = Dialog_Title_BG Dims = (224.0, 224.0) Z = 9 pos = (640.0, 100.0) just = [Left top]}
	createScreenElement \{Type = textElement PARENT = logoutContainer font = fontgrid_title_gh3 scale = 1.2 rgba = [223 223 223 250] Text = "LOG OUT" just = [Center top] z_priority = 10.0 pos = (640.0, 182.0) Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]}
	createScreenElement {
		Type = textblockelement
		PARENT = logoutContainer
		Id = statusMessage
		Text = "Selecting Logout will end your current Online session.  Your scores will not be tracked in the leaderboard until you login again."
		font = text_a4
		scale = 0.8
		rgba = [210 210 210 250]
		just = [Center top]
		internal_just = [Center top]
		internal_scale = <scale>
		z_priority = <Z>
		pos = (640.0, 300.0)
		Dims = (800.0, 320.0)
		line_spacing = 1.0
	}
	fit_text_into_menu_item \{Id = statusMessage max_width = 470}
	displaySprite \{PARENT = logoutContainer Id = options_bg_1 tex = Dialog_BG pos = (640.0, 500.0) Dims = (320.0, 64.0) Z = 9 just = [Center botom]}
	displaySprite \{PARENT = logoutContainer Id = options_bg_2 tex = Dialog_BG pos = (640.0, 530.0) Dims = (320.0, 64.0) Z = 9 just = [Center top] flip_h}
	createScreenElement {
		Type = containerElement
		PARENT = <vmenu_id>
		Dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose executeLogout}
			{pad_back ui_flow_manager_respond_to_action Params = {action = Back}}
		]
	}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "LOG OUT"
		just = [Center top]
		z_priority = (<Z> + 0.1)
	}
	fit_text_into_menu_item Id = <Id> max_width = 200
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<Z> + 0.1)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<Z> + 0.1)
		scale = (1.0, 1.0)
	}
	createScreenElement {
		Type = containerElement
		PARENT = <vmenu_id>
		Dims = (100.0, 50.0)
		event_handlers = [
			{focus net_warning_focus}
			{unfocus net_warning_unfocus}
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Back}}
			{pad_back ui_flow_manager_respond_to_action Params = {action = Back}}
		]
	}
	container_id = <Id>
	createScreenElement {
		Type = textElement
		PARENT = <container_id>
		local_id = Text
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($menu_unfocus_color)
		Text = "STAY ONLINE"
		just = [Center top]
		z_priority = (<Z> + 0.1)
	}
	fit_text_into_menu_item Id = <Id> max_width = 200
	getScreenElementDims Id = <Id>
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_left
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [Right Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (-2)) + (-5.0, 0.0))
		z_priority = (<Z> + 0.1)
		scale = (1.0, 1.0)
		flip_v
	}
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		local_id = bookend_right
		texture = Dialog_Highlight
		Alpha = 0.0
		just = [Left Center]
		pos = ((0.0, 20.0) + (1.0, 0.0) * (<width> / (2)) + (5.0, 0.0))
		z_priority = (<Z> + 0.1)
		scale = (1.0, 1.0)
	}
	add_user_control_helper \{Text = "SELECT" button = Green Z = 100}
	add_user_control_helper \{Text = "BACK" button = Red Z = 100}
	add_user_control_helper \{Text = "UP/DOWN" button = Strumbar Z = 100}
	launchevent Type = focus Target = <vmenu_id>
endscript

script destroy_logout_submenu 
	DestroyScreenelement \{Id = logoutContainer}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script executeLogout 
	NetSessionfunc \{func = ResetNetwork}
	Wait \{1.0 Second}
	destroy_logout_submenu
	start_flow_manager \{flow_state = main_menu_fs}
endscript

script create_account_submenu \{menu_title = "ACCOUNT MANAGEMENT" menu_id = online_account_menu vmenu_id = online_account_vmenu}
	Change \{online_main_menu_pos = (640.0, 110.0)}
	createScreenElement \{Type = containerElement PARENT = root_window Id = account_submenu_anchor pos = (0.0, 0.0)}
	createScreenElement {
		Type = VScrollingMenu
		PARENT = account_submenu_anchor
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
			{pad_back ui_flow_manager_respond_to_action Params = {action = Back}}
			{pad_back generic_menu_pad_back}
			{pad_up generic_menu_up_or_down_sound Params = {Up}}
			{pad_down generic_menu_up_or_down_sound Params = {Down}}
		]
	}
	createScreenElement \{Type = containerElement PARENT = account_submenu_anchor Id = online_account_submenu_container pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement PARENT = online_account_submenu_container Id = online_account_submenu_text_container pos = (0.0, 0.0)}
	createScreenElement \{Type = containerElement PARENT = account_submenu_anchor Id = online_info_pane_container pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Online_Background}
	displaySprite Id = online_frame PARENT = online_account_submenu_container tex = Online_Frame_Large pos = ($online_main_menu_pos) Dims = (660.0, 480.0) just = [Center top] Z = 2
	displaySprite Id = Online_Frame_Crown PARENT = online_account_submenu_container tex = Online_Frame_Crown pos = (($online_main_menu_pos) + (0.0, -62.0)) Dims = (256.0, 105.0) just = [Center top] Z = 3
	createScreenElement {
		Type = textElement
		PARENT = online_account_submenu_text_container
		Id = online_title
		font = fontgrid_title_gh3
		scale = 0.85
		rgba = ($online_dark_purple)
		pos = (($online_main_menu_pos) + (0.0, 35.0))
		Text = <menu_title>
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
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Log Out"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_logout}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Change Password"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_change_password}
		line_spacing = 50
	}
	net_add_item_to_main_menu {
		VMenu = <vmenu_id>
		Text = "Delete Account"
		pad_choose_script = ui_flow_manager_respond_to_action
		choose_script_params = {action = execute_delete_account}
		line_spacing = 50
	}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	create_online_main_menu_helper_buttons
	launchevent Type = focus Target = <vmenu_id>
endscript

script destroy_account_submenu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenelementExists \{Id = account_submenu_anchor}
		DestroyScreenelement \{Id = account_submenu_anchor}
	endif
endscript
