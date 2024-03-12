controller_unplugged_frame_count = 5
unplugged_controller = -1

script controller_unplugged 
	Printf \{"--- controller_unplugged"}
	Change unplugged_controller = <device_num>
	if ($playing_song = 1)
		if NOT GameIsPaused
			ui_flow_manager_respond_to_action \{action = controller_disconnect}
			Change \{check_for_unplugged_controllers = 0}
		endif
	else
		if ISPS3
			create_controller_disconnect_menu
			Change \{check_for_unplugged_controllers = 0}
		endif
	endif
	if NOT GameIsPaused
		gh3_start_pressed \{no_back}
	endif
endscript

script create_controller_unplugged_dialog \{pad_choose_script = controller_refresh}
	Printf \{"--- create_controller_unplugged_dialog"}
	if ScreenelementExists \{Id = ui_mainmenu_wait_anchor}
		return
	endif
	if isxenon
		if InFrontEnd
			return
		endif
	endif
	if innetgame
		return
	endif
	if ScreenelementExists \{Id = link_lost_dialog_anchor}
		dialog_box_exit \{anchor_id = link_lost_dialog_anchor}
	endif
	sysnotify_wait_until_safe
	Wait \{1 Frame}
	sysnotify_handle_pause
	SetScreenElementLock \{Id = root_window OFF}
	if NOT InFrontEnd
		if IsMoviePlaying \{textureSlot = 0}
			PauseMovie \{textureSlot = 0}
		endif
		if IsMoviePlaying \{textureSlot = 1}
			PauseMovie \{textureSlot = 1}
		endif
	endif
	if gotParam \{leaving_net_game}
		CreatePlatformMessageBox {
			title = "CONTROLLER DISCONNECTED"
			message = "Please reconnect the controller."
			buttons = [
				"GO TO MAIN MENU"
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected \{leaving_net_game}
	else
		CreatePlatformMessageBox {
			title = "CONTROLLER"
			message = "Please reconnect the controller."
			buttons = [
				"CONTINUE"
			]
			user = <device_num>
			active_button = 0
		}
		controller_reconnected
	endif
	if NOT InFrontEnd
		if IsMoviePlaying \{textureSlot = 0}
			ResumeMovie \{textureSlot = 0}
		endif
		if IsMoviePlaying \{textureSlot = 1}
			ResumeMovie \{textureSlot = 1}
		endif
	endif
endscript

script controller_refresh 
	if (<original_device_num> = <device_num>)
		controller_reconnected <...>
		if NOT (AbortScript = DefaultAbortScript)
			Goto \{reload_anims_then_run_abort_script}
		endif
	endif
endscript

script controller_reconnected 
	if NOT gotParam \{leaving_net_game}
		if NOT InFrontEnd
			if NOT ScreenelementExists \{Id = view_goals_root}
				if NOT ScreenelementExists \{Id = timeline_vmenu}
					Restore_skater_camera
				endif
			endif
		endif
	endif
	dialog_box_exit \{anchor_id = link_lost_dialog_anchor dont_focus}
	if ScreenelementExists \{Id = controller_unplugged_dialog_anchor}
		DestroyScreenelement \{Id = controller_unplugged_dialog_anchor}
	endif
	if ScreenelementExists \{Id = keyboard_vmenu}
		launchevent \{Type = focus Target = keyboard_vmenu}
	endif
	if NOT gotParam \{leaving_net_game}
		sysnotify_handle_unpause
	endif
	if ScreenelementExists \{Id = dialog_box_anchor}
		launchevent \{Type = focus Target = dialog_box_vmenu}
		DoScreenElementMorph \{Id = dialog_box_anchor Alpha = 1}
	else
		if ScreenelementExists \{Id = current_menu_anchor}
			launchevent \{Type = focus Target = current_menu_anchor}
			if ScreenelementExists \{Id = current_menu}
				launchevent \{Type = focus Target = current_menu}
			endif
		endif
	endif
	if gotParam \{leaving_net_game}
		Printf \{"quitting network game!!!!!!!!!!!!!!!!!!!"}
		unpauseGame
		quit_network_game
	else
		Spawnscriptlater \{wait_and_check_for_unplugged_controllers}
	endif
endscript

script wait_and_check_for_unplugged_controllers \{Time = 50}
	Wait <Time>
	Change \{check_for_unplugged_controllers = 1}
endscript
